import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_for_test/nav_bar_screen.dart';
import 'package:just_for_test/product_detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  bool isExpanded = false;

  static const List<String> pageItems = ['one', 'two', 'three', 'four'];

  static const List<Color> pageItemsColor = [
    Colors.cyan,
    Colors.yellow,
    Colors.purpleAccent,
    Colors.deepOrange,
  ];

  static const List<String> categories = [
    "Electronics",
    "Fashion",
    "Beauty",
    "Home",
    "Sports",
    "Toys",
    "Groceries",
    "Books",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int itemCount = isExpanded ? categories.length : 4;
    int collapsedCount = 4;
    double collapsedHeight = (collapsedCount / 2) * 75;
    double expandedHeight = (itemCount / 2) * 80;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: width / 25, vertical: 10),
          children: [

            const SizedBox(height: 10),
        
            // app bar section
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.grid_view_rounded, color: Colors.blueGrey, size: 30,),
                ),
                const SizedBox(width: 10),
                Text('Surena Shop', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontSize: 20
                ),),
                const Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.person, color: Colors.blueGrey, size: 30,),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // search bar
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                      ),
                      cursorColor: Colors.blueGrey,
                      decoration: InputDecoration(
                        filled: false,
                        border: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        icon: Icon(Icons.search, color: Colors.blueGrey,),
                      ),
                    ),
                  ),
                  //const SizedBox(width: 8),
                  const VerticalDivider(
                    color: Colors.blueGrey,
                    thickness: 2,
                    indent: 9,
                    endIndent: 9,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.tune, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),
        
            SizedBox(
              height: 100,
              child: PageView.builder(
                itemCount: pageItems.length,
                onPageChanged: (int thisIndex) {
                  setState(() => currentIndex = thisIndex);
                },
                itemBuilder: (context, index) {
                  return Container(
                    color: pageItemsColor[index],
                    alignment: Alignment.center,
                    child: Text(
                      pageItems[index],
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pageItems.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 8,
                  width: currentIndex == index ? 15 : 8,
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 1),
                    color:
                        currentIndex == index
                            ? Colors.black12
                            : Colors.transparent,
                  ),
                );
              }),
            ),
        
            SizedBox(height: 10),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product OverView',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.grey, letterSpacing: 0.8),
                ),
              ],
            ),
        
            const SizedBox(height: 8),
        
            // Product OverView list widget
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProductDetail(),)
                    ),
                    child: Container(
                      height: 100,
                      width: width / 1.5,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          // image
                          Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.only(left: 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            alignment: Alignment.center,
                            child: Text('Image'),
                          ),
                          // column(title , price)
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Title',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              SizedBox(height: 4),

                              Text(
                                'Sub-Title',
                                style: TextStyle(
                                  //fontWeight: FontWeight.w200,
                                  color: Colors.white70,
                                  letterSpacing: 0.3,
                                ),
                              ),

                              SizedBox(height: 10),
                              Text(
                                "\$34.56",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 15),
                          // stars
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '5.4',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber.shade200,
                                      ),
                                    ],
                                  ),
                                ),

                                // increment btn
                                Expanded(
                                  child: SizedBox(
                                    height: 60,
                                    child: Align(
                                      alignment: Alignment(1.2, 1),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        
            SizedBox(height: 10),
        
            Text(
              'Category',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 0.8,
                fontWeight: FontWeight.bold,
              ),
            ),
        
            SizedBox(height: 10),
        
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: isExpanded ? expandedHeight : collapsedHeight,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 70,
                ),
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blueGrey, width: 2),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
        
            SizedBox(height: 10),
        
            InkWell(
              onTap: () => setState(() => isExpanded = !isExpanded),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: AnimatedRotation(
                turns: isExpanded ? 0.75 : 0.25,
                duration: const Duration(milliseconds: 300),
                child: Icon(Icons.double_arrow_rounded, color: Colors.blueGrey),
              ),
            ),
        
            SizedBox(height: 4),
        
            Container(
              height: height / 3.65,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade700,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/discount-icon.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: height / 40),
                        Text(
                          'Discount Product',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ProductDetail(),)
                        ),
                        child: Container(
                          width: width / 3,
                          margin: EdgeInsets.only(left: width / 45),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // image
                              Container(
                                width: 130,
                                height: 100,
                                margin: EdgeInsets.only(
                                  top: 10,
                                  right: 10,
                                  left: 10,
                                ),
                                alignment: Alignment.center,
                                child: Text('image', textAlign: TextAlign.center),
                              ),
                              // product title
                              const SizedBox(height: 8),
                              Text(
                                'Product Title',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              // product price
                              const SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                  text: 'Price: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '\$55.65',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // product Discount
                              const Divider(
                                color: Colors.red,
                                endIndent: 10,
                                indent: 10,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: 'Discount: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '\$40.65',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_circle_right_sharp, color: Colors.white, size: 40,),
                          SizedBox(height: height / 40),
                          Text(
                            'See All Product',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
