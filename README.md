# Decard

[![GitHub version](https://badge.fury.io/gh/ukhomeoffice%2Fhubot-decard.svg)](https://badge.fury.io/gh/ukhomeoffice%2Fhubot-decard) [![Build Status](https://travis-ci.org/UKHomeOffice/hubot-decard.svg?branch=master)](https://travis-ci.org/UKHomeOffice/hubot-decard) [![Docker Repository on Quay.io](https://quay.io/repository/ukhomeofficedigital/hubot-decard/status "Docker Repository on Quay.io")](https://quay.io/repository/ukhomeofficedigital/hubot-decard)

Decard is a chat bot built on the [Hubot][hubot] framework. It was
initially generated by [generator-hubot][generator-hubot], and configured to be
deployed on [Heroku][heroku] to get you up and running as quick as possible.

This particular Hubot comes with the default scripts, and the [hubot-merge-spam](https://github.com/UKHomeOffice/hubot-merge-spam) script. This periodically announce to the channel what merge requests are available. It also prints them on demand.

[heroku]: http://www.heroku.com
[hubot]: http://hubot.github.com
[generator-hubot]: https://github.com/github/generator-hubot

### Running decard Locally

You can test your hubot by running the following, however some plugins will not
behave as expected unless the [environment variables](#configuration) they rely
upon have been set.

You can start decard locally by running:

    % bin/hubot

You'll see some start up output and a prompt:

    [Sat Feb 28 2015 12:38:27 GMT+0000 (GMT)] INFO Using default redis on localhost:6379
    decard>

Then you can interact with decard by typing `decard help`.

    decard> decard help
    decard animate me <query> - The same thing as `image me`, except adds [snip]
    decard help - Displays all of the help commands that decard knows about.
    ...

### Configuration

A few scripts (including some installed by default) require environment
variables to be set as a simple form of configuration.

The default scripts that come with this bot are

```json
[
  "hubot-diagnostics",
  "hubot-help",
  "hubot-heroku-keepalive",
  "hubot-google-images",
  "hubot-google-translate",
  "hubot-pugme",
  "hubot-maps",
  "hubot-redis-brain",
  "hubot-rules",
  "hubot-shipit",
  "hubot-merge-spam"
]
```

And the `slack` adapter.

These are the environment variables for this bot

* `REDISTOGO_URL` or `REDISCLOUD_URL` or `BOXEN_REDIS_URL` or `REDIS_URL` URL format: redis://<host>:<port>[/<brain_prefix>]
* `HUBOT_SLACK_TOKEN` Your slack token
* `HUBOT_MERGE_SPAM_ANNOUNCE_ROOMS` Rooms to periodically announce the state of the PRs and MRs into. Make this empty to not announce
* `HUBOT_MERGE_SPAM_CRON` [Standard CRON](http://linuxconfig.org/linux-cron-guide) for when it should announce. Defaults to every 3 hours.
* `HUBOT_MERGE_SPAM_GITHUB_ORGANISATION` GitHub Organisation to get the Pull Requests from. If this is blank it'll disable the GitHub functionality.
* `HUBOT_MERGE_SPAM_GITHUB_AUTH_USERNAME` GitHub Username. If this or the auth token are missing it'll try to do the requests without authentication, but it'll probably hit rate limiting.
* `HUBOT_MERGE_SPAM_GITHUB_AUTH_PASSWORD` GitHub password (generate one). 
* `HUBOT_MERGE_SPAM_GITLAB_HOST` GitLab URL. If token or this are missing it'll disable the GitLab aspects. 
* `HUBOT_MERGE_SPAM_GITLAB_API_TOKEN` GitLab API Token

## Adapters

Adapters are the interface to the service you want your hubot to run on, such
as Campfire or IRC. There are a number of third party adapters that the
community have contributed. Check [Hubot Adapters][hubot-adapters] for the
available ones.

If you would like to run a non-Campfire or shell adapter you will need to add
the adapter package as a dependency to the `package.json` file in the
`dependencies` section.

Once you've added the dependency with `npm install --save` to install it you
can then run hubot with the adapter.

    % bin/hubot -a <adapter>

Where `<adapter>` is the name of your adapter without the `hubot-` prefix.

[hubot-adapters]: https://github.com/github/hubot/blob/master/docs/adapters.md

## Deploying To Heroku

    % heroku create
    % git push heroku master

If your Heroku account has been verified you can run the following to enable
and add the Redis to Go addon to your app.

    % heroku addons:add redistogo:nano

If you run into any problems, checkout Heroku's [docs][heroku-node-docs].

You'll need to edit the `Procfile` to set the name of your hubot.

More detailed documentation can be found on the [deploying hubot onto
Heroku][deploy-heroku] wiki page.

## Deploying To Docker & Kubernetes

You can use the docker container [quay.io/ukhomeofficedigital/hubot-decard](https://quay.io/repository/ukhomeofficedigital/hubot-decard), there are example k8s files in `/k8s`

### Deploying to UNIX or Windows

If you would like to deploy to either a UNIX operating system or Windows.
Please check out the [deploying hubot onto UNIX][deploy-unix] and [deploying
hubot onto Windows][deploy-windows] wiki pages.

[heroku-node-docs]: http://devcenter.heroku.com/articles/node-js
[deploy-heroku]: https://github.com/github/hubot/blob/master/docs/deploying/heroku.md
[deploy-unix]: https://github.com/github/hubot/blob/master/docs/deploying/unix.md
[deploy-windows]: https://github.com/github/hubot/blob/master/docs/deploying/unix.md
