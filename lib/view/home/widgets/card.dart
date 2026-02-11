part of '../view.dart';
class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.image, this.itemState = ItemState.none, this.onTap});

  final ItemState itemState;
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = theme.colorScheme;
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 16, start: 16, bottom: 40),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(32),
            child: Container(
              margin: EdgeInsetsDirectional.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF000000).withValues(alpha: 0.08),
                    blurRadius: 24,
                    spreadRadius: 0,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Card(
                shape: RoundedSuperellipseBorder(borderRadius: BorderRadiusGeometry.circular(32)),
                margin: EdgeInsetsDirectional.all(0),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 11, bottom: 16, start: 11, end: 11),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(24),
                        child: AppImage(fit: BoxFit.cover, width: double.infinity, height: 400, image: image),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 2),
                        child: Text("Silent Wave", style: textTheme.headlineSmall),
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(500),
                                    child: AppImage(
                                      image:
                                          "https://avatars.mds.yandex.net/i?id=bd33008c448cbc0208caddd5f509460b5a66f50f-2925590-images-thumbs&n=13",
                                      width: 48,
                                      height: 48,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        color: AppColors.success,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: color.tertiary,width: 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Pawel Czerwinski", style: textTheme.labelMedium?.copyWith(fontSize: 18)),
                                  Text(
                                    "Creator",
                                    style: textTheme.bodySmall?.copyWith(fontVariations: [FontVariation("wght", 500)]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 11),
                            child: AppImage(image: "Heart.svg"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AppSoldOut(itemState: itemState),
        ],
      ),
    );
  }
}

enum ItemState { sold, available, none }

class AppSoldOut extends StatelessWidget {
  const AppSoldOut({super.key, this.isSoldOut = false, this.itemState = ItemState.none});

  final ItemState itemState;
  final bool isSoldOut;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = theme.colorScheme;
    switch (itemState) {
      case ItemState.none:
        return SizedBox.shrink();
      case ItemState.sold:
        return Container(
          width: double.infinity,
          padding: EdgeInsetsDirectional.symmetric(vertical: 19),
          margin: EdgeInsetsDirectional.only(end: 16, start: 16, top: 12),
          decoration: BoxDecoration(borderRadius: BorderRadiusGeometry.circular(51), color: color.surfaceBright),
          alignment: AlignmentDirectional.center,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Sold out",
                  style: textTheme.bodyLarge?.copyWith(color: color.onTertiary),
                ),
                WidgetSpan(child: SizedBox(width: 8)),
                TextSpan(
                  text: "2.00 ETH",
                  style: textTheme.headlineSmall?.copyWith(color: color.onTertiary),
                ),
              ],
            ),
          ),
        );
      case ItemState.available:
        return Container(
          width: double.infinity,
          padding: EdgeInsetsDirectional.symmetric(vertical: 9),
          margin: EdgeInsetsDirectional.only(end: 16, start: 16, top: 12),
          decoration: BoxDecoration(border: Border.all(color: AppGrayscale.body),borderRadius: BorderRadiusGeometry.circular(51), color: color.surfaceBright),
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    spacing: 4,
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                      ),
                      Text("Current bid", textAlign: TextAlign.center, style: textTheme.bodyMedium?.copyWith(color: color.onTertiary)),
                    ],
                  ),
                  Text("2.00 ETH", textAlign: TextAlign.center, style: textTheme.labelLarge),

                ],
              ),
              Column(children: [
                Text("Ending in", textAlign: TextAlign.center, style: textTheme.bodyMedium?.copyWith(color: color.onTertiary)),
                Text("27m 30s", textAlign: TextAlign.center, style: textTheme.labelLarge),

              ],),

            ],
          ),
        );
    }
  }
}
