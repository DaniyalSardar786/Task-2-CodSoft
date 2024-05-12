import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quotes/Models/QuotesModel.dart';
import 'package:quotes/bookmark_screen.dart';
import 'global_vars.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<QuotesModel> _quoteFuture;
  String _quote = "Loading...";

  @override
  void initState() {
    super.initState();
    _quoteFuture = getQuote();
  }

  Future<QuotesModel> getQuote() async {
    final response = await http.get(Uri.parse("https://api.quotable.io/random"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return QuotesModel.fromJson(data);
    } else {
      throw Exception('Failed to load quote');
    }
  }

  bool isFavorite = false;
  late String currentQuote;
  late String currentAuthor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Icon(Icons.home,color: Colors.white,),
              ),
              Tab(
                child: Icon(Icons.bookmark_add,color: Colors.white,),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder<QuotesModel>(
                            future: _quoteFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                _quote = snapshot.data?.content ?? "No quote available";
                                currentQuote = _quote;
                                currentAuthor = snapshot.data?.author ?? "Unknown";
                                return Column(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            _quote,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 30,),
                                        Text(
                                          '∽ ${snapshot.data?.author ?? "Unknown"}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Share.share('"$_quote"\n∽ ${snapshot.data?.author ?? "Unknown"}');
                                              },
                                              child: const Icon(Icons.share,color: Colors.black,size: 32,)
                                          ),
                                          const SizedBox(width: 20,),
                                          GestureDetector(
                                            onTap: () {
                                              if (isFavorite) {
                                                // If the button is liked, remove the quote from the list if it's present
                                                quotes.remove(currentQuote);
                                                authors.remove(currentAuthor);
                                              } else {
                                                // If the button is unliked, add the quote to the list if it's not already present
                                                if (!quotes.contains(currentQuote)) {
                                                  quotes.insert(0, currentQuote);
                                                  authors.insert(0, currentAuthor);
                                                }
                                              }
                                              setState(() {
                                                isFavorite = !isFavorite;
                                              });
                                            },
                                            child: Icon(
                                              isFavorite ? Icons.favorite : Icons.favorite_border, // Change icon based on isFavorite value
                                              color: isFavorite ? Colors.black : Colors.black, // Change color based on isFavorite value
                                              size: 32,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = false;
                      _quoteFuture = getQuote();

                    });
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black,
                    ),
                    child: const Center(
                      child: Text(
                        "Refresh",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const BookMarks()
          ],
        ),
        backgroundColor: Colors.grey.withOpacity(.5),
      ),
    );
  }

}
