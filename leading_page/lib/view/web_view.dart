import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leading_page/common/title_widget.dart';
import 'package:leading_page/main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../common/custom_grid.dart';
import '../common/custom_profile_image_view.dart';
import '../common/custom_tile.dart';

class WebViewScreen extends StatefulWidget {

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var speedList = [
    {'logo_img': 'assets/feather_clock.png', 'title': 'Chorny'},
    {'logo_img': 'assets/high_roller.png', 'title': 'High Roller'},
    {'logo_img': 'assets/essertric.png', 'title': 'Essertric'},
    {'logo_img': 'assets/lurker.png', 'title': 'Lurker'},
  ];

  var queuingList = [
    {
      'title': 'Chrony Lounge',
      'content':
          'Chrony: A Guest who is waiting in chronological order.The amount of their support is fixed by the Host, called suggested support. First come, first serve.'
    },
    {
      'title': 'Eccentric Lounge',
      'content':
          'Eccentric: A Guest who offers support using coins of subjective value. For example, an Eccentric could offer their Host art or ticket NFTs.'
    },
    {
      'title': 'High Roller Lounge',
      'content':
          'High Roller: A Guest who offers higher than the suggested support¢. Higher support, first serve.'
    },
    {
      'title': 'Lurker Lounge',
      'content':
          'Lurker : A Guest who just wants to see what is going on. Lurkers do not provide support¢ and do not get to meet the Host. Lurkers help the Host to see potential demand.'
    },
  ];

  var featureList = [
    {
      'feature_icon': "assets/coin_ango.png",
      'title': "Coin Agnostics",
      'content':
          "2i2i does not promote any specific coin. Guests can offer their support in any coin (on Algorand)."
    },
    {
      'feature_icon': "assets/green.png",
      'title': "Green",
      'content':
          "The backbone of 2i2i is Algorand which is a carbon negative blockchain. Peer-to-peer meetings minimise the transferred data."
    },
    {
      'feature_icon': "assets/safe.png",
      'title': "Safe",
      'content':
          "Users can keep their coins on their own 3rd party wallets or non-custodial device wallets."
    },
    {
      'feature_icon': "assets/scale.png",
      'title': "Scalable",
      'content':
          "Having peer-to-peer meetings allows 2i2i to connect large amounts of people without increasing the IT cost."
    },
    {
      'feature_icon': "assets/private.png",
      'title': "Private",
      'content':
          "All meetings are streamed peer-to-peer and are end-to-end encrypted. This means, your meetings are fully private and cannot be accessed by anyone, not even 2i2i."
    },
    {
      'feature_icon': "assets/zero.png",
      'title': "Zero Risk",
      'content':
          "All coin transactions are executed trustlessly on the Algorand blockchain. Whether tiny or huge amounts, we do not get access to your coins"
    },
  ];

  var roadMapList = [
    {'title': "Chrony Lounge", 'content': "Will be implemented soon"},
    {
      'title': "Eccentric Lounge",
      'content': "Will be implemented after the Chrony Lounge"
    },
    {
      'title': "Zero risk",
      'content':
          "Guests offer support to the Host by locking coins in a smart contract. Once the Host and Guest have finished their meeting, 2i2i acts as an Oracle and tells the smart contract to release the coins for the Host. Before the meeting has started, the Guest can change their mind and cancel. This results in the locked coins being sent back to the Guest. Currently, the Guest has to rely on 2i2i to initiate the cancel transaction. To truly make the process trustless, the next version of the smart contract will provide the Guest with tokens in exchange for locking their coins. This will allow Guests to cancel without the permission of 2i2i."
    },
    {
      'title': "Coin agonistic",
      'content':
          "The tech has been implemented to support any coin (on Algorand) from the beginning. To make the experience smoother for initial adaptation, 2i2i will release this feature in the future together with the release of the ‘Eccentric Lounge’. Currently, only ALGO is supported."
    },
  ];

