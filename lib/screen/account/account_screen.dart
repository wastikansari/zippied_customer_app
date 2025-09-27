import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zippied_app/component/custom_appbar.dart';
import 'package:zippied_app/providers/auth_provider.dart';
import 'package:zippied_app/screen/account/privacy_policy_screen.dart';
import 'package:zippied_app/screen/account/profile_screen.dart';
import 'package:zippied_app/screen/address/address_screen.dart';
import 'package:zippied_app/services/bottom_navigation.dart';
import 'package:zippied_app/utiles/assets.dart';
import 'package:zippied_app/utiles/color.dart';
import 'package:zippied_app/utiles/constants.dart';
import 'package:zippied_app/utiles/designe.dart';
import 'package:zippied_app/widget/size_box.dart';
import 'package:zippied_app/widget/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void _logout() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.logout();
    // ignore: use_build_context_synchronously
    context.go('/phone');
  }

  final Uri _url = Uri.parse(
    // "https://clocare.in/privacy-policy/"
    'https://wa.me/918141116600?text=Hey%20I%20need%20help%20with%20my%20Booking.',
  );

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigation(indexSet: 0),
          ),
        );
        return false; // prevent default back behavior
      },
      child: Scaffold(
        // backgroundColor: AppColor.backgroundColors,
        backgroundColor: AppColor.bgColor,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: "Account", isBack: false),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: AppDesigne.boxDecoration,
              // decoration: BoxDecoration(
              //   color: AppColor.bgColor,
              //   borderRadius: BorderRadius.all(Radius.circular(15))

              //   ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    _buildListTile(
                      // icon: Icons.person_outline,
                      icon: AppAssets.profile,
                
                      title: 'Profile',
                      subtitle: 'Update personal information',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
                    ),
                    _buildListTile(
                      // icon: Icons.location_on_outlined,
                      icon: AppAssets.gps,
                      title: 'Addresses',
                
                      subtitle: 'Manage saved addresses',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddressScreen(),
                          ),
                        );
                      },
                    ),
                    _buildListTile(
                      // icon: Icons.description_outlined,
                      icon: AppAssets.policies,
                      title: 'Policies',
                      subtitle: 'View our Terms of Use,Policy, & more',
                      iconWidth: 35,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen(),
                          ),
                        );
                      },
                    ),
                    _buildListTile(
                      // icon: Icons.help_outline,
                      icon: AppAssets.support,
                      iconWidth: 38,
                      title: 'Help & Support',
                      subtitle: 'Need help? Contact our support team.',
                      isDivider: false,
                      onTap: () {
                        _launchUrl();
                        //whatsapp(context);
                      },
                    ),
                
                    // _buildListTile(
                    //     icon: Icons.delete_outline_outlined,
                    //     title: 'Delete Account',
                    //     subtitle: 'Deletes all your data.',
                    //     onTap: () async {
                    //       SharedPreferences prefs =
                    //           await SharedPreferences.getInstance();
                    //       var _token = prefs.getString(AppConstants.TOKEN);
                    //       print(_token);
                    //     },
                    //     isDivider: false),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required String icon,
    required String title,
    required String subtitle,
    double iconWidth = 30.0,
    bool isDivider = true,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(icon, width: iconWidth),
              // Icon(icon, color: AppColor.textColor),
              title: CustomText(
                text: title,
                size: 15,
                fontweights: FontWeight.w600,
              ),
              subtitle: Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ),
            isDivider
                ? const Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 0,
                      bottom: 0,
                    ),
                    child: Divider(color: Color.fromARGB(255, 221, 221, 221)),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
