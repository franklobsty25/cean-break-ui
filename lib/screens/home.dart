import 'package:designing/common.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileInfoWidget(context),
                _topRightWidget(context),
              ],
            ),
            SizedBox(height: 2.h),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'How are you today?',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 2.h,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Progress',
                  style: Theme.of(context).primaryTextTheme.labelSmall,
                ),
                const Icon(Icons.share),
              ],
            ),
            SizedBox(height: 2.h),
            ContainerLayout(
              child: Column(
                children: [
                  _progressCounterHeader(
                    context,
                    Icons.history,
                    'Cleaner for',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _progressCountDown(context, '09', 'days'),
                      _progressCountDown(context, '12', 'hour'),
                      _progressCountDown(context, '26', 'minute'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContainerLayout(
                  isGrid: true,
                  child: GridItemLayout(
                    icon: Icons.monetization_on_outlined,
                    text: 'Money(USD)',
                    figure: '\$25',
                  ),
                ),
                ContainerLayout(
                  isGrid: true,
                  child: GridItemLayout(
                    icon: LineAwesomeIcons.vial_solid,
                    text: 'E-liquids',
                    figure: '625',
                    subtitle: 'ml',
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContainerLayout(
                  isGrid: true,
                  child: GridItemLayout(
                    icon: LineAwesomeIcons.gratipay,
                    text: 'Life',
                    figure: '45',
                    subtitle: 'hours',
                  ),
                ),
                ContainerLayout(
                  isGrid: true,
                  child: GridItemLayout(
                    icon: LineAwesomeIcons.clock,
                    text: 'Time',
                    figure: '7',
                    subtitle: 'hours',
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              'My Goals',
              style: Theme.of(context).primaryTextTheme.labelSmall,
            ),
            SizedBox(height: 1.h),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                borderRadius: BorderRadius.all(
                  Radius.circular(2.w),
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.only(
                  left: 2.w,
                  right: 2.w,
                  bottom: 2.h,
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('images/girl.png'),
                ),
                title: const Text(
                  'Next goal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'You have saved 500 L of water. This...',
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileInfoWidget(BuildContext context) => Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 8.w,
            child: Image.asset('images/profile.png'),
          ),
          SizedBox(width: 1.w),
          Text(
            'Hi, Wayne',
            style: Theme.of(context).primaryTextTheme.titleLarge,
          ),
          Image.asset('images/waving-hand.png'),
        ],
      );

  Widget _topRightWidget(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(2.w)),
        ),
        child: Stack(
          alignment: const Alignment(0.5, -1),
          children: [
            const Icon(LineAwesomeIcons.bell),
            Container(
              width: 1.5.w,
              height: 1.5.h,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      );

  Widget _progressCounterHeader(
          BuildContext context, IconData icon, String text) =>
      Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      );

  Widget _progressCountDown(
          BuildContext context, String countDown, String time) =>
      Column(
        children: [
          Text(countDown, style: Theme.of(context).primaryTextTheme.titleLarge),
          Text(time),
        ],
      );
}
