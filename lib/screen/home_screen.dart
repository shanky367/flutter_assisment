import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_assisment/adapter/RetailShopsAdapter.dart';
import 'package:flutter_assisment/models/RetailShopsDataModel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<RetailShopsDataModel>> readJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/shops_json_data.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => RetailShopsDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailShopsData>(builder: (context, taskData, child) {
      taskData.getItemsList();
      return SafeArea(child: Scaffold(body: Consumer<RetailShopsData>(
        builder: (context, taskData, child) {
          return Center(
            child: SizedBox(
              height: 300,
              child: FutureBuilder(
                future: readJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    var items = data.data as List<RetailShopsDataModel>;
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.thumb_down,
                                        color: Color(0xffad5553),
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      "Recommended for you",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          .copyWith(
                                              fontSize: 18,
                                              color: const Color(0xffad5553),
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "View all",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        .copyWith(
                                            fontSize: 16,
                                            color: const Color(0xffad5553),
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: items.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    RetailShopsDataModel data = items[index];
                                    return _buildTile(data, context);
                                  }),
                            ),
                          )
                        ]);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          );
        },
      )));
    });
  }

  Widget _buildTile(RetailShopsDataModel item, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 320,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              item.image,
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.all(20),
          ),
        ),
        Text(
          item.title + ", " + item.city,
          style: Theme.of(context).textTheme.labelLarge.copyWith(
              fontSize: 20,
              color: const Color(0xff408163),
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.thumb_up,
                    color: Color(0xff408163),
                    size: 20,
                  ),
                ),
                Text(
                  "${item.likeCount}",
                  style: Theme.of(context).textTheme.labelMedium.copyWith(
                      fontSize: 16,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.thumb_down,
                    color: Color(0xffad5553),
                    size: 20,
                  ),
                ),
                Text(
                  "${item.dislikeCount}",
                  style: Theme.of(context).textTheme.labelMedium.copyWith(
                      fontSize: 16,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: 18,
                  initialRating: double.parse('${item.ratingCount}'),
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Color(0xff0c6f33),
                  ),
                  onRatingUpdate: null,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${item.ratingCount}",
                  style: Theme.of(context).textTheme.labelMedium.copyWith(
                      fontSize: 16,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
