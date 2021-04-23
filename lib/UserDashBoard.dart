import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signuup_screens/AddProduct.dart';
import 'package:login_signuup_screens/Constants/Colors.dart';
import 'package:login_signuup_screens/DashBoard.dart';
import 'package:login_signuup_screens/Location.dart';
import 'package:login_signuup_screens/LoginScreen.dart';
import 'package:login_signuup_screens/ReviewScreen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'Location.dart';
import 'helper.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDashBoard extends StatefulWidget {
  @override
  _UserDashBoardState createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {
  int _currentIndex = 0;
  int _counter = 0;
  List<DocumentSnapshot> myProducts = [];

  ///function definition
  getProducts() {
    FirebaseFirestore.instance
        .collection('productData')
        .where('uid', isEqualTo: getUserID())
        .get()
        .then((value) => value.docs.map((product) {
              myProducts.add(product);
              setState(() {});
            }).toList());
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello Sohaib!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.grey),
                      ),
                      Column(
                        children: [
                          RaisedButton(
                            child: Text("Owner"),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashBoardScreen()));
                            },
                          ),
                          RaisedButton(
                            child: Text("Logout"),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                          ),
                        ],
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.grey,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                              "Assets/Images/CustomerReviewScreen/man2.png",
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Today",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Special For You",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: Container(
                      height: 60,
                      width: 300,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Search",
                            disabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: MyAppColors.appColor,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 10),
                    child: Container(
                      height: 65,
                      width: 65,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Icon(
                          Icons.drag_handle,
                          color: MyAppColors.appColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Container(
                      height: 40,
                      width: 80,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Align(
                            alignment: Alignment.center, child: Text("Foods")),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10),
                    child: Container(
                      height: 40,
                      width: 80,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Align(
                            alignment: Alignment.center, child: Text("Fruits")),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10),
                    child: Container(
                      height: 40,
                      width: 80,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Align(
                            alignment: Alignment.center, child: Text("Drinks")),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10),
                    child: Container(
                      height: 40,
                      width: 80,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Align(
                            alignment: Alignment.center, child: Text("Others")),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
        StreamBuilder(
        ///Stream: Stream is basically a point in db from where we are getting data
        stream: FirebaseFirestore.instance
            .collection('productData')
        .where('uid', isEqualTo: getUserID())
        .snapshots(),
    builder: (context, snapshot) {
      ///We have to put validation to check if our snapshot has data
      ///In other we will display circular  progress indicator
      if (snapshot.hasData) {
        return Container(
          height: 300,
          child: GridView.builder(
              itemCount: myProducts.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
              ),
              itemBuilder: (context, i) {
                return Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewScreen()));
                    },
                    child: Card(
                      elevation: 6,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, left: 10),
                                  child: Image.asset(
                                    "Assets/Images/DashboardScreen/emptyheart.png",
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[350],
                              ),
                              child: Image.asset(
                                "Assets/Images/DashboardScreen/watches.png",
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(snapshot.data.docs[i].data()['productName']),
                                      Text(snapshot.data.docs[i].data()['productDescription']),
                                    ],
                                  ),
                                  Text(
                                      "Price: \$${snapshot.data.docs[i].data()['productPrice']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyAppColors.appColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      }
      else {
        return CircularProgressIndicator();
      }
    }
        ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text('Home'),
            activeColor: MyAppColors.appColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "Assets/Images/DashboardScreen/emptyheart.png",
              height: 25,
            ),
            title: Text('Users'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "Assets/Images/DashboardScreen/Cart.png",
              height: 25,
              color: MyAppColors.appColor,
            ),
            title: Text(
              'Cart ',
            ),
            activeColor: MyAppColors.appColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Settings'),
            activeColor: MyAppColors.appColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
