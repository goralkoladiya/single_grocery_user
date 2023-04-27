// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, prefer_final_fields,   avoid_unnecessary_containers
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:singlegrocery/main.dart';
import 'package:singlegrocery/pages/authentication/Login.dart';
import 'package:singlegrocery/pages/cart/cartpage.dart';
import 'package:singlegrocery/theme/ThemeModel.dart';
import 'package:singlegrocery/common%20class/color.dart';
import 'package:singlegrocery/common%20class/height.dart';
import 'package:singlegrocery/common%20class/prefs_name.dart';
import 'package:singlegrocery/pages/profile/blogs.dart';
import 'package:singlegrocery/pages/profile/faqs.dart';
import 'package:singlegrocery/pages/profile/ourteam.dart';
import 'package:singlegrocery/pages/profile/wallet.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singlegrocery/translation/locale_keys.g.dart';
import 'aboutus.dart';
import 'gallary.dart';
import 'helpcontectus.dart';
import 'package:sizer/sizer.dart';
import 'notification.dart';
import 'privacy.dart';
import 'refer_earn.dart';
import 'testimonial.dart';
import 'changepass.dart';
import 'editprofile.dart';
import 'manage address.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  String userid = "";
  String username = "";
  String useremail = "";
  String userprofile = "";
  String user_logintype = "";
  String check_addons = "";
  bool? status;
  cartcount _cartcount = Get.put(cartcount());

  @override
  void initState() {
    super.initState();
    getprefs_data();
  }

  getprefs_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getString(UD_user_id)!;

      useremail = (prefs.getString(UD_user_email) ?? 'Guest');
      username = (prefs.getString(UD_user_name) ?? 'Guest');
      userprofile = (prefs.getString(UD_user_profileimage)!);
      user_logintype = (prefs.getString(UD_user_logintype)!);
      check_addons = (prefs.getString(App_check_addons)!);
    });
  }

  user() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themenofier, child) {
      return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
                  child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  height: 23.h,
                  width: MediaQuery.of(context).size.width,
                  color: themenofier.isdark ? Colors.white : color.black,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 4.w,
                              right: 4.w,
                              top: 5.w,
                            ),
                            child: Text(
                              LocaleKeys.Myprofile.tr(),
                              style: TextStyle(
                                  color: themenofier.isdark
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 15.sp,
                                  fontFamily: 'Poppins_semibold'),
                            ),
                          ),
                          Spacer(),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: themenofier.isdark
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              height: 5.h,
                              width: 5.h,
                              margin: EdgeInsets.only(top: 3.5.h),
                              child: InkWell(
                                  onTap: () {
                                    userid == ""
                                        ? Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (c) => Login()),
                                                (r) => false)
                                        : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Editprofile()))
                                            .then((value) {
                                            getprefs_data();
                                          });
                                  },
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'Assets/svgicon/Edit.svg',
                                      color: themenofier.isdark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ))),
                          Padding(padding: EdgeInsets.only(right: 4.8.w)),
                        ],
                      ),
                      Row(
                        children: [
                          if (userid != "") ...[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 10.5.h,
                              width: 10.5.h,
                              margin: EdgeInsets.only(
                                left: 4.w,
                                right: 4.w,
                                top: 1.3.h,
                              ),
                              child: ClipOval(
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder: AssetImage(
                                    'Assets/Image/defaultuserprofile.png',
                                  ),
                                  image: NetworkImage(
                                    userprofile.toString(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (userid == "") ...[
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 4.w,
                                    right: 4.w,
                                    top: 3.h,
                                  ),
                                  child: Text(
                                    LocaleKeys.Restaurant_User.tr(),
                                    style: TextStyle(
                                        color: themenofier.isdark
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 11.sp,
                                        fontFamily: 'Poppins_semibold'),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 4.w,
                                    right: 4.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Welcomes_you.tr(),
                                    style: TextStyle(
                                        color: themenofier.isdark
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 10.sp,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              ] else ...[
                                Container(
                                  child: Text(
                                    username,
                                    style: TextStyle(
                                        color: themenofier.isdark
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 11.sp,
                                        fontFamily: 'Poppins_semibold'),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    useremail,
                                    style: TextStyle(
                                        color: themenofier.isdark
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 10.sp,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              ],
                              // if (userid == "") ...[] else ...[]
                            ],
                          )
                        ],
                      )

                      // Row(
                      //   children: [
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(5),
                      //       ),
                      //       height: 10.5.h,
                      //       width: 11.h,
                      //       margin: EdgeInsets.only(
                      //           left: 4.w, right: 4.w, top: 1.3.h),
                      //       child: ClipRRect(
                      //         borderRadius: BorderRadius.circular(10),
                      //         child: userid == ""
                      //             ? Image.asset(
                      //                 'Assets/Image/defaultuserprofile.png')
                      //             : Image(
                      //                 image:
                      //                     NetworkImage(userprofile.toString()),
                      //                 fit: BoxFit.fill,
                      //               ),
                      //       ),
                      //     ),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         if (userid == "") ...[
                      //           Container(
                      //             margin: EdgeInsets.only(
                      //               left: 3.w,
                      //             ),
                      //             child: Text(
                      //               LocaleKeys.Gravityinfotech.tr(),
                      //               style: TextStyle(
                      //                   color: themenofier.isdark
                      //                       ? Colors.black
                      //                       : Colors.white,
                      //                   fontSize: 11.sp,
                      //                   fontFamily: 'Poppins_semibold'),
                      //             ),
                      //           ),
                      //         ] else ...[
                      //           Container(
                      //             margin: EdgeInsets.only(
                      //               left: 3.w,
                      //             ),
                      //             child: Text(
                      //               username,
                      //               style: TextStyle(
                      //                   color: themenofier.isdark
                      //                       ? Colors.black
                      //                       : Colors.white,
                      //                   fontSize: 11.sp,
                      //                   fontFamily: 'Poppins_semibold'),
                      //             ),
                      //           ),
                      //         ],
                      //         if (userid == "") ...[
                      //           Container(
                      //             margin: EdgeInsets.only(
                      //               left: 3.w,
                      //             ),
                      //             child: Text(
                      //               LocaleKeys.Infotechgravitygmail.tr(),
                      //               style: TextStyle(
                      //                   color: themenofier.isdark
                      //                       ? Colors.black
                      //                       : Colors.white,
                      //                   fontSize: 10.sp,
                      //                   fontFamily: 'Poppins'),
                      //             ),
                      //           ),
                      //         ] else ...[
                      //           Container(
                      //             margin: EdgeInsets.only(
                      //               left: 3.w,
                      //             ),
                      //             child: Text(
                      //               useremail,
                      //               style: TextStyle(
                      //                   color: themenofier.isdark
                      //                       ? Colors.black
                      //                       : Colors.white,
                      //                   fontSize: 10.sp,
                      //                   fontFamily: 'Poppins'),
                      //             ),
                      //           ),
                      //         ]
                      //       ],
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 3.5.w,
                    right: 3.5.w,
                  ),
                  child: Column(children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 1.h,
                          ),
                          height: height.settingsheight,
                          child: Row(
                            children: [
                              Text(
                                LocaleKeys.Settings.tr(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins_semibold',
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : color.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (user_logintype == "email" &&
                            check_addons == "email") ...[
                          InkWell(
                            onTap: () {
                              userid == ""
                                  ? Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (c) => Login()),
                                      (r) => false)
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Changepass()));
                            },
                            child: Container(
                              height: height.settingsheight,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'Assets/svgicon/Lock.svg',
                                    height: height.settingiconheight,
                                    color: themenofier.isdark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 3.3.w,
                                      right: 3.3.w,
                                    ),
                                    child: Text(
                                      LocaleKeys.Change_Password.tr(),
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 13.sp,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 0.8.sp,
                            width: MediaQuery.of(context).size.width,
                            color:
                                themenofier.isdark ? Colors.white : Colors.grey,
                          ),
                        ],
                        InkWell(
                          onTap: () {
                            userid == ""
                                ? Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (c) => Login()),
                                    (r) => false)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Manage_Addresses()));
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Address.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.My_Addresses.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            // print(userdata!.data!.wallet);
                            userid == ""
                                ? Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (c) => Login()),
                                    (r) => false)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Wallet()));
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Wallet.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.My_Wallet.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Ratingreview()),
                            );
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Testimonial.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Testimonials.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            userid == ""
                                ? Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (c) => Login()),
                                    (r) => false)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Refer_earn()));
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Referearn.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Refer_Earn.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            userid == ""
                                ? Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (c) => Login()),
                                    (r) => false)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Notificationpage()));
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Notification.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Notification_Settings.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            _showbottomsheet();
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Changelayout.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Change_Layout.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Helpcontactus()),
                            );
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Help.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Help_Contact_Us.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Privacypolicy()),
                            );
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Privacypolicy.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Privacy_Policy.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Aboutus()),
                            );
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Aboutus.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.About_Us.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Faqs()),
                            );
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Order.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Faqs.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gallary()),
                            );
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Gallary.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Gallery.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => Blogspage());
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/blogs.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Blogs.tr(),
                                    style: TextStyle(
                                        fontSize: 10.8.sp,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => Ourteampage());
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Referearn.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Our_Team.tr(),
                                    style: TextStyle(
                                        fontSize: 10.8.sp,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                Image.asset(
                                  'Assets/Icons/darkmode.png',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    LocaleKeys.Darkmode.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Switch.adaptive(
                                    inactiveTrackColor: Colors.grey,
                                    activeColor: Colors.white,
                                    inactiveThumbColor: Colors.black,
                                    value: themenofier.isdark ? true : false,
                                    onChanged: (value) {
                                      themenofier.isdark
                                          ? themenofier.isDark = false
                                          : themenofier.isDark = true;
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color:
                              themenofier.isdark ? Colors.white : Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            userid == ""
                                ? Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (c) => Login()),
                                    (r) => false)
                                : showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          LocaleKeys.Single_Grocery.tr(),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'Poppins_semibold'),
                                        ),
                                        content: Text(
                                          LocaleKeys
                                                  .Are_you_sure_to_logout_from_this_app
                                              .tr(),
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: 'Poppins_semibold'),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  color.primarycolor,
                                            ),
                                            child: Text(
                                              LocaleKeys.Logout.tr(),
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            onPressed: () async {
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              // prefs.clear();
                                              prefs.remove(UD_user_id);
                                              prefs.remove(UD_user_name);
                                              prefs.remove(UD_user_email);
                                              _cartcount.cartcountnumber.value =
                                                  0;
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (c) =>
                                                              Login()),
                                                      (r) => false);
                                            },
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  color.primarycolor,
                                            ),
                                            child: Text(
                                              LocaleKeys.Cancel.tr(),
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                          },
                          child: Container(
                            height: height.settingsheight,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'Assets/svgicon/Logout.svg',
                                  height: height.settingiconheight,
                                  color: themenofier.isdark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Container(
                                  // alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    left: 3.3.w,
                                    right: 3.3.w,
                                  ),
                                  child: Text(
                                    userid == ""
                                        ? LocaleKeys.Login.tr()
                                        : LocaleKeys.Logout.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.sp,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.sp,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black12,
                        ),
                      ],
                    )
                  ]),
                )
              ],
            ),
          )
        ],
      ))));
    });
  }

  _showbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (
          BuildContext context,
        ) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              height: 30.h,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 2.h,
                      bottom: 2.h,
                    ),
                    child: Text(LocaleKeys.Select_application_layout.tr(),
                        style: TextStyle(
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins')),
                  ),
                  Container(
                    height: 0.8.sp,
                    width: MediaQuery.of(context).size.width,
                    color: color.grey,
                  ),
                  SizedBox(
                    height: 7.h,
                    child: InkWell(
                      onTap: () async {
                        await context.setLocale(Locale('en'));

                        Phoenix.rebirth(context);
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.LTR.tr(),
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'Poppins_semibold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 0.8.sp,
                    width: MediaQuery.of(context).size.width,
                    color: color.grey,
                  ),
                  SizedBox(
                    height: 7.h,
                    child: InkWell(
                      onTap: () async {
                        await context.setLocale(Locale('ar'));
                        Navigator.of(context).pop();
                        Phoenix.rebirth(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.RTL.tr(),
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'Poppins_semibold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 0.8.sp,
                    width: MediaQuery.of(context).size.width,
                    color: color.grey,
                  ),
                  SizedBox(
                    height: 7.h,
                    child: InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.Cancel.tr(),
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'Poppins_semibold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}

void showNotification() {
  flutterLocalNotificationsPlugin.show(
    0,
    "single",
    "single resuaurant ?",
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id, channel.name,channel.description,
        importance: Importance.high,
        // color: Colors.blue,
        playSound: true,
        icon: '@drawable/ic_notification',
        fullScreenIntent: true,
      ),
    ),
    payload: {
      "category_name": "1",
      "category_id": "2",
      "sub_type": "3",
      "item_id": "4",
      "type": "order",
      "order_id": "252"
    }.toString(),
  );
}