  EdgeInsetsGeometry margin({double vertical = 10, double? horizontal}) {
    return EdgeInsets.symmetric(
        horizontal: horizontal ?? 8.w, vertical: vertical);
  }

  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    margin(horizontal: 8.w);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          introTileWidget(context),
          queuingWidget(context),
          customizationWidget(context),
          featureWidget(context),
          roadMapWidget(context),
          ourPhilosophyWidget(context),
          teamWidget(context),
          getAppWidget(context),
          footerWidget(context),
          Container(
            height: 8.h,
          )
        ],
      ),
    );
  }

  Container introTileWidget(BuildContext context) {
    return Container(
      padding: margin(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          Center(
            child: Image.asset(
              'assets/app_logo.png',
              height: 16.h,
            ),
          ),
          SizedBox(height: 4.h),
          Center(
            child: Text(
              'The place for you to hang out',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(height: 2.h),
          Center(
            child: Text(
              '2i2i provides a safe and private space for Guests and Hosts to meet\nin the form of video calls',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 3.5.h),
          Center(
            child: Image.asset(
              'assets/try_button.png',
              height: 10.h,
            ),
          ),
          SizedBox(height: 4.h),
          Center(
            child: ScrollConfiguration(
              behavior: AppScrollBehavior(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      speedList.length,
                      (index) => Container(
                            height: 20.h,
                            width: 20.h,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Center(
                                        child: Image.asset(
                                          speedList[index]['logo_img']!,
                                          height: 12.h,
                                        ),
                                      ),
                                      flex: 3),
                                  Expanded(
                                    child: Center(
                                      child: Text(speedList[index]['title']!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container queuingWidget(BuildContext context) {
    return Container(
      padding: margin(),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 14.h),
                const TitleWidget(text: '2i2i provides a\nqueuing system'),
                SizedBox(height: 4.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        children: List.generate(
                            queuingList.length,
                            (index) => Stack(
                                  children: [
                                    Card(
                                      shadowColor: const Color.fromRGBO(
                                          102, 153, 141, 0.2),
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      elevation: 8,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 12),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.5.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              queuingList[index]['title']!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Theme.of(context)
                                                          .cardColor),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              queuingList[index]['content']!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button
                                                  ?.copyWith(
                                                      color: Theme.of(context)
                                                          .shadowColor,
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.normal),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 2.5.h,
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor:
                                            Theme.of(context).cardColor,
                                        child: Center(
                                          child: Text(
                                            '${index + 1}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: Theme.of(context)
                                                        .primaryColorLight),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                SizedBox(height: 14.h),
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 8.h,
              ),
              Image.asset('assets/chrony.png', height: 14.h, width: 28.h),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Image.asset('assets/high_roller_support.png',
                        height: 14.h, width: 28.h),
                    const Spacer(),
                    Card(
                      elevation: 4.0,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.none,
                      child: CircleAvatar(
                        radius: 4.h,
                        backgroundImage: const AssetImage('assets/host.png'),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Image.asset('assets/essertic.png', height: 14.h, width: 28.h),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  Image.asset('assets/lurker_support.png',
                      height: 14.h, width: 28.h),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Row customizationWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWidget(text: 'Customization'),
                SizedBox(height: 4.h),
                Card(
                  shadowColor: const Color.fromRGBO(102, 153, 141, 0.2),
                  color: Theme.of(context).primaryColorLight,
                  elevation: 10,
                  margin: EdgeInsets.only(right: 8.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Text(
                          'The Host can',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).cardColor),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon/arrow.svg',
                            width: 8.h,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                              child: Text(
                            'Fix the amount of suggested support ( in the Chrony Lounge )',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).shadowColor),
                          ))
                        ],
                      ),
                      SizedBox(height: 1.2.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon/arrow.svg',
                            width: 8.h,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                              child: Text(
                            'Set the maximum duration of meetings',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).shadowColor),
                          ))
                        ],
                      ),
                      SizedBox(height: 1.2.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon/arrow.svg',
                            width: 8.h,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                              child: Text(
                            'Choose the importance for each lounge',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).shadowColor),
                          ))
                        ],
                      ),
                      SizedBox(height: 3.h),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Card(
                  shadowColor: const Color.fromRGBO(102, 153, 141, 0.2),
                  color: Theme.of(context).primaryColorLight,
                  elevation: 10,
                  margin: EdgeInsets.only(left: 8.h),
                  child: Padding(
                    padding: EdgeInsets.all(3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Importance',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: Theme.of(context).cardColor),
                            ),
                            SvgPicture.asset(
                              'assets/icon/arrow.svg',
                              width: 8.h,
                            ),
                            Expanded(
                                child: Text(
                              'The importance of a lounge is a number.',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Theme.of(context).shadowColor),
                            ))
                          ],
                        ),
                        SizedBox(height: 1.2.h),
                        Text(
                          'The higher the importance, the more the Host meets Guests from this lounge.',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: Theme.of(context).shadowColor),
                        ),
                        SizedBox(height: 1.2.h),
                        Row(
                          children: [
                            Text(
                              'Importance 0',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w800,
                                      color: Theme.of(context).cardColor),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                                child: Text(
                              'Choose the importance for each lounge',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Theme.of(context).shadowColor),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: 40.h,
                width: double.infinity,
                child: ScrollConfiguration(
                  behavior: AppScrollBehavior(),
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Card(
                          color: Theme.of(context).primaryColorLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromRGBO(82, 177, 245, 0.1),
                                          Color.fromRGBO(49, 244, 179, 0.1),
                                        ],
                                      )),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Imagine the lounges with the following importance',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(
                                                fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Chrony Lounge',
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                              'assets/icon/arrow.svg',
                                              width: 8.h,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'importance 2',
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'High Roller Lounge',
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                              'assets/icon/arrow.svg',
                                              width: 8.h,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'importance 1',
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Eccentric Lounge',
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                              'assets/icon/arrow.svg',
                                              width: 8.h,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'importance 0',
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                text:
                                                    'Take the sum of all the importances',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: ' 2 + 1 + 0 = 3\n',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        ?.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .cardColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              'So, for every 3 Guests',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w800),
                                            ),
                                            SizedBox(height: 1.h),
                                            RichText(
                                              text: TextSpan(
                                                text: '  2',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w800),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: ' will be from',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                  TextSpan(
                                                      text: ' Chrony Lounge',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 1.h),
                                            RichText(
                                              text: TextSpan(
                                                text: '  1',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w800),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: ' will be from',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                  TextSpan(
                                                      text:
                                                          ' High Roller Lounge',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 1.h),
                                            RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                text: '  0',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w800),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: ' will be from',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                  TextSpan(
                                                      text: ' Eccentric Lounge',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: CustomGridView(
                                            crossAxisCount: 3,
                                            children: List.generate(
                                                9,
                                                (index) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: SvgPicture.asset(
                                                        'assets/icon/user.svg',
                                                        height: 2.5.h,
                                                        width: 2.5.h,
                                                        color: (index % 3 == 2)
                                                            ? const Color
                                                                    .fromRGBO(
                                                                234,
                                                                167,
                                                                167,
                                                                1)
                                                            : const Color
                                                                    .fromRGBO(
                                                                86,
                                                                203,
                                                                189,
                                                                1),
                                                      ),
                                                    )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Card(
                          color: Theme.of(context).primaryColorLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: SizedBox(
                            height: 35.h,
                            width: 50.h,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color.fromRGBO(82, 177, 245, 0.1),
                                            Color.fromRGBO(49, 244, 179, 0.1),
                                          ],
                                        )),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'If a Host would like to only have Guests that offer the suggested support, the Host can choose',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                  height: 1.5,
                                                  fontWeight: FontWeight.w800),
                                        ),
                                        SizedBox(height: 2.h),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Chrony Lounge',
                                                textAlign: TextAlign.end,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icon/arrow.svg',
                                                width: 8.h,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'importance 1',
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'High Roller Lounge',
                                                textAlign: TextAlign.end,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icon/arrow.svg',
                                                width: 8.h,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'importance 0',
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Eccentric Lounge',
                                                textAlign: TextAlign.end,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icon/arrow.svg',
                                                width: 8.h,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'importance 0',
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Spacer(),
                                      Expanded(
                                        flex: 3,
                                        child: RichText(
                                          textAlign: TextAlign.start,
                                          text: TextSpan(
                                            text: 'All the guest will be from',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '\nChrony Lounge',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color:
                                                              Theme.of(context)
                                                                  .cardColor)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: CustomGridView(
                                            crossAxisCount: 3,
                                            children: List.generate(
                                                9,
                                                (index) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: SvgPicture.asset(
                                                        'assets/icon/user.svg',
                                                        height: 2.5.h,
                                                        width: 2.5.h,
                                                      ),
                                                    )),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Card(
                          color: Theme.of(context).primaryColorLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: SizedBox(
                            height: 35.h,
                            width: 50.h,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color.fromRGBO(82, 177, 245, 0.1),
                                            Color.fromRGBO(49, 244, 179, 0.1),
                                          ],
                                        )),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Perhaps a Host values Chronies and High Rollers equally and\nlikes to talk to an Eccentric Guest once in a while, the Host could\nchoose',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w800),
                                        ),
                                        SizedBox(height: 2.h),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Chrony Lounge',
                                                textAlign: TextAlign.end,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icon/arrow.svg',
                                                width: 8.h,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'importance 2',
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'High Roller Lounge',
                                                textAlign: TextAlign.end,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icon/arrow.svg',
                                                width: 8.h,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'importance 1',
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Eccentric Lounge',
                                                textAlign: TextAlign.end,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icon/arrow.svg',
                                                width: 8.h,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'importance 0',
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: CustomGridView(
                                      crossAxisCount: 11,
                                      children: List.generate(
                                          22,
                                          (index) => Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: SvgPicture.asset(
                                                  'assets/icon/user.svg',
                                                  height: 2.5.h,
                                                  width: 2.5.h,
                                                  color: (index % 11 == 10)
                                                      ? const Color.fromRGBO(
                                                          166, 166, 218, 1)
                                                      : (index % 2 == 0)
                                                          ? const Color
                                                                  .fromRGBO(
                                                              86, 203, 189, 1)
                                                          : const Color
                                                                  .fromRGBO(
                                                              234, 167, 167, 1),
                                                ),
                                              )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: -3.h,
                bottom: 1,
                top: -1.h,
                child: InkWell(
                  onTap: () {
                    _pageController?.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
                  child: Image.asset(
                    'assets/icon/next.png',
                    height: 14.h,
                    width: 22.h,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Container featureWidget(BuildContext context) {
    return Container(
      padding: margin(),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              const TitleWidget(
                text: 'Features',
                height: 0.025,
              ),
              Image.asset(
                'assets/feature_img.png',
                width: 60.h,
                height: 60.h,
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            primary: false,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.5 / 0.275,
            children: List.generate(
                featureList.length,
                (index) => Card(
                      color: Theme.of(context).primaryColorLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            featureList[index]['feature_icon']!,
                            height: 60,
                            width: 60,
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8),
                                  Text(
                                    featureList[index]['title']!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context).cardColor),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(featureList[index]['content']!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .button
                                          ?.copyWith(
                                              fontWeight: FontWeight.normal,
                                              height: 1.25,
                                              color: Theme.of(context)
                                                  .shadowColor)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Container roadMapWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: margin(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12.h),
          const TitleWidget(
            text: 'Roadmap',
            height: 0.025,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          SizedBox(height: 2.h),
          SizedBox(
            width: 80.h,
            child: CustomTile(
              shrinkWrap: true,
              primary: false,
              children: List.generate(
                  roadMapList.length,
                  (index) => Card(
                        shadowColor: const Color.fromRGBO(102, 153, 141, 0.2),
                        color: Theme.of(context).primaryColorLight,
                        elevation: 8,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 1.5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                roadMapList[index]['title']!,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                roadMapList[index]['content']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                        color: Theme.of(context).shadowColor,
                                        fontWeight: FontWeight.normal,
                                        height: 1.25),
                              ),
                            ],
                          ),
                        ),
                      )),
              indicatorSize: 1.5.h,
              lineGap: 5,
              lineColor: const Color.fromRGBO(175, 233, 216, 1),
              indicators: List.generate(
                  roadMapList.length,
                  (index) => SvgPicture.asset(
                        'assets/icon/thumb.svg',
                        width: 0.5.h,
                        height: 0.5.h,
                      )),
            ),
          )
        ],
      ),
    );
  }

  Container ourPhilosophyWidget(BuildContext context) {
    return Container(
      padding: margin(),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12.h),
          const TitleWidget(
            text: 'Our Philosophy',
            height: 0.025,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          SizedBox(height: 2.h),
          Text(
            '2i2i started with the motto that everyone has value.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.w200,
                color: Theme.of(context).shadowColor),
          ),
          SizedBox(height: 2.h),
          Text(
            '“Two fundamental elements of nature are information and energy.\nEveryone in the world has both information and energy to offer.”',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.w200,
                color: Theme.of(context).shadowColor,
                fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 3.h),
          Text(
            'In 2i2i, the Host provides information and the Guest offers energy in return.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(40, 40, 86, 0.6)),
          ),
          SizedBox(height: 2.h),
          Card(
            shadowColor: const Color.fromRGBO(102, 153, 141, 0.2),
            color: Theme.of(context).primaryColorLight,
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Within their meeting, the Host can provide information in various forms.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 2.h),
                  Text('For example ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400)),
                  SizedBox(height: 1.h),
                  RichText(
                    text: TextSpan(
                      text: '• ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'by giving advice',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  RichText(
                    text: TextSpan(
                      text: '• ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'simply by their presence and having a chat ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  RichText(
                    text: TextSpan(
                      text: '• ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'by teaching',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  RichText(
                    text: TextSpan(
                      text: '• ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'by lending an ear to listen',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  RichText(
                    text: TextSpan(
                      text: '• ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Etc.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'The energy of the Guest comes in the form of coins. Coins are an efficient storage of energy\nThis makes 2i2i an efficient exchange between information and energy.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(40, 40, 86, 0.6)),
          ),
          SizedBox(height: 3.h),
          Text(
            '2i2i offers a safe, private, zero risk space for everyone',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(40, 40, 86, 0.6)),
          ),
          SizedBox(height: 1.1.h),
          SizedBox(
            width: 60.h,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProfileWidget(stringPath: '1'),
                    SizedBox(width: 1.1.h),
                    Expanded(
                      child: Text(
                        'To realise the value of their information by being a Host ',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.w200,
                            color: Theme.of(context).shadowColor),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 1.1.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProfileWidget(stringPath: '2'),
                    SizedBox(width: 1.1.h),
                    Expanded(
                      child: Text(
                        'To acquire the information they desire by being a Guest',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.w200,
                            color: Theme.of(context).shadowColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'An efficient and open exchange between information and energy will make the world a better place.',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(40, 40, 86, 0.6)),
          ),
        ],
      ),
    );
  }

  Container teamWidget(BuildContext context) {
    return Container(
      padding: margin(),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12.h),
          const TitleWidget(
            text: 'Team',
            height: 0.025,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ProfileWithNameWidget(
                name: 'Imi',
                position: 'Co-Founder',
                stringPath: 'assets/imi.png',
              ),
              SizedBox(width: 6.h),
              const ProfileWithNameWidget(
                name: 'Solli',
                position: 'Co-Founder',
                stringPath: 'assets/soli.png',
              ),
              SizedBox(width: 6.h),
              const ProfileWithNameWidget(
                name: 'Banjamin',
                position: 'Advisor',
                stringPath: 'assets/banjamin.png',
              ),
              SizedBox(width: 6.h),
              const ProfileWithNameWidget(
                name: 'Eran',
                position: 'Advisor',
                stringPath: 'assets/eran.png',
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ProfileWithNameWidget(
                name: 'Chandresh',
                position: 'Developer',
                stringPath: 'assets/chandresh.png',
              ),
              SizedBox(width: 6.h),
              const ProfileWithNameWidget(
                name: 'Ravi',
                position: 'Developer',
                stringPath: 'assets/ravi.png',
              ),
              SizedBox(width: 6.h),
              const ProfileWithNameWidget(
                name: 'Gitesh',
                position: 'Designer',
                stringPath: 'assets/gritesh.png',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Center getAppWidget(BuildContext context) {
    return Center(
      child: Container(
        width: 90.w,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 16.h),
        child: Row(
          children: [
            SizedBox(width: 12.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const TitleWidget(
                    text: 'Get the app now',
                    height: 0.025,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Download the app from you favourite playstore now.',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Theme.of(context).shadowColor),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icon/qr_code.svg',
                        height: 10.h,
                        width: 10.h,
                      ),
                      SizedBox(width: 2.h),
                      Text('Scan the QR Code to\nget the download link',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: Theme.of(context).shadowColor)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SizedBox(
                        height: 5.h,
                        width: 16.h,
                        child: Image.asset(
                          'assets/play_store.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SizedBox(
                        height: 5.h,
                        width: 16.h,
                        child: Image.asset('assets/app_store.png',
                            fit: BoxFit.fill),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/mobile.png',
                height: 60.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding footerWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 8.w, right: 8.w, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/app_bar_logo.svg',
                height: 6.h,
              ),
              SizedBox(width: 4.h),
              Expanded(
                child: Center(
                  child: Table(children: [
                    TableRow(
                      children: [
                        TextButton(
                            style: const ButtonStyle(
                                alignment: Alignment.centerLeft,
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {},
                            child: Text(
                              'Home',
                              style: Theme.of(context).textTheme.subtitle1,
                              textAlign: TextAlign.start,
                            )),
                        TextButton(
                            style: const ButtonStyle(
                                alignment: Alignment.centerLeft,
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {},
                            child: Text(
                              'FAQ',
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.subtitle1,
                            )),
                        TextButton(
                            style: const ButtonStyle(
                              alignment: Alignment.centerLeft,
                              splashFactory: NoSplash.splashFactory,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Privacy Policy',
                              style: Theme.of(context).textTheme.subtitle1,
                            )),
                      ],
                    ),
                    TableRow(
                      children: [
                        TextButton(
                            style: const ButtonStyle(
                                alignment: Alignment.centerLeft,
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {},
                            child: Text(
                              'Contact Us',
                              style: Theme.of(context).textTheme.subtitle1,
                            )),
                        TextButton(
                            style: const ButtonStyle(
                                alignment: Alignment.centerLeft,
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {},
                            child: Text(
                              'Support',
                              style: Theme.of(context).textTheme.subtitle1,
                            )),
                        TextButton(
                            style: const ButtonStyle(
                                alignment: Alignment.centerLeft,
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {},
                            child: Text(
                              'Terms & Condition',
                              style: Theme.of(context).textTheme.subtitle1,
                            ))
                      ],
                    )
                  ]),
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icon/insta.svg',
                  height: 2.h,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icon/fb.svg',
                  height: 2.h,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icon/tweeter.svg',
                  height: 2.h,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Card(
            elevation: 3,
            child: Container(
              width: 7.h,
              height: 0.015,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(height: 2.h),
          Text('© 2022 2i2i, All Right Reserved',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: const Color.fromRGBO(40, 40, 86, 0.6)))
        ],
      ),
    );
  }
}
