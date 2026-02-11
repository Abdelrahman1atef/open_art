part of '../view.dart';

class HotBidCard extends StatelessWidget {
  const HotBidCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = theme.colorScheme;
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 12, start: 16),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(28),
              child: AppImage(fit: BoxFit.cover, width: 254, height: 300, image: image),
            ),
            SizedBox(height: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Text("Inside Kings Cross", style: textTheme.labelMedium),
                    Container(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(border: Border.all(color: AppGrayscale.line),borderRadius: BorderRadius.circular(34)),
                      child: Text("2.3 ETH", style: textTheme.labelMedium),
                    ),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Highest bid",
                        style: textTheme.bodySmall,
                      ),
                      WidgetSpan(child: SizedBox(width: 8)),
                      TextSpan(
                        text: "1.00 ETH",
                        style: textTheme.labelSmall,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
