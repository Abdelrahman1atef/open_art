import 'package:flutter/material.dart';

import 'app_Image.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = theme.colorScheme;
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
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
    );
  }
}

class AppSoldOut extends StatelessWidget {
  const AppSoldOut({super.key, this.isSoldOut = false});

  final bool isSoldOut;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
