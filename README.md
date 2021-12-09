# EPGS-to-Discord-v2
⏺ Post EPGStation notifications to Discord via Webhook
## Setup
1. Create `config.conf` and paste your Discord Webhook URL like below:
```
URL='https://discord.com/api/webhooks/hoge/fuga'
```
2. Paste below to EPGStation's `config.yml` and edit path.

```
reserveNewAddtionCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh reserve'
reserveUpdateCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh update'
reservedeletedCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh delete'
recordingPreStartCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh prestart'
recordingPrepRecFailedCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh prepfailed'
recordingStartCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh start'
recordingFinishCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh end'
recordingFailedCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh recfailed'
```

## License
This repository is provided under the MIT License.
