import 'package:designing/common.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void goToSignup(BuildContext context) => Navigator.push(
        context,
        PageRouteAnimator(
          child: const SignupScreen(),
          routeAnimation: RouteAnimation.bottomToTop,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/turtle.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
              width: double.infinity,
              height: 35.h,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Text('Welcome to Clean Break',
                      style: Theme.of(context).primaryTextTheme.titleLarge),
                  SizedBox(
                    height: 2.h,
                  ),
                  Wrap(alignment: WrapAlignment.spaceAround, children: [
                    Text(
                      'You\'r taking the first step towards a',
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                    ),
                    Text(
                      'healthier, smoke-free life. We\'re here to',
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                    ),
                    Text(
                      'support you every step of the way.',
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                    )
                  ]),
                  SizedBox(
                    height: 2.h,
                  ),
                  DotsIndicator(
                    dotsCount: 4,
                    position: 0,
                    decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(20.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ElevatedButton(
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              maximumSize:
                                  WidgetStateProperty.all(Size(60.w, 15.h)),
                              padding: WidgetStatePropertyAll(
                                  EdgeInsets.only(top: 2.h, bottom: 2.h)),
                            ),
                    onPressed: () => goToSignup(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get started',
                          style: Theme.of(context).primaryTextTheme.labelMedium,
                        ),
                        const Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
