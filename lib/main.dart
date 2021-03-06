import 'package:exchangex/Screens/ExchangeScreen.dart';
import 'package:exchangex/Screens/HistoryScreen.dart';
import 'package:exchangex/Screens/LoginScreen.dart';
import 'package:exchangex/Screens/MyTabControl.dart';
import 'package:exchangex/Screens/SignUpScreen.dart';
import 'package:exchangex/blocs/ExchangeBloc.dart';
import 'package:exchangex/blocs/LoginBloc.dart';
import 'package:exchangex/blocs/SignUpBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

var imageLogin = Image.asset("assets/images/img_login.jpg");
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoder, "assets/images/ic_exchangex.svg"),
      null,
    );
    precacheImage(imageLogin.image, context);
    return ScreenUtilInit(
            designSize: Size(360,640),
            builder: ()=>MaterialApp(
                title: "ExchangeX",
                routes: <String, WidgetBuilder> {
                  '/MyTabControl': (BuildContext context) => new MyTabControl(),
                  '/Login' : (BuildContext context) => new LoginScreen(),
                  '/HistoryScreen' : (BuildContext context) => new HistoryScreen(),
                },
                home: MultiBlocProvider(
                    providers: [
                      BlocProvider<LoginBloc>(
                          create: (BuildContext context) => LoginBloc()),
                      BlocProvider<ExchangeBloc>(
                          create: (BuildContext context) => ExchangeBloc()),
                      BlocProvider<SignUpBloc>(
                          create: (BuildContext context) => SignUpBloc()),
                    ],
                    child: LoginScreen()
                )
            ),
          );
  }
}
