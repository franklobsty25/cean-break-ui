import 'package:designing/common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, Orientation, ScreenType) {
      return MaterialApp(
        title: 'Clean Break',
        theme: ThemeData(
          primaryColor: Colors.lightGreen.shade700,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightGreen.shade700,
            secondary: Colors.grey.shade300,
            secondaryContainer: Colors.grey.shade100,
            onSecondaryContainer: Colors.white,
            error: Colors.red,
          ),
          useMaterial3: true,
          fontFamily: 'Roboto',
          primaryTextTheme: TextTheme(
            titleLarge: TextStyle(
                fontFamily: 'Roboto-Black',
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.w900),
            bodyMedium: const TextStyle(fontSize: 16, color: Colors.black),
            displaySmall: const TextStyle(fontSize: 12, color: Colors.black),
            labelMedium: TextStyle(
              fontFamily: 'Robot-Black',
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
            labelSmall: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen.shade700,
              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.only(
                top: 2.h,
                bottom: 1.h,
              ),
              shape: const RoundedRectangleBorder(
                side: BorderSide(style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        home: const StartScreen(),
      );
    });
  }
}
