FROM natep18f/container-pa11y-test:container-build

ENV NODE_ENV=production

RUN git clone https://github.com/pa11y/pa11y-dashboard.git /pa11y-dashboard
WORKDIR /pa11y-dashboard
RUN npm install --unsafe-perm=true --allow-root

# If running Docker >= 1.13.0 use docker run's --init arg to reap zombie processes, otherwise
# uncomment the following lines to have `dumb-init` as PID 1
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_x86_64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init
ENTRYPOINT ["dumb-init", "--"]

# Uncomment to skip the chromium download when installing puppeteer. If you do,
# you'll need to launch puppeteer with:
#     browser.launch({executablePath: 'google-chrome-stable'})
#ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Install puppeteer so it's available in the container.
RUN npm init -y &&  \
    npm i puppeteer \
    # Add user so we don't need --no-sandbox.
    # same layer as npm install to keep re-chowned files from using up several hundred MBs more space
    && groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /pa11y-dashboard/node_modules \
    && chown -R pptruser:pptruser /pa11y-dashboard/package.json \
    && chown -R pptruser:pptruser /pa11y-dashboard/package-lock.json \
    && chown -R pptruser:pptruser /data/db \
    # cd to the downloaded instance
    cd /pa11y-dashboard/node_modules/pa11y/node_modules/puppeteer/.local-chromium/linux-869685/chrome-linux/ \
    && chown root:root chrome_sandbox \
    && chmod 4755 chrome_sandbox \
    # copy sandbox executable to a shared location
    && cp -p chrome_sandbox /usr/local/sbin/chrome-devel-sandbox \
    # export CHROME_DEVEL_SANDBOX env variable
    && export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox 
    
# Run everything after as non-privileged user.
USER pptruser
CMD ["google-chrome-stable" "--no-sandbox"]

EXPOSE 4000
EXPOSE 3000

CMD ["mongod"]
CMD ["node", "index.js"]
