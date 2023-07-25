import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  var imageUrl ;
  final String content ; 
  final String published ;
  final String? author ; 
  final String title ;
   DetailsScreen({super.key ,required this.content ,required this.imageUrl ,
   this.author , required this.published , required this.title});

  @override
  Widget build(BuildContext context) {
//     String warningText = '''
// LONDON — Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.

// Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.

// Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.”

// “I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”

// Bailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority.

// “Investing in cryptoassets, or investments and lending linked to them, generally involves taking very high risks with investors’ money,” the financial services watchdog said in January.

// “If consumers invest in these types of product, they should be prepared to lose all their money.”

// Bailey, who was formerly the chief executive of the FCA, has long been a skeptic of crypto. In 2017, he warned: “If you want to invest in bitcoin, be prepared to lose all your money.”''';
    double myScreenH = MediaQuery.of(context).size.height;
    double myScreenW = MediaQuery.of(context).size.height;
    double screenH = 812;
    double screenW = 375;
    return Scaffold(
      body: Container(
        height: myScreenH,
        width: myScreenW,
        child: Stack(
          children: [
            Container(
              height: 400 / screenH * myScreenH,
              // width: myScreenW,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 438 / screenH * myScreenH,
                // width: myScreenW,
                decoration: BoxDecoration(
                    color: Color(0XFFFFFFFF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                padding: EdgeInsets.only(
                    top: 88 / screenH * myScreenH,
                    bottom: 16 / screenH * myScreenH,
                    left: 15 / screenW * myScreenW,
                    right: 15 / screenW * myScreenW),
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 21 / 14,
                      color: Color(
                          0xFF2E0505), // You can set the desired text color
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 376 / screenH * myScreenH,
              top: 295 / screenH * myScreenH,
              left: 32 / screenH * myScreenH,
              right: 32 / screenH * myScreenH,
              child: Container(
                height: 141 / screenH * myScreenH,
                width: 311 / screenW * myScreenW,
                padding: EdgeInsets.symmetric(
                    horizontal: 16 / screenW * myScreenW,
                    vertical: 10 / screenH * myScreenH),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(255, 206, 167, 164).withOpacity(0.5)),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          published,
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              height: 21 / 12,
                              letterSpacing: 0,
                              color: Color(0xff2E0505)),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                              fontFamily: 'NewYorkSmall',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 19.2 / 16,
                              letterSpacing: 0,
                              color: Color(0xff2E0505)),
                        ),
                        if ( author != null )
                        Text("Published by Ryan Browne",
                            style: GoogleFonts.nunito(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                height: 13.64 / 10,
                                color: Color(0xff2E0505))),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
