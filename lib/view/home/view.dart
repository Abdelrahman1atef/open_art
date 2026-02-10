import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_art/core/theme/app_theme.dart';
import 'package:open_art/core/theme/theme_cubit.dart';
import 'package:open_art/core/widgets/app_Image.dart';
import 'package:open_art/core/widgets/app_bar.dart';
import 'package:open_art/core/widgets/app_button.dart';
import 'package:open_art/core/widgets/app_footer.dart';

import '../../core/widgets/app_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, themeMode) {
                  final brightness = MediaQuery.of(context).platformBrightness;
                  final isDark =
                      themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && brightness == Brightness.dark);
                  return isDark ? SizedBox.shrink() : AppImage(image: "home_background.png");
                },
              ),
              Column(
                children: [
                  SizedBox(height: 120),
                  Text("Discover, collect, and sell", style: textTheme.labelMedium?.copyWith(fontSize: 18)),
                  Text("Your Digital Art", style: textTheme.headlineMedium),
                  SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                    child: SearchBar(
                      hintText: "Search items, collections, and accounts",
                      leading: AppImage(image: "Search.svg", width: 20),
                      trailing: [AppImage(image: "Microphone.svg", width: 20)],
                    ),
                  ),
                  SizedBox(height: 40),
                  AppCard(
                    image:
                        "https://avatars.mds.yandex.net/i?id=e945ae820ed74d9b3734e8929cc230d5fa732141-13533894-images-thumbs&n=13",
                  ),
                  SizedBox(height: 12),
                  Text(
                    "\$2,683.73",
                    textAlign: TextAlign.center,
                    style: textTheme.labelMedium?.copyWith(color: AppGrayscale.placeholder),
                  ),
                  SizedBox(height: 15),
                  AppButton(type: AppButtonType.primary, text: "Place a bid"),
                  AppButton(
                    type: AppButtonType.secondary,
                    text: "View artwork",
                    useWhiteText: false,
                    disableGradient: true,
                  ),
                  SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ".",
                              style: TextStyle(color: AppColors.errorDark, fontSize: 70, height: 0.1),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: 5),
                            Text("Live auctions", style: textTheme.headlineSmall),
                          ],
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 9),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppGrayscale.placeholder),
                            borderRadius: BorderRadiusGeometry.circular(8),
                          ),
                          child: Text("View all"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Divider(),
                  SizedBox(height: 40),
                  AppFooter(),
                ],
              ),
              CustomAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}

final image = [
  "https://frankmedia.ru/wp-content/uploads/2022/10/59ad48b89102-scaled.jpg",
  "https://i.pinimg.com/736x/79/b9/cb/79b9cb63e4b667dca945c7b78b6c4703.jpg",
  "https://avatars.mds.yandex.net/i?id=e945ae820ed74d9b3734e8929cc230d5fa732141-13533894-images-thumbs&n=13",
  "https://avatars.mds.yandex.net/i?id=40516c3521c66b8dbe0afcd99d00d5a14aff24f7-11914220-images-thumbs&n=13",
  "https://avatars.mds.yandex.net/i?id=23cd99625aa7917363ff4f2f1d275cebdda2b491-12410808-images-thumbs&n=13",
  "https://is1-ssl.mzstatic.com/image/thumb/Music/8a/4c/4b/mzi.yejmzoeq.jpg/800x800cc.jpg",
  "https://avatars.mds.yandex.net/i?id=5a390421990907701ccd192976d0828078345d2e-5875850-images-thumbs&n=13",
  "https://avatars.mds.yandex.net/i?id=79e390bc6a00f2869a01a3c0597ca3b07dc7bf93-5255469-images-thumbs&n=13",
  "https://avatars.mds.yandex.net/i?id=fb4da6356f0f09659c14fc5181c4e6c0a566337a-5233076-images-thumbs&n=13",
  "https://cdn-image.zvuk.com/pic?hash=b2893058-9c85-414f-a22b-bdff4a59097c&id=45072239&size=large&type=release",
  "https://avatars.mds.yandex.net/i?id=bd33008c448cbc0208caddd5f509460b5a66f50f-2925590-images-thumbs&n=13",
  "https://avatars.yandex.net/get-music-content/5457712/e785ab26.a.18716708-1/m1000x1000",
  "https://i.ytimg.com/vi/vB5h8_VdBHo/maxresdefault.jpg",
];
