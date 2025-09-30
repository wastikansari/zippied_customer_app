// import 'dart:convert';
// import 'package:clocare/backend/controller/garment_controller.dart';
// import 'package:clocare/backend/model/ui_model/garment_collect_model.dart';
// import 'package:clocare/database/basket_datatbase.dart';
// import 'package:clocare/screen/basket/widget/custom_widget.dart';
// import 'package:clocare/screen/bottom_navigation/bottom_navigation.dart';
// import 'package:clocare/screen/home/widget/home_widget.dart';
// import 'package:clocare/screen/rate_card/garment_box_widget.dart';
// import 'package:clocare/screen/widget/basket_bottom_sheet.dart';
// import 'package:clocare/screen/widget/size_box.dart';
// import 'package:clocare/screen/widget/small_text.dart';
// import 'package:clocare/utiles/constant/app_constants.dart';
// import 'package:clocare/utiles/constant/constant_data.dart';
// import 'package:clocare/utiles/themes/ColorConstants.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as badges;
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:zippied_app/utiles/color.dart';
// import 'package:zippied_app/widget/size_box.dart';
// import 'dart:developer' as logDev;

// import 'package:zippied_app/widget/text_widget.dart';

// class BasketGarmentAddScreen extends StatefulWidget {
//   final int? selectServicId;
//   const BasketGarmentAddScreen({super.key, this.selectServicId = 0});

//   @override
//   // ignore: library_private_types_in_public_api
//   _BasketGarmentAddScreenState createState() => _BasketGarmentAddScreenState();
// }

// class _BasketGarmentAddScreenState extends State<BasketGarmentAddScreen> {
//   // GarmentController garmentController = Get.put(GarmentController());
//   final GarmentController garmentController = Get.find<GarmentController>();
//   // reference the hive box
//   final basketBox = Hive.box('basketBox');
//   BasketDataBase db = BasketDataBase();
//   List<List<List<int>>> quantitiesNew = [];
//   int selectBox = 0;
//   int selectTapBox = 0;
//   double totalPrice = 0.00;
//   int totalQuantities = 0;
//   var addGarment = [];
//   var garmmentAddList = [];
//   bool alertValue = false;
//   var q1 = [];
//   var q2 = [];
//   int qtn1 = 0;
//   List qtn = [];
//   List<int> service = [0, 0, 0, 0, 0, 0];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     garmentController.getGarmentList();
//     selectBox = widget.selectServicId!;
//     setState(() {});
//   }

//   void incrementAtIndex(List<int> list, int index) {
//     if (index >= 0 && index < list.length) {
//       list[index]++;
//     }
//   }

//   void decrementAtIndex(List<int> list, int index) {
//     if (index >= 0 && index < list.length) {
//       list[index]--;
//     }
//   }

//   void updateTotalPrice(price, int serviceIndex, int b, int index) {
//     double p = double.parse(price);
//     totalPrice += p;
//     totalQuantities = totalQuantities + 1;
//     alertValue = totalPrice < 150 ? true : false;
//     if (serviceIndex >= 0 && serviceIndex < qtn.length) {
//       qtn[serviceIndex] = totalQuantities;
//     }
//     setState(() {});
//   }

//   void decrementTotalPrice(price) {
//     double p = double.parse(price);
//     totalPrice -= p;
//     totalQuantities = totalQuantities - 1;
//     alertValue = totalPrice < 150 ? true : false;
//     setState(() {});
//   }

