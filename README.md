# post_test

Repro of https://github.com/flutter/flutter/issues/1343

I'm using: `nc -l 9999 ` in a separate terminal window for testing.

Currently fails in the iOS Simulator.  If you view the logs (command-/ in the simulator) it shows:

```
Jan 22 09:26:37 eseidel-macbookpro FlutterRunner[82633]: App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.
Jan 22 09:26:37 eseidel-macbookpro FlutterRunner[82633]: 2016-01-22 09:26:37.044 FlutterRunner[82633:458731] App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.
Jan 22 09:26:37 eseidel-macbookpro FlutterRunner[82633]: NetworkService unavailable MojoInternalError: Failed to register the MojoHandle.
Jan 22 09:26:37 eseidel-macbookpro FlutterRunner[82633]: Instance of 'Response'
```
