import 'dart:io';
import 'package:ahoy_hacks/widgets/drop_down_box.dart';
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
  var url = 'https://www.maptoglobe.com/H1PWi_TI5#q';

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            WebView(
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
            Positioned(
              top: 65,
              left: 22,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownBox(
                  hintText: 'Source',
                ),
              ),
            ),
            Positioned(
              top: 65,
              right: 22,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownBox(
                  hintText: 'Destination',
                ),
              ),
            ),
          ],
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
                        : 'https://www.maptoglobe.com/H1PWi_TI5#';
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
                backgroundColor: Color(0xffAEAC70),
              ),
      ),
    );
  }
}
//TODO: fix circular progress indicator
