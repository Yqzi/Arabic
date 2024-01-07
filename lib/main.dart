import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/screens/flashcards_screen.dart';
import 'package:language_learning/screens/home.dart';
import 'firebase_options.dart';

import 'screens/signin_screen.dart';

ThemeData darkTheme(BuildContext context) => FlexThemeData.dark(
      textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context)
          .textTheme
          .apply(bodyColor: Colors.white, displayColor: Colors.white)),
      colors: const FlexSchemeColor(
        primary: Color(0xff3e525c),
        primaryContainer: Color.fromARGB(90, 0, 20, 14),
        secondary: Color(0xff7ac0c4),
        secondaryContainer: Color(0xfffff1c1),
        tertiary: Color(0xfffb7595),
        tertiaryContainer: Color.fromARGB(140, 13, 15, 7),
        appBarColor: Color(0xfffff1c1),
        error: Color(0xffcf6679),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme(context),
      home: const Home(),
    );
  }
}
