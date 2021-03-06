import 'dart:io';
import '../widgets/drop_down_box.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'details_screen.dart';
import 'package:provider/provider.dart';
import '../providers/travels.dart';
import '../models/travel_details.dart';

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
  var mapUrl = 'https://www.maptoglobe.com/H1PWi_TI5';
  TravelDetails? travelDetails;

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
              initialUrl: mapUrl,
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                  heroTag: 'Restaurants',
                  onPressed: () {
                    setState(() {
                      mapUrl = 'https://www.maptoglobe.com/SJUgBQA89';
                      _webViewController!.loadUrl(mapUrl);
                      print("Map loaded: $mapUrl");
                    });
                  },
                  child: Icon(Icons.food_bank_outlined),
                  backgroundColor: const Color(0xffAEAC70)),
              FloatingActionButton(
                heroTag: 'Details',
                onPressed: isLoading
                    ? null
                    : () {
                        travelDetails =
                            Provider.of<Travels>(context, listen: false)
                                .travelDetails;
                        if (travelDetails == null) {
                          print("Null hai bhai");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                              'Cannot pass through the calm belt or the grindline',
                            ),
                            action: SnackBarAction(
                                label: 'Dismiss',
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                }),
                          ));
                        } else {
                          Navigator.of(context).pushNamed(
                              DetailsScreen.routeName,
                              arguments: travelDetails);
                        }
                      },
                child: const Icon(Icons.arrow_upward_sharp),
                backgroundColor: const Color(0xffAEAC70),
              ),
              FloatingActionButton(
                heroTag: 'Explore',
                onPressed: isLoading
                    ? null
                    : () {
                        setState(() {
                          isLoading = true;
                        });
                        setState(() {
                          travelDetails =
                              Provider.of<Travels>(context, listen: false)
                                  .travelDetails;
                          if (travelDetails == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                'Cannot pass through the calm belt or the grindline',
                              ),
                              action: SnackBarAction(
                                  label: 'Dismiss',
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  }),
                            ));
                            print("Null hai bhai");
                          } else {
                            mapUrl = travelDetails!.mapUrl;
                            _webViewController!.loadUrl(mapUrl);
                            print("Map loaded: $mapUrl");
                          }
                        });
                        setState(() {
                          isLoading = false;
                        });
                      },
                child: const Text(
                  "Go!",
                  style: TextStyle(fontSize: 9),
                ),
                backgroundColor: const Color(0xffAEAC70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//TODO: fix circular progress indicator
