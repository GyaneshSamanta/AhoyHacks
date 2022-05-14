import 'dart:io';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();
  WebViewController? _webViewController;
  bool isLoading = false;
  bool isOnMap = true;
  var url = 'https://www.maptoglobe.com/BJ2vHR3Iq';

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
      ),
      floatingActionButton: isLoading
          ? const CircularProgressIndicator()
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                setState(() {
                  url = isOnMap
                      ? 'https://flutter.dev'
                      : 'https://www.maptoglobe.com/BJ2vHR3Iq';
                  isOnMap = !isOnMap;
                  _webViewController!.loadUrl(url);
                });
                setState(() {
                  isLoading = false;
                });
              },
              child: const Text(
                "Explore!",
                style: TextStyle(fontSize: 9),
              ),
              backgroundColor: Colors.grey,
            ),
    );
  }
}
//TODO: fix circular progress indicator