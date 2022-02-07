import 'package:flutter/material.dart';
//import 'package:banner_ad/admanager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool is_loaded = false;
  BannerAd? bannerAd;
  @override
  void initState() {
    // myBanner.load();
    super.initState();
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-3940256099942544/6300978111',
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              is_loaded = true;
            });
            print("Banner Ad Loaded");
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        request: AdRequest());
    bannerAd!.load();
  }

  @override
  void didChangeDependancies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("Google Adds")),
          body: Container(
            child: Column(
              children: [
                Spacer(),
                is_loaded
                    ? Container(
                        height: 50,
                        child: AdWidget(
                          ad: bannerAd!,
                        ),
                      )
                    : SizedBox()
              ],
            ),
          )),
    );
  }
}
