import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zippied_app/screen/checkout/service_category_screen.dart';
import 'package:zippied_app/utiles/assets.dart';
import 'package:zippied_app/utiles/designe.dart';
import 'package:zippied_app/widget/size_box.dart';
import 'package:zippied_app/widget/text_widget.dart';

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
          const Height(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceBox(
                title: 'Ironing',
                id: 1,
                image: AppAssets.serviceIcon1,
                onTap: () {
                  _serviceTap(1, context);
                },
              ),
              ServiceBox(
                title: 'Dry Cleaning',
                id: 4,
                image: AppAssets.serviceIcon2,
                onTap: () {
                  _serviceTap(4, context);
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
      child: 
      Image.asset(image, height: 90),
    );
  }
}

// class BookingTrackingSection extends StatelessWidget {
//   const BookingTrackingSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 200,
//       width: double.infinity,
//       decoration: AppDesigne.homeScreenBoxDecoration,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 HeadingText(text: 'Ongoing Booking'),
//                 Lottie.asset('asset/icons/tracking_v3.json', height: 30),
//               ],
//             ),
//             SmallText(
//               text: 'Pickup in 10 minutes',
//               size: 12,
//               color: Colors.redAccent,
//               letterSpacing: 0,
//             ),
//             const Height(20),
//             EasyStepper(
//               fitWidth: true,
//               direction: Axis.horizontal,
//               activeStep: 0,
//               lineStyle: LineStyle(
//                 unreachedLineColor: AppColor.textColor,
//                 activeLineColor: AppColor.appbarColor,
//                 lineLength: 80,
//                 lineThickness: 1,
//                 lineSpace: 5,
//               ),
//               stepRadius: 15,
//               unreachedStepIconColor: AppColor.textColor,
//               unreachedStepBorderColor: AppColor.textColor,
//               unreachedStepTextColor: AppColor.textColor,
//               activeStepBackgroundColor: AppColor.appbarColor,
//               activeStepBorderColor: AppColor.appbarColor,
//               activeStepTextColor: AppColor.appbarColor,
//               activeStepIconColor: AppColor.bgColor,
//               finishedStepTextColor: AppColor.appbarColor,
//               finishedStepBackgroundColor: AppColor.appbarColor,
//               showLoadingAnimation: false,
//               showTitle: true,
//               enableStepTapping: false,
//               steppingEnabled: true,
//               steps: const [
//                 EasyStep(icon: Icon(Icons.local_shipping_outlined)),
//                 EasyStep(icon: Icon(Icons.wifi_protected_setup_sharp)),
//                 EasyStep(icon: Icon(CupertinoIcons.arrow_up_bin_fill)),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           SmallText(
//                             text: 'Status: ',
//                             fontweights: FontWeight.w500,
//                           ),
//                           SmallText(
//                             text: 'Out of Pickup',
//                             color: Colors.green,
//                             fontweights: FontWeight.w500,
//                           ),
//                         ],
//                       ),
//                       const Height(10),
//                       SmallText(
//                         text: 'When',
//                         color: Colors.grey,
//                         fontweights: FontWeight.w500,
//                       ),
//                       SmallText(
//                         text: 'Today, 10:00 AM',
//                         color: AppColor.textColor,
//                         fontweights: FontWeight.w500,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Widths(20),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           SmallText(
//                             text: 'Order id: ',
//                             fontweights: FontWeight.w500,
//                           ),
//                           SmallText(
//                             text: 'ORD123',
//                             color: Colors.black,
//                             fontweights: FontWeight.w500,
//                           ),
//                         ],
//                       ),
//                       const Height(10),
//                       SmallText(
//                         text: 'Where',
//                         color: Colors.grey,
//                         fontweights: FontWeight.w500,
//                       ),
//                       SmallText(
//                         text: '123, 2nd floor, ihub, gujrat',
//                         color: AppColor.textColor,
//                         overFlow: TextOverflow.visible,
//                         fontweights: FontWeight.w500,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const Height(10),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   children: [
//             //     SizedBox(
//             //       width: 120,
//             //       child: Column(
//             //         mainAxisAlignment: MainAxisAlignment.start,
//             //         crossAxisAlignment: CrossAxisAlignment.start,
//             //         children: [
//             //           SmallText(
//             //             text: 'When',
//             //             color: Colors.grey,
//             //             fontweights: FontWeight.w500,
//             //           ),
//             //           SmallText(
//             //             text: 'Today, 10:00 AM',
//             //             color: AppColor.textColor,
//             //             fontweights: FontWeight.w500,
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //     SizedBox(
//             //       width: 120,
//             //       child: Column(
//             //         mainAxisAlignment: MainAxisAlignment.start,
//             //         crossAxisAlignment: CrossAxisAlignment.start,
//             //         children: [
//             //           SmallText(
//             //             text: 'Where',
//             //             color: Colors.grey,
//             //             fontweights: FontWeight.w500,
//             //           ),
//             //           SmallText(
//             //             text: '123, 2nd floor, ihub, gujrat',
//             //             color: AppColor.textColor,
//             //             overFlow: TextOverflow.visible,
//             //             fontweights: FontWeight.w500,
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // const Height(10),
//           ],
//         ),
//       ),
//     );
//   }
// }
