import 'package:flutter/material.dart';
import 'package:leading_page/view/mobile_view.dart';
import 'package:leading_page/view/web_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isForWeb = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      isForWeb = MediaQuery.of(context).size.width > 920;
      return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: Theme.of(context).primaryColorLight,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
          const UserAccountsDrawerHeader(
          accountEmail: Text('2i2i.imi@gmail.com'),
          accountName: Text('Imi kim'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/imi.png"),
          ),
        ),
              ListTile(
                leading: const Icon(Icons.system_update_alt),
                title: Text('System',style: Theme.of(context).textTheme.subtitle1),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.featured_play_list_outlined),
                title: Text('Features',style: Theme.of(context).textTheme.subtitle1),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.add_road),
                title: Text('Roadmap',style: Theme.of(context).textTheme.subtitle1),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.local_library),
                title: Text('Philosphy',style: Theme.of(context).textTheme.subtitle1),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.supervised_user_circle),
                title: Text('Team',style: Theme.of(context).textTheme.subtitle1),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.info_outline_rounded),
                title: Text('About',style: Theme.of(context).textTheme.subtitle1),
              ),

            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leadingWidth: isForWeb?28.h:null,
          iconTheme: IconThemeData(color: Theme.of(context).cardColor),
          leading: isForWeb?Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: SvgPicture.asset(
              'assets/app_bar_logo.svg',
              fit: BoxFit.fill,
              height: 9.h,
            ),
          ):IconButton(
            icon: SvgPicture.asset(
              'assets/icon/menu.svg',
              fit: BoxFit.fill,
              height: 9.h,
            ), onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          title: isForWeb?Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'About',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(width: 2.w),
              Text(
                'System',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(width: 2.w),
              Text(
                'Features',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(width: 2.w),
              Text(
                'Roadmap',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(width: 2.w),
              Text(
                'Philosphy',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(width: 2.w),
              Text(
                'Team',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ): SvgPicture.asset(
            'assets/app_bar_logo.svg',
            fit: BoxFit.fill,
            height: 5.h,
          ),
          actions: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                height: 4.5.h,
                width: 9.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    primary: Theme.of(context).scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 0.23.w),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                height: 4.5.h,
                width: 9.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Log In',
                      style: Theme.of(context).textTheme.button?.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4), // <-- Radius
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: [
              Visibility(child: WebViewScreen(),visible: isForWeb),
              Visibility(child: MobileViewScreen(scaffoldKey: _scaffoldKey,),visible: !isForWeb),
            ],
          ),
        ),
      );
    });

  }
}