//   void resetQuantities() {
//     service = [0, 0, 0, 0, 0, 0];
//     quantitiesNew = [];
//     totalPrice = 0.0;
//     totalQuantities = 0;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Obx(() {
//           if (garmentController.garmentModel.value.success == null) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             var serviceList = garmentController.garmentModel.value.data;
//             qtn = List<int>.filled(serviceList!.length, 0);
//             for (int i = 0; i < serviceList.length; i++) {
//               List<List<int>> row = [];
//               List datas = [];
//               var itemsList = serviceList[i].itemsList!;
//               for (int j = 0; j < itemsList.length; j++) {
//                 List<int> innerList =
//                     List<int>.filled(itemsList[j].items!.length, 0);
//                 List itemsListGarment = [];
//                 row.add(innerList);
//                 var items = itemsList[j].items;
//                 for (int k = 0; k < items!.length; k++) {
//                   Map<String, dynamic> item = {
//                     "service_id": serviceList[i].id,
//                     "service_name": serviceList[i].text,
//                     "service_icon": serviceList[i].image,
//                     "gtype_id": itemsList[j].gtypeId,
//                     "gtype_name": itemsList[j].name,
//                     "gtype_icon": itemsList[j].icon,
//                     "item_id": items[k].subtypeId,
//                     "item_price": items[k].price.toString(),
//                     "item_name": items[k].name.toString(),
//                     "item_icon": items[k].icon.toString(),
//                     "item_qty": 0,
//                   };
//                   itemsListGarment.add(item);
//                   Item myItem = Item.fromJson(item);
//                   garmmentAddList.add(myItem);
//                 }
//                 datas.add(itemsListGarment);
//               }
//               addGarment.add(datas);
//               quantitiesNew.add(row);
//             }
//             return Column(children: [
//               SizedBox(
//                 height: 290,
//                 // color: const Color.fromARGB(255, 222, 222, 222),
//                 child: Stack(
//                   children: [
//                     Container(
//                       height: 210,
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                             "asset/images/Group 10.png",
//                           ),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           left: 13,
//                           right: 13,
//                           top: 15,
//                         ),
//                         child: Column(
//                           children: [
//                             const Height(40),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 10),
//                                       child: iconCircleBtn(
//                                         image: "asset/images/back_button.png",
//                                         onTap: () {
//                                           Get.back();
//                                         },
//                                       ),
//                                     ),
//                                     SmallText(
//                                       text: "My Basket",
//                                       color: Colors.white,
//                                       size: 20,
//                                       fontweights: FontWeight.bold,
//                                     ),
//                                   ],
//                                 ),
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.refresh,
//                                     color: AppColor.backgroundColor,
//                                   ),
//                                   onPressed: () {
//                                     resetQuantities();
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: Padding(
//                         padding:
//                             const EdgeInsets.only(left: 13, right: 13, top: 15),
//                         child: Container(
//                           // height: 160,
//                           decoration: BoxDecoration(
//                               color: AppColor.boxBorderColor,
//                               border: Border.all(
//                                   color: AppColor.boxBorderColor, width: 3),
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(12))),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 130,
//                                 child: Padding(
//                                     padding: const EdgeInsets.all(10),
//                                     child: GridView.builder(
//                                         padding: EdgeInsets.zero,
//                                         physics:
//                                           const NeverScrollableScrollPhysics(),
//                                         shrinkWrap: true,
//                                         itemCount: servicesNameData.length - 1,
//                                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                                 crossAxisCount: 3,
//                                                 mainAxisSpacing: 7,
//                                                 crossAxisSpacing: 7,
//                                                 childAspectRatio: 2),
//                                         itemBuilder: (BuildContext context, int index) {
//                                           var data = servicesNameData[index];
//                                           return ServiceBoxWidget(
//                                             icon: data['icon'],
//                                             title: data['title'],
//                                             title1: data['title1'],
//                                             borderColor: selectBox == index
//                                                 ? AppColor.blueColor2
//                                                 : AppColor.boxBgColor,
//                                             bgColor: selectBox == index
//                                                 ? Colors.white
//                                                 : AppColor.boxBgColor,
//                                             onTap: () {
                                              
//                                               setState(() {
//                                                 selectBox = index;
//                                               });
                                             
//                                             },
//                                             onOfClothe: service[index],
//                                           );
//                                         })),
//                               ),
//                               Container(
//                                 height: 50,
//                                 width: double.infinity,
//                                 decoration: const BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(9),
//                                         bottomRight: Radius.circular(9))),
//                                 child: ListView.builder(
//                                     scrollDirection: Axis.horizontal,
//                                     itemCount: serviceList[selectBox]
//                                         .itemsList!
//                                         .length,
//                                     itemBuilder: (context, index) {
//                                       return CustomTapBar(
//                                         title: serviceList[selectBox]
//                                             .itemsList![index]
//                                             .name
//                                             .toString(),
//                                         onTap: () {
                                    
