import 'package:AllUni/Calendars/Calendar.dart';
import 'package:AllUni/Drawers/DrawerCalendarView.dart';
import 'package:AllUni/OtherViews/AllSettings/Settings.dart';
import 'package:AllUni/OtherViews/ContactUs/ContactUsLogOut.dart';
import 'package:AllUni/OtherViews/ContactUs/ContactUsLogged.dart';
import 'package:AllUni/OtherViews/SplashLoad.dart';
import 'package:AllUni/Providers/EventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        title: 'AllUni',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF4C75A0),
          ),
        ),
        routes: <String, WidgetBuilder>{
          "/settings": (BuildContext context) => SettingsPage(
                myPromotion: '',
                myAcademicMajor: '',
              ),
          "/contactLogIn": (BuildContext context) =>
              const ContactUsLoggedPage(),
          "/contactLogOut": (BuildContext context) =>
              const ContactUsLogOutPage(),
          "/drawer": (BuildContext context) =>
              DrawerCalendarView(isSelectedFormat: const [], currentView: ""),
        },
        home: const Splash(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //HOME-PAGE WHEN APP STARTS
      body: Calendar("Mon Calendrier", 0),
    );
  }
}
