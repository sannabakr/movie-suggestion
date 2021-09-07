import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movies.dart';
import 'movies_screen.dart';

enum FromOrUntil { From, Until }

class FilterationsScreen extends StatefulWidget {
  @override
  _FilterationsScreenState createState() => _FilterationsScreenState();
}

class _FilterationsScreenState extends State<FilterationsScreen> {
   String dropdownRaitingValue;
  final List<String> raitingItems = [
    '1+',
    '2+',
    '3+',
    '4+',
    '5+',
    '6+',
    '7+',
    '8+',
    '9+'
  ];

   String dropdownGenreValue;
  final List<String> genres = [
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Music',
    'Mystery',
    'Western ',
    'Romance',
    'Science Fiction',
    'TV Movie',
    'Thriller',
    'War',
    'Western',
  ];
   int dropdownYearValue;
  final List<int> year = [
    2020,
    2015,
    2010,
    2005,
    2000,
    1995,
  ];
  final List<String> yearString = [
    '2020',
    '2015',
    '2010',
    '2005',
    '2000',
    '1995',
  ];
  bool fromBool() {
    if (fromOrUntil == FromOrUntil.From) {
      return true;
    } else {
      return false;
    }
  }

  var fromOrUntil = FromOrUntil.From;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final movieData = Provider.of<Movies>(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(49, 73, 60, 1),
        title: Text(
          'Movie Suggestion App',
          style: theme.textTheme.headline1,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(170, 192, 170, 1),
                borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
            width: mediaQuery.size.width * 1,
            //alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(170, 192, 170, 1),
                  //   borderRadius: BorderRadius.circular(15)
                  // ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Choose Raiting: ',
                    style: theme.textTheme.headline2,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: DropdownButton(
                      style: theme.textTheme.headline2,
                      dropdownColor: Color.fromRGBO(170, 192, 170, 1),
                      hint: Text(
                        'Raiting',
                        style: theme.textTheme.headline2,
                        textAlign: TextAlign.center,
                      ),
                      isExpanded: true,
                      value: dropdownRaitingValue,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownRaitingValue = newValue;
                        });
                      },
                      underline: Container(
                        height: 2,
                        color: Color.fromRGBO(24, 37, 31, 1),
                      ),
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      items: raitingItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(170, 192, 170, 1),
                borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
            width: mediaQuery.size.width * 1,
            //alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(170, 192, 170, 1),
                  //   borderRadius: BorderRadius.circular(15)
                  // ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Choose Genre: ',
                    style: theme.textTheme.headline2,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: DropdownButton(
                      style: theme.textTheme.headline2,
                      dropdownColor: Color.fromRGBO(170, 192, 170, 1),
                      hint: Text(
                        'Genre',
                        style: theme.textTheme.headline2,
                      ),
                      isExpanded: true,
                      value: dropdownGenreValue,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownGenreValue = newValue;
                        });
                      },
                      underline: Container(
                        height: 2,
                        color: Color.fromRGBO(24, 37, 31, 1),
                      ),
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      items:
                          genres.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(170, 192, 170, 1),
                borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
            width: mediaQuery.size.width * 1,
            //alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.all(0),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Color.fromRGBO(24, 37, 31, 1),
                    ),
                    onPressed: () {
                      if (fromOrUntil == FromOrUntil.From) {
                        setState(() {
                          fromOrUntil = FromOrUntil.Until;
                        });
                      } else {
                        setState(() {
                          fromOrUntil = FromOrUntil.From;
                        });
                      }
                    },
                    label: Text(
                      fromOrUntil == FromOrUntil.From ? 'From' : 'Until',
                      style: theme.textTheme.headline2,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(170, 192, 170, 1),
                  //   borderRadius: BorderRadius.circular(15)
                  // ),
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 0,
                  ),
                  child: Text(
                    'Year: ',
                    style: theme.textTheme.headline2,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: DropdownButton(
                      style: theme.textTheme.headline2,
                      dropdownColor: Color.fromRGBO(170, 192, 170, 1),
                      hint: Text(
                        'year',
                        style: theme.textTheme.headline2,
                      ),
                      isExpanded: true,
                      value: dropdownYearValue,
                      onChanged: (int newValue) {
                        setState(() {
                          dropdownYearValue = newValue;
                        });
                      },
                      underline: Container(
                        height: 2,
                        color: Color.fromRGBO(24, 37, 31, 1),
                      ),
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      items: year.map<DropdownMenuItem<int>>((int e) {
                        return DropdownMenuItem<int>(
                          value: e,
                          child: Text(e.toString()),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(170, 192, 170, 1),
            ),
            
            child: Text(
              'Search',
              style: theme.textTheme.headline2,
            ),
            onPressed: () {
              movieData.convertGenresToInt(dropdownGenreValue);
              movieData.convertRaitingToInt(dropdownRaitingValue);
              movieData.searchForMovie(
                fromBool(),
                dropdownYearValue,
              );
              Navigator.of(context).pushNamed(MoviesScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
