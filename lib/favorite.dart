import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          shrinkWrap: true,
          children: [
            Text(
              'Favorite Product',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey.shade700,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 4 / 4,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [
                      // image
                      Positioned(
                        top: 5,
                        bottom: 50,
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          'assets/jewelry/wedding ring.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // favorite icon
                      Positioned(
                        right: 4,
                        top: 4,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_rounded,
                            color: Colors.blueGrey,
                            size: 30,
                          ),
                        ),
                      ),
                      // title
                      Positioned(
                        left: 6,
                        bottom: 6,
                        child: Text(
                          'Product Title',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      // price
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
