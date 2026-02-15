import 'package:flutter/material.dart';
import 'package:open_art/core/theme/app_theme.dart';
import 'package:open_art/core/widgets/app_Image.dart';
import 'package:open_art/core/widgets/app_button.dart';

enum DetailsState { auction, currentBid, sold }

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.image, this.detailsState = DetailsState.auction});

  final String image;
  final DetailsState detailsState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = theme.colorScheme;
    return Column(
      children: [
        SizedBox(height: 50),
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(24),
          child: AppImage(image: image, height: 428, fit: BoxFit.cover),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Silent Wave", style: Theme.of(context).textTheme.headlineSmall),
                  Row(
                    spacing: 12,
                    children: [
                      _buildContainer(
                        color: color.surfaceBright,
                        child: AppImage(image: "Heart.svg", width: 20),
                      ),
                      _buildContainer(
                        color: color.surfaceBright,
                        child: AppImage(image: "Export.svg", width: 20),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: _buildContainer(
                  color: color.surfaceBright,
                  shape: BoxShape.rectangle,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 5).copyWith(end: 17),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      Container(
                        padding: EdgeInsetsGeometry.all(10),
                        decoration: BoxDecoration(gradient: AppGradients.secondary, shape: BoxShape.circle),
                        child: Text(
                          "H",
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                            fontVariations: [FontVariation("wght", 700)],
                          ),
                        ),
                      ),
                      Text("@openart", style: textTheme.labelSmall?.copyWith(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Together with my design team, we designed this futuristic Cyberyacht concept artwork. We wanted to create something that has not been created yet, so we started to collect ideas of how we imagine the Cyberyacht could look like in the future.",
                style: textTheme.bodySmall?.copyWith(fontSize: 13, fontVariations: [FontVariation("wght", 500)]),
              ),
              SizedBox(height: 10),
              Row(
                children: List.generate(
                  catList.length,
                  (index) => Container(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 4, horizontal: 10),
                    margin: EdgeInsetsDirectional.only(end: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: color.outline),
                      borderRadius: BorderRadiusGeometry.circular(27),
                    ),
                    child: Text(catList[index]),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ViewActionWidget(image: "etherscan.png", text: "View on Etherscan", isAction: true),
              ViewActionWidget(image: "Star.svg", text: "View on IPFS", isAction: true),
              ViewActionWidget(image: "Chart-pie.svg", text: "View IPFS Metadata", isAction: true),
              SizedBox(height: 37),
              switch (DetailsState.currentBid) {
                DetailsState.auction => _auction(theme),
                DetailsState.sold => _sold(theme),
                DetailsState.currentBid => _currentBid(theme),
              },

              SizedBox(height: 25),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text("Activity", style: textTheme.bodyLarge),
              ),
              SizedBox(height: 23),
              ViewActionWidget(
                image: "https://is1-ssl.mzstatic.com/image/thumb/Music/8a/4c/4b/mzi.yejmzoeq.jpg/800x800cc.jpg",
                text: "Auction won by David",
                time: "June 04, 2021 at 12:00am",
                isSold: true,
                priceETH: "1.50",
              ),
              ViewActionWidget(
                image:
                    "https://avatars.mds.yandex.net/i?id=5a390421990907701ccd192976d0828078345d2e-5875850-images-thumbs&n=13",
                text: "Bid place by @pawel09",
                time: "June 06, 2021 at 12:00am",
                priceETH: "1.50",
                priceUSD: "\$2,683.73",
              ),
              ViewActionWidget(
                image:
                    "https://avatars.mds.yandex.net/i?id=79e390bc6a00f2869a01a3c0597ca3b07dc7bf93-5255469-images-thumbs&n=13",
                text: "Listing by @han152",
                time: "June 04, 2021 at 12:00am",
                priceETH: "1.00",
                priceUSD: "\$2,683.73",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _sold(ThemeData theme) {
  final color = theme.colorScheme;
  final textTheme = theme.textTheme;
  return Container(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 30),
    margin: EdgeInsetsDirectional.only(bottom: 16),
    decoration: BoxDecoration(
      color: color.surfaceBright,
      borderRadius: BorderRadiusGeometry.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.029),
          blurRadius: 13.27,
          spreadRadius: 0,
          offset: Offset(0, 10.14),
        ),
        BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 106, spreadRadius: 0, offset: Offset(0, 81)),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Expanded(
          child: Column(
            spacing: 20,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sold for", style: textTheme.bodyLarge),
                  Text("\$2,683.73", style: textTheme.labelMedium),
                ],
              ),
              Row(
                spacing: 7,
                children: [
                  Text("Owner by", style: textTheme.bodyLarge),
                  _buildContainer(
                    color: color.inverseSurface,
                    shape: BoxShape.rectangle,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 5).copyWith(end: 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        Container(
                          padding: EdgeInsetsGeometry.all(10),
                          decoration: BoxDecoration(gradient: AppGradients.accent, shape: BoxShape.circle),
                          child: Text(
                            "D",
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                              fontVariations: [FontVariation("wght", 700)],
                            ),
                          ),
                        ),
                        Text("@david", style: textTheme.labelSmall?.copyWith(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text("🔥", style: TextStyle(fontSize: 30)),
      ],
    ),
  );
}

Widget _auction(ThemeData theme) {
  final color = theme.colorScheme;
  final textTheme = theme.textTheme;
  return Container(
    padding: EdgeInsetsDirectional.only(top: 18, start: 17, end: 17, bottom: 40),
    margin: EdgeInsetsDirectional.only(bottom: 16),
    decoration: BoxDecoration(
      color: color.surfaceBright,
      borderRadius: BorderRadiusGeometry.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.029),
          blurRadius: 13.27,
          spreadRadius: 0,
          offset: Offset(0, 10.14),
        ),
        BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 106, spreadRadius: 0, offset: Offset(0, 81)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Reserve Price", style: textTheme.bodyLarge),
        SizedBox(height: 4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "1.50 ETH", style: theme.textTheme.headlineSmall),
              WidgetSpan(child: SizedBox(width: 9)),
              TextSpan(
                text: "\$2,683.73",
                style: theme.textTheme.labelMedium?.copyWith(color: color.onInverseSurface),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Once a bid has been placed and the reserve price has been met, a 24 hour auction for this artwork will begin.",
          style: textTheme.bodyMedium?.copyWith(color: color.onPrimaryFixed),
        ),
        SizedBox(height: 40),
        AppButton(
          text: "Place a bid",
          margin: EdgeInsetsDirectional.all(0),
          padding: EdgeInsetsDirectional.symmetric(vertical: 9),
        ),
      ],
    ),
  );
}

Widget _currentBid(ThemeData theme) {
  final color = theme.colorScheme;
  final textTheme = theme.textTheme;
  return Container(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20).copyWith(bottom: 40),
    margin: EdgeInsetsDirectional.only(bottom: 16),
    decoration: BoxDecoration(
      color: color.surfaceBright,
      borderRadius: BorderRadiusGeometry.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.029),
          blurRadius: 13.27,
          spreadRadius: 0,
          offset: Offset(0, 10.14),
        ),
        BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 106, spreadRadius: 0, offset: Offset(0, 81)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Current Bid", style: textTheme.bodyLarge),
        SizedBox(height: 4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "0.50 ETH", style: theme.textTheme.headlineSmall),
              WidgetSpan(child: SizedBox(width: 9)),
              TextSpan(
                text: "\$2,683.73",
                style: theme.textTheme.labelMedium?.copyWith(color: color.onInverseSurface),
              ),
            ],
          ),
        ),
        SizedBox(height: 18),
        Text("Auction ending in", style: textTheme.bodyLarge),
        SizedBox(height: 4),
        Row(
          spacing: 40,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("12", style: textTheme.headlineSmall),
                Text("hours", style: textTheme.bodySmall),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("30", style: textTheme.headlineSmall),
                Text("minutes", style: textTheme.bodySmall),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("25", style: textTheme.headlineSmall),
                Text("seconds", style: textTheme.bodySmall),
              ],
            ),
          ],
        ),
        SizedBox(height: 35),
        AppButton(
          text: "Place a bid",
          margin: EdgeInsetsDirectional.all(0),
          padding: EdgeInsetsDirectional.symmetric(vertical: 9),
        ),
      ],
    ),
  );
}

