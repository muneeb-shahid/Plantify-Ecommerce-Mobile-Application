import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackthon_application/constants/color.dart';
import 'images_of_product/images.dart';
import 'package:flutter/material.dart';
import 'package:hackthon_application/screen/detail_product.dart';
import 'order.dart';

class TopPick extends StatelessWidget {
  TopPick({super.key});
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");
  TextEditingController companyName = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();

  addProduct() {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");
    products
        .add({
          "companyName": companyName.text,
          "productName": productName.text,
          "productPrice": productPrice.text
        })
        .then((value) => print("Product Added"))
        .catchError((e) => print(e));
  }

  getAllProducts() async {
    return products.get();
  }

  topPick(context, companyName, productName, productPrice, productImage,
      rectangularColor) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailProductPage(),
            ));
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              child: Image(
                color: rectangularColor,
                image: const AssetImage("assets/images/Rectangle 27.png"),
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            child: Image(
                color: AppColors.appWhiteColor,
                image: const AssetImage('assets/images/Vector1.png')),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: Image(
                color: AppColors.appWhiteColor,
                image: const AssetImage('assets/images/Vector2.png')),
          ),
          Positioned(
              left: 30,
              top: 30,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        companyName,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const Image(
                          image: AssetImage(
                              'assets/images/detailProduct hand.png')),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                    ],
                  )
                ],
              )),
          Positioned(
              left: 30,
              top: 60,
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    productName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Colors.black),
                  ))),
          Positioned(
              left: 30,
              top: 120,
              child: Text(
                productPrice,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )),
          const Positioned(
              top: 110,
              left: 90,
              child: Image(
                  height: 70,
                  width: 70,
                  image: AssetImage('assets/images/black heart.png'))),
          Positioned(
            top: 110,
            left: 160,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderScreen(),
                    ));
              },
              child: const Image(
                  height: 70,
                  width: 70,
                  image: AssetImage('assets/images/detailproduct_add.png')),
            ),
          ),
          Positioned(
              top: 8,
              right: -20,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image(
                  image: AssetImage(productImage),
                ),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: getAllProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Column(
                          children: [
                            topPick(
                                context,
                                'Air Purifier',
                                'Watermelon',
                                '200',
                                Images().peperomiaObtusfolia,
                                AppColors.appGreenColor),
                            invitation(),
                            topPick(
                                context,
                                'Air Purifier',
                                'Croton Petra',
                                '900',
                                Images().sage,
                                AppColors.appLightBrownGreenColor),
                            topPick(
                                context,
                                'Air Purifier',
                                'Croton Petra',
                                '900',
                                Images().interiorMediumLight,
                                AppColors.appLightYellowColor),
                            videoAd(),
                            topPick(
                                context,
                                'Air Purifier',
                                'Croton Petra',
                                '900',
                                Images().layer8,
                                AppColors.appLightBlueColor),
                            topPick(
                                context,
                                'Air Purifier',
                                'Croton Petra',
                                '900',
                                Images().layer27,
                                AppColors.appLightSandColor),
                            text(),
                          ],
                        ),
                      );
                    });
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

text() {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Plant a Life",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColors.appBlackColor),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Live amongst Living",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.appBlackColor),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Spread the joy",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff002140)),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

videoAd() {
  return Stack(
    children: [
      const SizedBox(
        height: 250,
        width: 350,
      ),
      const Positioned(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                height: 170,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/Ad Vid Pic.png")),
          ],
        ),
      ),
      Positioned(
        top: 180,
        height: 200,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            "Caring for plants should be fun. That's why we offer 1-on-1 virtual consultations from the comfort of your home or office. ",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.appBlackColor,
                fontFamily: 'Poppins'),
          ),
        ),
      ),
    ],
  );
}

invitation() {
  return Stack(
    children: [
      SizedBox(
        height: 150,
        width: 300,
        child: Image.asset("assets/images/Invitation Rectangle.png"),
      ),
      const Positioned(
          top: 25,
          left: 15,
          child: Text(
            "Invite a Friend and\nearn Plantify rewards",
            style: TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          )),
      Positioned(
          top: 80,
          left: 15,
          child: Text(
            "Redeem them to get\ninstant discounts",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.appGreenColor),
          )),
      Positioned(
        top: 80,
        right: 75,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.appGreenColor,
            ),
            child: const Center(
                child: Text(
              'Invite',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
          ),
        ),
      ),
      const Positioned(
          bottom: 25,
          right: 5,
          child: Image(
              height: 50,
              image: AssetImage("assets/images/detailProduct logo (1).png"))),
    ],
  );
}
