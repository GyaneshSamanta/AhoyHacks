import 'package:ahoy_hacks/widgets/background_image.dart';
import 'package:flutter/material.dart';

import '../models/travel_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/detailsScreen';

  @override
  Widget build(BuildContext context) {
    TravelDetails _travelDetails =
        ModalRoute.of(context)!.settings.arguments as TravelDetails;
    return SafeArea(
      child: Stack(
        children: [
          const BackgroundImage(image: 'assets/images/stars.jpg'),
          Scaffold(
            backgroundColor: Colors.black12,
            body: ListView(
              children: [
                SizedBox(height: 20),
                Text(
                  "${_travelDetails.source}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 28,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "to",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      color: Colors.white),
                ),
                Text(
                  "${_travelDetails.destination}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 28,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 17),
                Text(
                  "⛵ Source Information",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 25,
                    height: 1.5,
                    decorationColor: Colors.white,
                  ),
                ),
                Text(
                  "${_travelDetails.sourceInfo}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(height: 5),
                Text(
                  "🛳️ Destination Information",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 25,
                    height: 1.5,
                    decorationColor: Colors.white,
                  ),
                ),
                Text(
                  "${_travelDetails.destInfo}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(height: 5),
                Text(
                  "🏴‍☠️ Let's know about the Pirates",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 25,
                    height: 1.5,
                    decorationColor: Colors.white,
                  ),
                ),
                Text(
                  "${_travelDetails.pirates}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(height: 5),
                Text(
                  "🛎️ Some Interesting Facts",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 25,
                    height: 1.5,
                    // decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    // decorationThickness: 2,
                  ),
                ),
                Text(
                  "${_travelDetails.trivia}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
