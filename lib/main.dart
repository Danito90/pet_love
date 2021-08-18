import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pet_love/routes/app_pages.dart';
import 'package:pet_love/routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/pages/home.dart';
import 'global_widgets/pet_binding.dart';

void main() {
/*   debugPaintSizeEnabled = true; */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        // TODO: uncomment the line below after codegen
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialBinding: PetBinding(),
      initialRoute: AppRoutes.INITIAL,
      /* theme: appThemeData, */
      defaultTransition: Transition.fade,
      locale: Locale('es', 'es_AR'),
      fallbackLocale: Locale('es', 'es_AR'),
      getPages: AppPages.pages,
      home: Home(),
    );
  }
}
