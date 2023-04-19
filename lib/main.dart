import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:leaf_snap/models/local_strings.dart';
import 'package:leaf_snap/ui/loading_screen.dart';
import 'package:leaf_snap/ui/onboarding_screen.dart';
import 'package:leaf_snap/ui/root_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This is the last thing you need to add.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //late StreamController<Locale> streamController;

  // @override
  // void initState() {
  //   super.initState();
  //   streamController = StreamController<Locale>.broadcast(
  //     onListen: () async {
  //       streamController.add(Locale('ka'));
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   streamController.close();
  //   super.dispose();
  // }
  //end

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/bg1f.jpg'), context);
    return GetMaterialApp(
      translations: LocalString(),
      //locale: Locale('ka'),
      //locale: snapshot.data,
      locale: Get.deviceLocale,
      title: 'Onboarding Screen',
      home: RootPage(/*localeController: streamController*/),
      debugShowCheckedModeBanner: false,
    );
    // return StreamBuilder<Locale>(
    //   initialData: null,
    //   stream: streamController.stream,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       print(snapshot.data);
    //       // Future.delayed(Duration.zero, () {
    //       //   Get.updateLocale(Locale('ka'));
    //       // });
    //       Get.updateLocale(snapshot.data!);
    //       // WidgetsBinding.instance.addPostFrameCallback((_) {
    //       //   Get.updateLocale(snapshot.data!);
    //       // });
    //     }
    //     return GetMaterialApp(
    //       translations: LocalString(),
    //       locale: snapshot.data ?? Get.deviceLocale,
    //       //locale: snapshot.data,
    //       fallbackLocale: const Locale('en', 'US'),
    //       title: 'Onboarding Screen',
    //       home: RootPage(/*localeController: streamController*/),
    //       debugShowCheckedModeBanner: false,
    //     );
    //   },
    // );
  }
}
