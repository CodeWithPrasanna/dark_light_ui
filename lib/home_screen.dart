import 'package:dark_light_ui/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? 'images/light.png'
                  : 'images/dark.png',
              key: Key(Theme.of(context).brightness.toString()),
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: 80,
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<ThemeProvider>(builder: (context, provider, _) {
                return DropdownButton<String>(
                  value: provider.currentTheme,
                  items: [
                    DropdownMenuItem<String>(
                        value: 'light',
                        child: Text('Light',
                            style: Theme.of(context).textTheme.headline6)),
                    DropdownMenuItem<String>(
                        value: 'dark',
                        child: Text('dark',
                            style: Theme.of(context).textTheme.headline6)),
                    DropdownMenuItem<String>(
                        value: 'system',
                        child: Text('system',
                            style: Theme.of(context).textTheme.headline6)),
                  ],
                  onChanged: (value) {
                    provider.changeTheme(value ?? 'system');
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
