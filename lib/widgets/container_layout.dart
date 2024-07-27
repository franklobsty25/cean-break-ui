import 'package:designing/common.dart';

class ContainerLayout extends StatelessWidget {
  final Widget? child;
  final bool isGrid;

  const ContainerLayout({
    super.key,
    required this.child,
    this.isGrid = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isGrid ? 42.w : null,
      height: isGrid ? 12.h : null,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        borderRadius: BorderRadius.all(
          Radius.circular(2.w),
        ),
      ),
      child: child,
    );
  }
}
