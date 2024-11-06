import 'package:flutter/material.dart';

class settingsTab extends StatefulWidget {
  const settingsTab({super.key});

  @override
  State<settingsTab> createState() => _settingsTabState();
}

class _settingsTabState extends State<settingsTab> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "dark theme",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Transform.scale(
                  scale: 2,
                  child: Switch(
                      value: val, //Provider.of<ThemeSettings>(context).isDark
                      activeTrackColor: Color.fromARGB(255, 109, 109, 112),
                      activeColor: Colors.white,
                      inactiveTrackColor: Color.fromARGB(255, 36, 33, 33),
                      inactiveThumbColor: Color.fromARGB(255, 64, 188, 219),
                      onChanged: (value) {
                        val = !val;

                        setState(() {});
                        // provider.saveChangedTheme(value ? 'dark' : 'light');
                      }),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "language",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                DropdownButton(
                  value: "en", //provider.localCode,
                  items: [
                    DropdownMenuItem(
                      child: Text('عربي'),
                      value: 'ar',
                    ),
                    DropdownMenuItem(
                      child: Text('English'),
                      value: 'en',
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      //provider.changeLanguage(value);
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
