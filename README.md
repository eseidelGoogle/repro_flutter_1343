# post_test

Repro of https://github.com/flutter/flutter/issues/1343

Currently fails in the iOS Simulator (iPhone 6):

View the logs with command-/ in the simulator, `flutter logs` doesn't work yet. See https://github.com/flutter/flutter/issues/360.

When attempting with an http url on iOS:

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

However it now works using the https address on Android:

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

However in the iOS simulator it is missing the body!

```
Jan 22 10:10:34 eseidel-macbookpro FlutterRunner[85176]: Posting to https://httpbin.org/post
Jan 22 10:10:34 eseidel-macbookpro syslogd[85033]: Disabling module com.apple.securityd writes to /var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/security.log following 6 failures (Operation Failed)
Jan 22 10:10:34 eseidel-macbookpro FlutterRunner[85176]: Response:
Jan 22 10:10:34 eseidel-macbookpro FlutterRunner[85176]: {
	  "args": {},
	  "data": "",
	  "files": {},
	  "form": {},
	  "headers": {
	    "Accept": "application/json",
	    "Accept-Encoding": "gzip, deflate",
	    "Accept-Language": "en-us",
	    "Content-Length": "0",
	    "Content-Type": "application/json",
	    "Host": "httpbin.org",
	    "User-Agent": "Flutter/1 CFNetwork/758.0.2 Darwin/15.3.0"
	  },
	  "json": null,
	  "origin": "216.239.45.81",
	  "url": "https://httpbin.org/post"
	}
```
