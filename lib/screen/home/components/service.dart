import 'package:zippied_app/screen/checkout/service_category_screen.dart';
import 'package:zippied_app/widget/text_widget.dart';
import 'package:zippied_app/widget/size_box.dart';
import 'package:zippied_app/utiles/designe.dart';
import 'package:zippied_app/utiles/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  void _serviceTap(int serviceId, context) {
    // print(serviceId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceCategoryScreen(serviceId: serviceId),
        // builder: (context) => CheckoutScreenV3(
        //       serviceId: serviceId,
        //     )
        // CheckoutScreen(
        //       serviceId: serviceId,
        //     )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      width: double.infinity,
      decoration: AppDesigne.homeScreenBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingText(text: 'Our Services', size: 20),
                    Lottie.asset(
                      'asset/icons/service_svg.json',
                      height: 25,
                      frameRate: FrameRate(1),
                      delegates: LottieDelegates(
                        values: [
                          ValueDelegate.color(
                            const [
                              '**',
                            ], // Wildcard to apply color to all elements
                            value: const Color.fromARGB(
                              255,
                              28,
                              155,
                              71,
                            ), // Replace with your desired color
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SmallText(
                  text: 'All your laundry needs, just a tap away.',
                  size: 12,
                  letterSpacing: 0,
                ),
              ],
            ),
          ),
          // const Height(10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     ServiceBoxV2(
          //       title: 'Ironing',
          //       id: 1,
          //       image: "asset/images/dry_cleaning.png",
          //       onTap: () {
          //         _serviceTap(1, context);
          //       },
          //     ),
          //     ServiceBoxV2(
          //       title: 'Dry',
          //       id: 4,
          //       image: "asset/images/home_cleaning.png",
          //       onTap: () {
          //         _serviceTap(4, context);
          //       },
          //     ),
          //   ],
          // ),
          const Height(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceBox(
                title: 'Dry Cleaning',
                id: 4,
                image: AppAssets.serviceIcon2,
                onTap: () {
                  _serviceTap(4, context);
                },
              ),
              ServiceBox(
                title: 'Home Cleaning',
                id: 1,
                image: AppAssets.serviceIcon1,
                onTap: () {
                  _serviceTap(1, context);
                },
              ),
            ],
          ),
          const Height(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceBox(
                title: 'Wash',
                id: 2,
                image: AppAssets.serviceIcon3,
                onTap: () {
                  _serviceTap(2, context);
                },
              ),
              ServiceBox(
                title: 'Wash + Ironing',
                id: 3,
                image: AppAssets.serviceIcon4,
                onTap: () {
                  _serviceTap(3, context);
                },
              ),
              ServiceBox(
                title: 'Shoe Cleaning',
                id: 5,
                image: AppAssets.serviceIcon5,
                onTap: () {
                  _serviceTap(5, context);
                },
              ),
            ],
          ),
          const Height(20),
        ],
      ),
    );
  }
}

class ServiceBox extends StatelessWidget {
  final String title;
  final int id;
  final Function onTap;
  final String image;
  const ServiceBox({
    super.key,
    required this.title,
    required this.id,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Image.asset(image, height: 90),
    );
  }
}

class ServiceBoxV2 extends StatelessWidget {
  final String title;
  final int id;
  final Function onTap;
  final String image;
  const ServiceBoxV2({
    super.key,
    required this.title,
    required this.id,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 90,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFDDDDDF)),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
            top: 15,
            left: 15,
            right: 0,
          ),
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SmallText(
                text: title,
                size: 15,
                fontweights: FontWeight.w500,
                color: Colors.black,
              ),

              Positioned(
                bottom: 0,
                right: 0,
                // top: 0,
                // left: 0,
                child: Image.asset(image, width: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