//                                           setState(() {
//                                             selectTapBox = index;
//                                           });
//                                         },
//                                         bgColor: selectTapBox == index
//                                             ? Colors.white
//                                             : AppColor.boxBgColor,
//                                       );
//                                     }),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                   child: Container(
//                 decoration: const BoxDecoration(
//                   // color: Color.fromARGB(255, 227, 227, 227),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16.0),
//                     topRight: Radius.circular(16.0),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           // for (int i = 0;
//                           //     i < serviceList[selectBox].itemsList!.length;
//                           //     i++)
//                           Expanded(
//                             child: ListView.builder(
//                               padding: EdgeInsetsDirectional.zero,
//                               itemCount: serviceList[selectBox].itemsList![selectTapBox].items!.length,
//                               itemBuilder: (context, index) {
//                                 var datas = serviceList[selectBox].itemsList![selectTapBox].items![index];
//                                 String garmentName = datas.name.toString();
//                                 String price = datas.price.toString();
//                                 String image = datas.icon.toString();
//                                 String url = AppConstants.IMAGE_BASE_URL + image;
//                                 // '${AppConstants.BASE_URL1}/uploads/$image';
//                                 int b = serviceList[selectBox].itemsList!.indexOf(serviceList[selectBox].itemsList![selectTapBox]);
//                                 int serviceIndex = serviceList.indexOf(serviceList[selectBox]);
//                                 int quantity = quantitiesNew[serviceIndex][b][index];

//                                 return GarmentBoxWidget(
//                                   icon: url,
//                                   name: garmentName,
//                                   price: '₹$price',
//                                   qty: addGarment[serviceIndex][b][index]['item_qty'],
//                                   add: () {
//                                     setState(() {
//                                       addGarment[serviceIndex][b][index]['item_qty']++;
//                                       quantity = quantitiesNew[serviceIndex][b][index]++;
//                                       updateTotalPrice( price, serviceIndex, b, index); 
//                                       qtn[serviceIndex]++;
//                                     });
//                                     incrementAtIndex(service, selectBox);
//                                   },
//                                   remove: () {
//                                     if (quantity > 0) {
//                                       setState(() {
//                                         addGarment[serviceIndex][b][index]
//                                             ['item_qty']--;
//                                         quantity = quantitiesNew[serviceIndex]
//                                             [b][index]--;

//                                         qtn[serviceIndex]--;
//                                         decrementTotalPrice(price);
//                                       });
//                                       decrementAtIndex(service, selectBox);
//                                     }
//                                   },
//                                   quantity: '$quantity',
//                                   addFirstTime: () {
//                                     setState(() {
//                                       addGarment[serviceIndex][b][index]
//                                           ['item_qty']++;
//                                       quantity = quantitiesNew[serviceIndex][b]
//                                           [index]++;
//                                       updateTotalPrice(
//                                           price, serviceIndex, b, index);
//                                       qtn[serviceIndex]++;
//                                       incrementAtIndex(service, selectBox);
//                                     });
//                                   },
//                                 );
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     // if (totalQuantities > 0)
//                       // BasketBottomSheetV2(
//                       //   totalItems: totalQuantities.toString(),
//                       //   totalPrice: totalPrice.toString(),
//                       //   deliveryCharge: 50,
//                       //   miniOrderAmount: 150,
//                       //   alert: alertValue,
//                       //   btnTap: () {
//                       //     orderSave();
//                       //   },
//                       // )
//                   ],
//                 ),
//               ))
//             ]);
//           }
//         }));
//   }

//   // void orderSave() {
//   //   List<Service> selectedServices = [];
//   //   // Collect all garments
//   //   for (int i = 0; i < addGarment.length; i++) {
//   //     for (int j = 0; j < addGarment[i].length; j++) {
//   //       List<Items> items = [];
//   //       for (int k = 0; k < addGarment[i][j].length; k++) {
//   //         if (addGarment[i][j][k]["item_qty"] > 0) {
//   //           items.add(Items(
//   //             itemId: int.parse(addGarment[i][j][k]["item_id"]),
//   //             itemName: addGarment[i][j][k]["item_name"],
//   //             itemIcon: addGarment[i][j][k]["item_icon"],
//   //             itemPrice: addGarment[i][j][k]["item_price"],
//   //             itemQty: int.parse(addGarment[i][j][k]["item_qty"]),
//   //           ));
//   //         }
//   //       }

