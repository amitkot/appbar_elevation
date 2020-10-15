import 'package:appbar_elevation/appbar_elevation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'appbar_elevation Demo',
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollActivatedAppBarElevation(
      builder: (BuildContext context, double appBarElevation) {
        final theme = Theme.of(context);
        return Scaffold(
          appBar: AppBar(
            elevation: appBarElevation,
            title: Text('Select item'),
            textTheme: theme.textTheme.copyWith(
                headline6:
                    theme.textTheme.headline6.copyWith(color: Colors.black)),
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            iconTheme: theme.iconTheme.copyWith(color: Colors.black),
            leading: Icon(Icons.close),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                ),
              )
            ],
          ),
          body: ListView(
            children: [
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 3')),
              ListTile(title: Text('Item 4')),
              ListTile(title: Text('Item 5')),
              ListTile(title: Text('Item 6')),
              ListTile(title: Text('Item 7')),
              ListTile(title: Text('Item 8')),
              ListTile(title: Text('Item 9')),
              ListTile(title: Text('Item 10')),
              ListTile(title: Text('Item 11')),
              ListTile(title: Text('Item 12')),
              ListTile(title: Text('Item 13')),
              ListTile(title: Text('Item 14')),
              ListTile(title: Text('Item 15')),
              ListTile(title: Text('Item 16')),
              ListTile(title: Text('Item 17')),
            ],
          ),
        );
      },
    );
  }
}
