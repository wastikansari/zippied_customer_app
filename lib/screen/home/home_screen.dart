import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zippied_app/screen/home/components/home_appbar.dart';
import 'package:zippied_app/component/msgSection.dart';
import 'package:zippied_app/providers/address_provider.dart';
import 'package:zippied_app/providers/wallet_provider.dart';
import 'package:zippied_app/screen/home/components/banner.dart';
import 'package:zippied_app/screen/home/components/service.dart';
import 'package:zippied_app/screen/home/components/topbar.dart';
import 'package:zippied_app/screen/home/components/zippied_now.dart';
import 'package:zippied_app/screen/home/components/home_without_address.dart';
import 'package:zippied_app/utiles/color.dart';
import 'package:zippied_app/widget/size_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch addresses when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AddressProvider>(context, listen: false).fetchAddresses();
      Provider.of<WalletProvider>(context, listen: false).fetchBalance();
    });

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppbarComponent(),
      ),
      body: Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
          if (addressProvider.isLoading) {
            // Show loading indicator while fetching addresses
            return const Center(child: CircularProgressIndicator());
          } else if (addressProvider.addresses.isEmpty) {
            // Show WithoutAddressSection if no addresses are available
            return const WithoutAddressSection();
          } else {
            // Show the main content if addresses are available
            return SingleChildScrollView(
              child: Column(
                children: [
                  Topbar(),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BannerSection(),
                        const Height(10),
                        const QuickSection(),
                        const Height(20),
                        const ServiceSection(),
                        const Height(20),
                        // const BookingTrackingSection(),
                        // const Height(30),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: HomeMsgSextion(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