//   //       if (items.isNotEmpty) {
//   //         int gtypeId = addGarment[i][j][0]["gtype_id"];
//   //         String gtypeName = addGarment[i][j][0]["gtype_name"];
//   //         String gtypeIcon = addGarment[i][j][0]["gtype_icon"];
//   //         // Check if service already exists
//   //         Service? existingService = selectedServices.firstWhere(
//   //           (service) =>
//   //               service.serviceId ==
//   //               int.parse(addGarment[i][0][0]["service_id"]),
//   //           orElse: () => Service(
//   //               serviceId: int.parse(addGarment[i][0][0]["service_id"]),
//   //               serviceName: addGarment[i][0][0]["service_name"],
//   //               serviceIcon: addGarment[i][0][0]["service_icon"],
//   //               garmentTypes: []),
//   //         );
//   //         // Add garment type to the service
//   //         existingService.garmentTypes.add(GarmentType(
//   //           gtypeId: gtypeId,
//   //           gtypeName: gtypeName,
//   //           gtypeIcon: gtypeIcon,
//   //           items: items,
//   //         ));
//   //         // If new, add service to list
//   //         if (!selectedServices.contains(existingService)) {
//   //           selectedServices.add(existingService);
//   //         }
//   //       }
//   //     }
//   //   }

//   //   Baskets baskets = Baskets(
//   //       totalItems: totalQuantities,
//   //       totalAmount: totalPrice,
//   //       pdCharges: totalPrice < AppConstants.MINI_ORDER_AMOUNT
//   //           ? AppConstants.DELIVERY_CHARGES
//   //           : 0,
//   //       services: []);

//   //   // Convert the selected services into JSON format
//   //   logDev.log("Formatted Data: $service");
//   //   String jsonString = json
//   //       .encode(selectedServices.map((service) => service.toJson()).toList());

//   //   // setState(() {
//   //   //   List basketList = [jsonString, data];
//   //   //   db.updateDataBase(basketList);
//   //   // });

//   //   Get.to(() => const BottomNavigation(indexset: 2),
//   //       transition: Transition.leftToRightWithFade);
//   // }

//   void orderSave() {
//     List selectGarment = [];
//     Map data = {
//       "items": totalQuantities.toString(),
//       "price": totalPrice,
//     };
//     if (totalPrice < 150) {
//       data["delivery_charge"] = 50;
//     } else {
//       data["delivery_charge"] = 0;
//     }

//     for (int i = 0; i < addGarment.length; i++) {
//       for (int j = 0; j < addGarment[i].length; j++) {
//         for (int k = 0; k < addGarment[i][j].length; k++) {
//           if (addGarment[i][j][k]["item_qty"] > 0) {
//             Map<String, dynamic> item = {
//               "service_id": addGarment[i][j][k]["service_id"],
//               "service_name": addGarment[i][j][k]["service_name"],
//               "service_icon": addGarment[i][j][k]["service_icon"],
//               "gtype_id": addGarment[i][j][k]["gtype_id"],
//               "gtype_name": addGarment[i][j][k]["gtype_name"],
//               "gtype_icon": addGarment[i][j][k]["gtype_icon"],
//               "item_id": addGarment[i][j][k]["item_id"],
//               "item_price": addGarment[i][j][k]["item_price"],
//               "item_name": addGarment[i][j][k]["item_name"],
//               "item_icon": addGarment[i][j][k]["item_icon"],
//               "item_qty": addGarment[i][j][k]["item_qty"],
//             };
//             selectGarment.add(item);
//           }
//         }
//       }
//     }
//     final formattedData = <Map<String, dynamic>>[];
//     final groupedData = <dynamic, Map<String, dynamic>>{};

//     for (final item in selectGarment) {
//       final serviceId = item["service_id"];
//       int gtypeId = item["gtype_id"];

//       if (!groupedData.containsKey(serviceId)) {
//         groupedData[serviceId] = {
//           "service_id": serviceId,
//           "service_name": item["service_name"],
//           "service_icon": item["service_icon"],
//           "gtype": [],
//         };
//       }

