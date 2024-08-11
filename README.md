# docker-assistant

This tool's aim is to work as a cron job on a given server to monitor docker containers for failures or shutdown and then try to restart the container(s) then notify the admin through telegram or email about the crash and the docker logs

### Start script using cronjob

```
crontab -e
```

### Add the line to end of file
```
*/5 * * * * bash /path/to/docker-assistant/start.sh
```

### Check Status 
```
sudo service cron status
```