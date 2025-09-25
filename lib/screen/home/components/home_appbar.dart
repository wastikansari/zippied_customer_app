import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zippied_app/providers/wallet_provider.dart';
import 'package:zippied_app/screen/address/address_screen.dart';
import 'package:zippied_app/screen/wallet/wallet_screen.dart';
import 'package:zippied_app/utiles/assets.dart';
import 'package:zippied_app/utiles/color.dart';
import 'package:zippied_app/widget/size_box.dart';
import 'package:zippied_app/widget/text_widget.dart';
import 'package:zippied_app/providers/address_provider.dart';
import 'package:zippied_app/models/address_model.dart';

class AppbarComponent extends StatelessWidget {
  const AppbarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
     decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
     
          colors: [
            Colors.red,
            const Color.fromARGB(255, 153, 0, 0),
          ],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 13, right: 13, top: 30, bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [AddressSection(), WalletSection()],
        ),
      ),
    );
  }
}

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WalletScreen(),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.walletV2,
                  color: AppColor.textColor,
                  height: 16,
                ),
                const Widths(6),
                Consumer<WalletProvider>(
                    builder: (context, walletProvider, child) {
                  if (walletProvider.isLoading) {
                    return SmallText(
                      text: "₹0",
                      color: AppColor.textColor,
                      fontweights: FontWeight.w500,
                    );
                  }

                  if (walletProvider.errorMessage != null) {
                    return SmallText(
                      text: "₹0",
                      color: AppColor.textColor,
                      fontweights: FontWeight.w500,
                    );
                  }

                  final balance = walletProvider.walletBalance?.data?.wallet?.totalBalance  ?.toInt() ?? 0;
                  print("Wallet Balance: $balance");

                  return SmallText(
                    text: "₹$balance",
                    color: AppColor.textColor,
                    fontweights: FontWeight.w500,
                  );
                })
              ],
            )),
      ),
    );
  }
}

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(
      builder: (context, addressProvider, child) {
        // Find the primary address
        AddressData? primaryAddress;
        if (addressProvider.addresses.isNotEmpty) {
          primaryAddress = addressProvider.addresses.firstWhere(
            (address) => address.isPrimary == true,
            orElse: () => addressProvider
                .addresses.first, // Fallback to first address if no primary
          );
        }

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddressScreen(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 30,
              ),
              const Widths(5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text: primaryAddress?.addressType ?? 'Set Address',
                    size: 16,
                    fontweights: FontWeight.w500,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: SmallText(
                          text: primaryAddress?.formatAddress ??
                              'No address selected',
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
