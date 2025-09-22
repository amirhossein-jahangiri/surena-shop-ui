import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/men.png'))
              ),
            ),
          ),

          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 20
                  ),
                ),
                Text(
                  '+989123456789',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey,
                      fontSize: 20
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        backgroundColor: Colors.blueGrey.shade50,
                        color: Colors.blueGrey,
                        value: 0.5,
                        minHeight: 10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      Row(
                        children: [
                          Text(
                            'Wallet Security',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey,
                                fontSize: 20
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '50%',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey,
                                fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),


                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey.shade50,
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wallet, color: Colors.blueGrey, size: 60,),
                          Text(
                            'Manage Wallet',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),



              ],
            ),
          ),


        ],
      ),
    );
  }
}
