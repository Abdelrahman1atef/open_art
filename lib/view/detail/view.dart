import 'package:flutter/material.dart';
import 'package:open_art/core/theme/app_theme.dart';
import 'package:open_art/core/widgets/app_Image.dart';

enum ItemState { auction, currentBid, sold }

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.image});

  final String image;

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
                        color: color,
                        child: AppImage(image: "Heart.svg", width: 20),
                      ),
                      _buildContainer(
                        color: color,
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
                  color: color,
                  shape: BoxShape.rectangle,
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      Container(
                        padding: EdgeInsetsGeometry.all(10),
                        decoration: BoxDecoration(gradient: AppGradients.secondary, shape: BoxShape.circle),
                        child: Text("H", style: TextStyle(fontSize: 21, fontVariations: [FontVariation("wght", 700)])),
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
                    decoration: BoxDecoration(border: Border.all(color: color.outline),borderRadius: BorderRadiusGeometry.circular(27)),
                    child: Text(catList[index]),
                  ),
                ),
              )
              ,
              SizedBox(height: 10),
              ViewActionWidget(image: "etherscan.png",text: "View on Etherscan",),
              ViewActionWidget(image: "Star.svg",text: "View on IPFS",),
              ViewActionWidget(image: "Chart-pie.svg",text: "View IPFS Metadata",),
              SizedBox(height: 37),
              //todo make for each ItemState
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 16),
                margin: EdgeInsetsDirectional.only(bottom: 16),
                decoration: BoxDecoration(color: color.surfaceBright,borderRadius: BorderRadiusGeometry.circular(16)),
                // child: ,
              ),
              SizedBox(height: 25),
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("Activity",style: textTheme.bodyLarge))
              
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildContainer({
  required ColorScheme color,
  required Widget child,
  BoxShape shape = BoxShape.circle,
  EdgeInsetsGeometry? padding,
}) {
  return Container(
    padding: padding ?? EdgeInsetsGeometry.all(10),
    decoration: BoxDecoration(
      shape: shape,
      color: color.surfaceBright,
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
  const ViewActionWidget({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsetsDirectional.only(bottom: 16),
      decoration: BoxDecoration(color: color.surfaceBright,borderRadius: BorderRadiusGeometry.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 30,
            children: [
              AppImage(image: image),
              Text(text),
            ],
          ),
          AppImage(image: "External.svg")
        ],
      ),
    );
  }
}
