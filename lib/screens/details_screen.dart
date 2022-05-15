import 'package:ahoy_hacks/widgets/background_image.dart';
import 'package:flutter/material.dart';

import '../models/travel_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/detailsScreen';

  @override
  Widget build(BuildContext context) {
    TravelDetails? _travelDetails =
        (ModalRoute.of(context)!.settings.arguments ??
            TravelDetails(mapUrl: 'null')) as TravelDetails;
    return SafeArea(
      child: Stack(
        children: [
          const BackgroundImage(image: 'assets/images/stars.jpg'),
          Scaffold(
            backgroundColor: Colors.black12,
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              children: [
                Text(
                  '${_travelDetails.source} to ${_travelDetails.destination} 🚢',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  "⛵ Source Information",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                    decorationColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  "${_travelDetails.sourceInfo}",
                  style: TextStyle(color: Colors.white60, fontSize: 14,),
                ),
                const SizedBox(height: 15),
                const Text(
                  "🛳️ Destination Information",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                    decorationColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  "${_travelDetails.destInfo}",
                  style: TextStyle(color: Colors.white60, fontSize: 14,),
                ),
                const SizedBox(height: 15),
                const Text(
                  "🏴‍☠️ Let's know about the Pirates",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                    decorationColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  "${_travelDetails.pirates}",
                  style: const TextStyle(color: Colors.white60, fontSize: 14,),
                ),
                const SizedBox(height: 15),
                const Text(
                  "🛎️ Some Interesting Facts",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                    decorationColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  "${_travelDetails.trivia}",
                  style: TextStyle(color: Colors.white60, fontSize: 14,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
