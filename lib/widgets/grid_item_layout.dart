import 'package:designing/common.dart';

class GridItemLayout extends StatelessWidget {
  final IconData? icon;
  final String text;
  final String figure;
  final String? subtitle;

  const GridItemLayout({
    super.key,
    required this.icon,
    required this.text,
    required this.figure,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 2.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: figure,
                        style: Theme.of(context).primaryTextTheme.titleLarge,
                      ),
                      if (subtitle != null)
                        WidgetSpan(
                          child: Transform.translate(
                            offset: Offset(4, 4),
                            child: Text(subtitle!),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
