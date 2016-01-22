# post_test

Repro of https://github.com/flutter/flutter/issues/1343

Currently fails in the iOS Simulator (iPhone 6):

View the logs with command-/ in the simulator, `flutter logs` doesn't work yet. See https://github.com/flutter/flutter/issues/360.

```
Jan 22 09:26:37 eseidel-macbookpro FlutterRunner[82633]: App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.
Jan 22 09:26:37 eseidel-macbookpro FlutterRunner[82633]: 2016-01-22 09:26:37.044 FlutterRunner[82633:458731] App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.
Jan 22 09:26:37 eseidel-macbookpro FlutterRunner[82633]: NetworkService unavailable MojoInternalError: Failed to register the MojoHandle.
Jan 22 09:26:37 eseidel-macbookpro FlutterRunner[82633]: Instance of 'Response'
```

When posting to an invalid URL on Android we get:

```
android: I/flutter : posting
android: I/flutter : NetworkService unavailable MojoInternalError: Failed to register the MojoHandle.
```

However I've now fixed it to work:

```
android: --------- beginning of main
android: --------- beginning of system
android: I/flutter : Posting to https://httpbin.org/post
android: I/flutter : Response:
android: I/flutter : {
android: I/flutter :   "args": {},
android: I/flutter :   "data": "",
android: I/flutter :   "files": {},
android: I/flutter :   "form": {
android: I/flutter :     "{\"Foo1\":\"Bar1\",\"Foo2\":\"Bar2\"}": ""
android: I/flutter :   },
android: I/flutter :   "headers": {
android: I/flutter :     "Accept": "application/json",
android: I/flutter :     "Accept-Encoding": "gzip",
android: I/flutter :     "Content-Length": "29",
android: I/flutter :     "Content-Type": "application/x-www-form-urlencoded; charset=utf8",
android: I/flutter :     "Host": "httpbin.org",
android: I/flutter :     "User-Agent": "okhttp/2.2.0"
android: I/flutter :   },
android: I/flutter :   "json": null,
android: I/flutter :   "origin": "104.135.10.51",
android: I/flutter :   "url": "https://httpbin.org/post"
android: I/flutter : }
```
