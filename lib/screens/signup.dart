import 'package:designing/common.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  String? emailError;
  String? passwordError;

  void onSubmit() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      setState(() {
        emailError = 'Please enter an email address';
        passwordError = 'Please enter a password';
      });
    } else if (emailController.text.isEmpty) {
      setState(() {
        emailError = 'Please enter an email address';
      });
    } else if (passwordController.text.isEmpty) {
      setState(() {
        passwordError = 'Please enter a password';
      });
    } else {
      setState(() {
        emailError = null;
        passwordError = null;
      });

      Navigator.push(
        context,
        PageRouteAnimator(
          child: const PageNavigation(),
          routeAnimation: RouteAnimation.leftToRight,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        ),
      );
    }
  }

  void goToHome(BuildContext context) => Navigator.push(
        context,
        PageRouteAnimator(
          child: const PageNavigation(),
          routeAnimation:
              RouteAnimation.bottomRightToTopLeftWithFadeRotateAndScale,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Sign up',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .labelMedium!
                          .copyWith(color: Colors.black),
                    ),
                    Image.asset('images/waving-hand.png'),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Enter your email below to create your account',
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
                SizedBox(height: 5.h),
              ],
            ),
            _inputForm(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () => {},
                  child: const Text(
                    'Sign up',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.only(left: 2.w, right: 2.w),
                  child: const Text('Or'),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 2.h),
            Column(
              children: [
                _signinButton(
                  context,
                  'images/google.svg',
                  'Google',
                  'Sign in with Google',
                ),
                SizedBox(height: 1.h),
                _signinButton(
                  context,
                  'images/apple.svg',
                  'Apple',
                  'Sign in with Apple',
                ),
                SizedBox(height: 1.h),
                _signinButton(
                  context,
                  'images/discord.svg',
                  'Discord',
                  'Sign in with Discord',
                ),
              ],
            ),
            SizedBox(height: 1.h),
            _footerText(context),
          ],
        ),
      ),
    );
  }

  Widget _inputForm(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      emailError = 'Please enter an email address';
                    });
                  } else if (!value.contains('@')) {
                    setState(() {
                      emailError = 'Please enter a valid email';
                    });
                  } else {
                    setState(() {
                      emailError = null;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Email address',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 2.h,
                  ),
                ),
              ),
            ),
            if (emailError != null)
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Text(
                  emailError!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            SizedBox(height: 1.h),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: !showPassword,
                onChanged: (value) {
                  String firstChar = value.substring(0, 1);

                  if (value.isEmpty) {
                    setState(() {
                      passwordError = 'Please enter password';
                    });
                  } else if (!value.contains(firstChar.toUpperCase())) {
                    setState(() {
                      passwordError =
                          'Please password should start with Capital';
                    });
                  } else if (value.length < 8) {
                    setState(() {
                      passwordError =
                          'Please password should be at least 8 characters long';
                    });
                  } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                    setState(() {
                      passwordError =
                          'Please password should have at least a number';
                    });
                  } else if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]')
                      .hasMatch(value)) {
                    setState(() {
                      passwordError =
                          'Please password should contain a ?';
                    });
                  } else {
                    setState(() {
                      passwordError = null;
                    });
                    ;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 2.h,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => {
                      setState(() {
                        showPassword = !showPassword;
                      })
                    },
                  ),
                ),
              ),
            ),
            if (passwordError != null)
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Text(
                  passwordError!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            SizedBox(height: 2.h),
            ElevatedButton(
              onPressed: () => onSubmit(),
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    minimumSize: WidgetStateProperty.all(
                      Size(double.infinity, 5.h),
                    ),
                  ),
              child: Text(
                'Sign up',
                style: Theme.of(context).primaryTextTheme.labelMedium,
              ),
            ),
          ],
        ),
      );

  Widget _signinButton(
          BuildContext context, String svg, String svgName, String loginType) =>
      OutlinedButton(
        onPressed: () => goToHome(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svg,
              semanticsLabel: svgName,
              width: 8.w,
            ),
            SizedBox(width: 2.w),
            Text(
              loginType,
              style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        ),
      );

  Widget _footerText(BuildContext context) => Column(
        children: [
          const Text(
            'By signing up, you agree to our',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Terms of Service',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.w, right: 1.w),
                child: const Text(
                  'and',
                ),
              ),
              Text(
                'Privary Policy',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      );
}
