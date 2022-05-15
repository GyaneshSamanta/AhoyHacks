import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import '../models/travel_details.dart';

class Travels with ChangeNotifier {
  String? source;
  String? destination;

  void updateSource(String src) {
    source = src;
    print("Source changed to $src");
  }

  void updateDestination(String dest) {
    destination = dest;
    print("Destination changed to $dest");
  }

  List<TravelDetails> travels = [
    TravelDetails(
      source: "Centaurea",
      destination: "reino de briss",
      sourceInfo: "Centaurea is located in South Blue.",
      destInfo:
          "The Kingdom of Briss is a kingdom in the South Blue . The galleon St. Briss comes from this place. He was mentioned during the Jaya arc.",
      pirates:
          "Shakky was last seen sailing towards reino de briss, so be on the lookout for a pirate flag!",
      trivia: "name of Shakky's husband? - Rayleigh.",
      mapUrl: "https://www.maptoglobe.com/B1qIrQALq",
    ),
    TravelDetails(
      source: "Oykot",
      destination: "Base da Alvida",
      sourceInfo:
          "he Oykot Kingdom is a country in the East Blue where Bell-mère first met Nami and Nojiko.",
      destInfo: "A place in East Blue.",
      pirates:
          "The Alvida Pirates were a group of pirates led by the female pirate 'Iron Mace' Alvida are known to sail these waters.",
      trivia: "they were the first enemy pirates Luffy was seen to encounter.",
      mapUrl: "https://www.maptoglobe.com/H1nnBQAUc",
    ),
    TravelDetails(
      source: "Oykot",
      destination: "Illa da Cabra",
      sourceInfo:
          "The Oykot Kingdom is a country in the East Blue where Bell-mère first met Nami and Nojiko.",
      destInfo:
          "Goat Island, which is only inhabited by goats and a strange man named Zenny.",
      pirates:
          "The Alvida Pirates were a group of pirates led by the female pirate 'Iron Mace' Alvida are known to sail these waters. ",
      trivia:
          "Chopper realizes that he only has three days to live and they decide to make him happy for those three days, but they don't tell him that he has three days to live.",
      mapUrl: "https://www.maptoglobe.com/H1MWUQAU5",
    ),
    TravelDetails(
      source: "Reina de whiteland",
      destination: "lvneel",
      sourceInfo: "located in North Blue",
      destInfo:
          "The Lvneel Kingdom is a kingdom in the North Blue. This is where Mont Blanc Noland was born and where he was executed. This is also Mont Blanc Cricket's ancestral home.",
      pirates:
          "Monkey D. Luffy was last seen sailing towards lvneel, last spotted at Barite Sea Restaurant.",
      trivia:
          "Though Sanji has a deep admiration of Reina, she does not take advantage of him like Nami.",
      mapUrl: "https://www.maptoglobe.com/HyGmL7CUc",
    ),
    TravelDetails(
      source: "Reina de whiteland",
      destination: "Rubeck",
      sourceInfo: "Located in North Blue",
      destInfo: "Rubeck Island is an island in North Blue.",
      pirates:
          "Diez Barrels was going to trade the Ope Ope no Mi to the Marines in exchange for a hefty amount of money. So be on the lookout for their flag!",
      trivia:
          "Nothing is known about the country's geography because it has yet to make an appearance.",
      mapUrl: "https://www.maptoglobe.com/Sk7LImA89",
    ),
    TravelDetails(
      source: "Reinade Deul",
      destination: "Lvneel",
      sourceInfo: "Located in North Blue",
      destInfo:
          "The Lvneel Kingdom is a kingdom in the North Blue. This is where Mont Blanc Noland was born and where he was executed. This is also Mont Blanc Cricket's ancestral home.",
      pirates:
          "Last known, there was a contest between the Straw Hat Pirates and the Foxy Pirates, called the 'Davy Back Fight' on these waters.",
      trivia: "Zeff, one of the deadliest pirates, runs Baratie.",
      mapUrl: "https://www.maptoglobe.com/rkBqIQ089",
    ),
    TravelDetails(
      source: "Reinade Deul",
      destination: "Rubek",
      sourceInfo: "Located in North Blue",
      destInfo: "Rubeck Island is an island in North Blue.",
      pirates:
          "Last known, there was a contest between the Straw Hat Pirates and the Foxy Pirates, called the 'Davy Back Fight' on these waters.",
      trivia: "Who is the navigator for Luffy and his crew? - Nami",
      mapUrl: "https://www.maptoglobe.com/SJ93LXA8c",
    ),
    TravelDetails(
      source: "Reina de Ballywood",
      destination: "Toroa",
      sourceInfo:
          "The Ballywood Kingdom is a nation in the West Blue[2], ruled by King Ham Burger.",
      destInfo: "Located in West Blue",
      pirates:
          "Gol D. Roger was last seen sailing towards west blue, so be on the lookout for a pirate flag!",
      trivia: "What is the village Luffy was born in? - Foosha Village",
      mapUrl: "https://www.maptoglobe.com/Byj-vX085",
    ),
  ];

  TravelDetails? get travelDetails {
    TravelDetails? tt = travels.firstWhereOrNull((travel) =>
    (travel.source == source && travel.destination == destination) ||
        (travel.source == destination && travel.destination == source));

    return tt;
  }
}
