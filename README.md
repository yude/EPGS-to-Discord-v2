# EPGS-to-Discord-v2
⏺ Post EPGStation notifications to Discord via Webhook
## Setup
1. Set your Webhook URL in `.env`.
```
WEBHOOK_URL='https://discord.com/api/webhooks/hoge/fuga'
```
2. Paste below to EPGStation's `config.yml` and edit path.

```
reserveNewAddtionCommand: 'cd /path/to/EPGS-to-Discord-v2 && /bin/sh run.sh reserve'
reserveUpdateCommand: 'cd /path/to/EPGS-to-Discord-v2 && /bin/sh run.sh update'
reservedeletedCommand: 'cd /path/to/EPGS-to-Discord-v2 && /bin/sh run.sh delete'
recordingPreStartCommand: 'cd /path/to/EPGS-to-Discord-v2 && /bin/sh run.sh prestart'
recordingPrepRecFailedCommand: 'cd /path/to/EPGS-to-Discord-v2 && /bin/sh run.sh prepfailed'
recordingStartCommand: 'cd /path/to/EPGS-to-Discord-v2 && /bin/sh run.sh start'
recordingFinishCommand: 'cd /path/to/EPGS-to-Discord-v2 && /bin/sh run.sh end'
recordingFailedCommand: 'cd /path/to/EPGS-to-Discord-v2 && /bin/sh run.sh recfailed'
```

## License
This repository is provided under the MIT License.
