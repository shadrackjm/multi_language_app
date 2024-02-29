import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedLanguage = 'English';

  void selectLanguage(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(AppLocalizations.of(context)!.selectLanguage),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Container(
                              height: 30,
                              width: 40,
                            ),
                            title: const Text("English"),
                            onTap: () {
                              setState(() {
                                var locale = const Locale('en', 'US');
                                Get.updateLocale(locale);
                              });
                              Get.back();
                            },
                          ),
                          ListTile(
                            leading: Container(
                              height: 30,
                              width: 40,
                              // alignment: Alignment.center,
                            ),
                            title: const Text("Kiswahili"),
                            onTap: () {
                              selectLanguage('Kiswahili');
                              var locale = const Locale('sw', 'TZ');
                              Get.updateLocale(locale);
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.language))
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.hello),
      ),
    );
  }
}
