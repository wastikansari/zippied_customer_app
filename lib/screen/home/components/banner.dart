import 'package:flutter/material.dart';
import 'package:zippied_app/screen/checkout/service_category_screen.dart';
import 'package:zippied_app/utiles/assets.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ServiceCategoryScreen(serviceId: 0),
          ),
        );
      },
      child: Image.asset(AppAssets.bannerImage),
    );
  }
}
