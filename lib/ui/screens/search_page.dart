import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leaf_snap/constants.dart';
import 'package:leaf_snap/models/plants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<Plant> _plantList = Plant.plantList;
  List<Plant> display_list = List.from(_plantList);
  void updateList(String value) {
    setState(() {
      display_list = _plantList
          .where((element) =>
              element.plantName.tr.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(211, 227, 179, 1),
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search a Leaf",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                hintText: "eg: Tulsi",
                suffixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: display_list.length == 0
                  ? Center(
                      child: Text(
                        "Not Found",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].plantName.tr,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        leading: Image(
                            image: AssetImage(display_list[index].imageURL)),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