Widget _buildContainer({
  required Color color,
  required Widget child,
  BoxShape shape = BoxShape.circle,
  EdgeInsetsGeometry? padding,
}) {
  return Container(
    padding: padding ?? EdgeInsetsGeometry.all(10),
    decoration: BoxDecoration(
      shape: shape,
      color: color,
      borderRadius: shape == BoxShape.rectangle ? BorderRadiusGeometry.circular(50) : null,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.029),
          blurRadius: 13.27,
          spreadRadius: 0,
          offset: Offset(0, 10.14),
        ),
        BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 106, spreadRadius: 0, offset: Offset(0, 81)),
      ],
    ),
    child: child,
  );
}

final catList = ["#color", "#circle", "#black", "#art"];

class ViewActionWidget extends StatelessWidget {
  const ViewActionWidget({
    super.key,
    required this.image,
    required this.text,
    this.isAction = false,
    this.time = "",
    this.isSold = false,
    this.priceETH = "",
    this.priceUSD = "",
  });

  final String image;
  final String text, time, priceETH, priceUSD;
  final bool isAction, isSold;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsetsDirectional.only(bottom: 16),
      decoration: BoxDecoration(color: color.surfaceBright, borderRadius: BorderRadiusGeometry.circular(24)),
      constraints: BoxConstraints(minHeight: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isAction) ...{
            Row(
              spacing: 30,
              children: [
                AppImage(image: image),
                Text(text),
              ],
            ),
          } else ...{
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(500),
                  child: AppImage(image: image, width: 50, height: 50),
                ),
                SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text, style: theme.textTheme.labelSmall),
                    Text(time, style: theme.textTheme.bodySmall),
                    SizedBox(height: 10),
                    if (isSold) ...{
                      Text("Sold for $priceETH ETH", style: theme.textTheme.labelMedium),
                    } else ...{
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: priceETH, style: theme.textTheme.labelMedium),
                            WidgetSpan(child: SizedBox(width: 5)),
                            TextSpan(text: priceUSD, style: theme.textTheme.bodySmall),
                          ],
                        ),
                      ),
                    },
                  ],
                ),
              ],
            ),
          },
          AppImage(image: "External.svg"),
        ],
      ),
    );
  }
}
