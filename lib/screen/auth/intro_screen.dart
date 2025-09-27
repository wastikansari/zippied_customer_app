// import 'package:carousel_indicator/carousel_indicator.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:zippied_app/utiles/assets.dart';
// import 'package:zippied_app/widget/size_box.dart';
// import 'package:zippied_app/widget/text_widget.dart';

// class IntroScreen extends StatefulWidget {
//   const IntroScreen({super.key});

//   @override
//   State<IntroScreen> createState() => _IntroScreenState();
// }

// class _IntroScreenState extends State<IntroScreen> {
//   final List<String> _imageUrls = [
//     AppAssets.introFram1,
//     AppAssets.introFram2,
//     AppAssets.introFram3,
//   ];

//   final List<Map<String, dynamic>> textSms = [
//     {
//       'title': 'Grow with Clocare',
//       'msg': 'Expand your business, partner with us.',
//       'color': Colors.yellow,
//     },
//     {
//       'title': 'Order Management',
//       'msg': 'Offer a user-friendly app or portal for easy',
//       'color': Colors.blueAccent,
//     },
//     {
//       'title': 'Opportunities',
//       'msg': 'Broader customer base through your platform',
//       'color': Color.fromARGB(255, 0, 140, 23),
//     },
//   ];

//   int slidpageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Stack(
//                   children: [
//                     CarouselSlider(
//                       items: _imageUrls.map((url) {
//                         return Image.asset(
//                           url,
//                           fit: BoxFit.cover,
//                           width: constraints.maxWidth,
//                         );
//                       }).toList(),
//                       options: CarouselOptions(
//                         autoPlay: true,
//                         enlargeCenterPage: false,
//                         viewportFraction: 1.0,
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         height: constraints.maxHeight,
//                         padEnds: false,
//                         disableCenter: true,
//                         onPageChanged: (index, _) {
//                           setState(() {
//                             slidpageIndex = index;
//                           });
//                         },
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       child: Container(
//                         height: size.height,
//                         width: size.width,
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                             colors: [
//                               Color.fromARGB(255, 0, 0, 0),
//                               // Color.fromARGB(200, 0, 0, 0),
//                               // Color.fromARGB(190, 0, 0, 0),
//                               // Color.fromARGB(79, 0, 0, 0),
//                               Color.fromARGB(20, 0, 0, 0),
//                               Colors.transparent,
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 10,
//                       left: 0,
//                       child: Padding(
//                         padding: const EdgeInsets.all(20),
//                         child: CarouselIndicator(
//                           count: _imageUrls.length,
//                           width: 12,
//                           height: 3,
//                           index: slidpageIndex,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 30,
//                       left: 0,
//                       child: SizedBox(
//                         height: 150,
//                         width: size.width,
//                         // color: Colors.amber,
//                         child: Padding(
//                           padding: const EdgeInsets.all(15),
//                           child: CarouselSlider(
//                             items: textSms.map((value) {
//                               return Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Image.asset(
//                                     AppAssets.logo,
//                                     height: 18,
//                                     color: value['color'],
//                                   ),
//                                   SmallText(
//                                     text: value['title'].toString(),
//                                     color: value['color'],
//                                     size: 25,
//                                     fontweights: FontWeight.bold,
//                                   ),
//                                   const Height(3),
//                                   SmallText(
//                                     text: value['msg'].toString(),
//                                     color: Colors.white,
//                                     size: 14,
//                                   ),
//                                 ],
//                               );
//                             }).toList(),
//                             options: CarouselOptions(
//                               autoPlay: true,
//                               enlargeCenterPage: true,
//                               viewportFraction: 1.0,
//                               autoPlayCurve: Curves.fastOutSlowIn,
//                               // height: constraints.maxHeight,
//                               padEnds: true,
//                               disableCenter: true,
//                               onPageChanged: (index, _) {
//                                 setState(() {
//                                   slidpageIndex = index;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Container(
//               //   height: size.height / 3.5,
//               //   width: double.infinity,
//               //   // color: AppColor.darkColor,
//               //   color: AppAssets.backgroundColor,
//               //   child: Padding(
//               //     padding: const EdgeInsets.all(15),
//               //     child: Column(
//               //       children: [
//               //         const Height(20),
//               //         CustomBtnWidget(
//               //           text: "Login",
//               //           backgroundColor: AppColor.blueColor,
//               //           onTap: () {
//               //             Get.to(
//               //               const LoginScreen(),
//               //               transition: Transition.rightToLeft,
//               //             );
//               //           },
//               //           textColor: AppColor.boxColor,
//               //         ),
//               //         const Height(20),
//               //         CustomBtnWidget(
//               //           text: "Partner with Clocare",
//               //           backgroundColor: Colors.transparent,
//               //           onTap: () {
//               //             //  Get.to( PartnerDetailScreen(name: 'Wastik', mobileNo: '8327724967', city: 'Vadodara', state: 'Gujrat', cityId: 8, stateId: 9,),
//               //             //   transition: Transition.rightToLeft);
//               //             Get.to(
//               //               const RegistrationScreen(),
//               //               transition: Transition.rightToLeft,
//               //             );
//               //           },
//               //           textColor: AppColor.blueColor,
//               //         ),
//               //         const Height(20),
//               //         SmallText(
//               //           text: 'By continuing, you agree to our',
//               //           color: Colors.black,
//               //           size: 14,
//               //         ),
//               //         const Height(3),
//               //         SmallText(
//               //           text: 'Terms of Service  |  Privacy Policy',
//               //           decoration: TextDecoration.underline,
//               //           decorationStyle: TextDecorationStyle.dashed,
//               //           size: 10,
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