//       var gtype = groupedData[serviceId]!["gtype"].firstWhere(
//         (element) => element["gtype_id"] == gtypeId,
//         orElse: () {
//           var newGType = {
//             "gtype_id": gtypeId,
//             "gtype_name": item["gtype_name"],
//             "gtype_icon": item["gtype_icon"],
//             "items": [],
//           };
//           groupedData[serviceId]!["gtype"].add(newGType);
//           return newGType;
//         },
//       );

//       gtype["items"].add({
//         "item_id": item["item_id"],
//         "item_price": item["item_price"],
//         "item_name": item["item_name"],
//         "item_icon": item["item_icon"],
//         "item_qty": item["item_qty"],
//       });
//     }
//     formattedData.addAll(groupedData.values);
//     // logDev.log("formattedData data log 1 $formattedData");

//     // Convert the list to a JSON-formatted string
//     String jsonString = json.encode(formattedData);
//     logDev.log("formattedData data log 22222222222 $jsonString");

//     setState(() {
//       // List basketList = [formattedData, data];
//       List basketList = [jsonString, data];
//       db.updateDataBase(basketList);
//     });
//     // Get.to(
//     //     () => const BottomNavigation(
//     //           indexset: 2,
//     //         ),
//     //     transition: Transition.leftToRightWithFade);
//   }
// }





// class GarmentBoxWidget extends StatelessWidget {
//   final String icon;
//   final String name;
//   final String quantity;
//   final String price;
//   final Function add;
//   final Function remove;
//   final Function addFirstTime;
//   final int qty;

//   const GarmentBoxWidget(
//       {super.key,
//       required this.icon,
//       required this.name,
//       required this.price,
//       required this.add,
//       required this.remove,
//       required this.quantity,
//       required this.qty,
//       required this.addFirstTime});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
//       child: Container(
//         // height: 70,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(40)),
//           border: Border.all(color: const Color(0xFFCEDBF0), width: 1.3),
//           color: Colors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     const Widths(6),
//                     SizedBox(
//                       width: 35,
//                       height: 35,
//                       child: Image.network(icon),
//                     ),
//                     const Widths(10),
//                     Container(
//                       width: 0.5,
//                       height: 40,
//                       color: const Color(0xFFACC2E4),
//                     ),
//                     const Widths(15),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 120,
//                           child: SmallText(
//                             text: name,
//                             size: 14,
//                             overFlow: TextOverflow.fade,
//                             color: Colors.black,
//                             fontweights: FontWeight.w500,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SmallText(
//                               text: price,
//                               size: 14,
//                               color: const Color(0xFF76B84C),
//                               fontweights: FontWeight.w500,
//                             ),
//                             const Widths(4),
//                             SmallText(
//                               text: 'Per piece',
//                               size: 9,
//                               color: Colors.black,
//                               fontweights: FontWeight.w500,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 qty > 0
//                     ? Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: AppColor.appbarColor),
//                         child: Padding(
//                           padding: const EdgeInsets.all(9),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 InkWell(
//                                     onTap: () {
//                                       remove();
//                                     },
//                                     child: const Icon(
//                                       Icons.remove_circle_outline_outlined,
//                                       color: Colors.white,
//                                       size: 20,
//                                     )),
//                                 const Widths(9),
//                                 SmallText(
//                                   text: quantity,
//                                   color: Colors.white,
//                                   size: 16,
//                                 ),
//                                 const Widths(9),
//                                 InkWell(
//                                   onTap: () {
//                                     add();
//                                   },
//                                   child: const Icon(
//                                     Icons.add_circle_outline_rounded,
//                                     color: Colors.white,
//                                     size: 20,
//                                   ),
//                                 )
//                               ]),
//                         ),
//                       )
//                     : InkWell(
//                         onTap: () {
//                           addFirstTime();
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(50),
//                               color: AppColor.appbarColor),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 bottom: 9, top: 9, left: 12, right: 12),
//                             child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Image.asset(
//                                     "asset/images/basket.png",
//                                     width: 18,
//                                     color: Colors.white,
//                                   ),
//                                   const Widths(9),
//                                   SmallText(
//                                     text: 'ADD',
//                                     color: Colors.white,
//                                     fontweights: FontWeight.bold,
//                                     size: 13,
//                                   ),
//                                 ]),
//                           ),
//                         ),
//                       )
//               ]),
//         ),
//       ),
//     );
//   }
// }
