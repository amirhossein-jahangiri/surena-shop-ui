import 'package:flutter/material.dart';

String loremIpsum = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Add to Cart', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                '\$40.65',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25
                ),
              ),
            ),

          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 450,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Product Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
                background: Image.asset(
                  'assets/jewelry/earrings.png',
                  fit: BoxFit.cover,
                ),
              ),
              backgroundColor: Colors.grey.shade200,
              leading: Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.arrow_back_ios, size: 30, color: Colors.blueGrey,),
              ),

            ),
            SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 10),
                    Text(
                      loremIpsum,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const Divider(),
                    Text(
                      loremIpsum,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black,
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
