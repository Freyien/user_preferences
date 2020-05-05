import 'package:flutter/material.dart';

import 'package:user_preferences/src/pages/home_page.dart';
import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/share_prefs/user_preferences.dart';

class DrawerMenu extends StatelessWidget {
  final prefs = new UserPreferences();
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          //Menu header
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/drawer_background.jpg'),
                    fit: BoxFit.cover)),
          ),

          //Menu body
          ListTile(
            leading: Icon(Icons.pages, color: Theme.of(context).primaryColor),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
              prefs.lastPage = HomePage.routeName;
            },
          ),

          ListTile(
            leading:
                Icon(Icons.party_mode, color: Theme.of(context).primaryColor),
            title: Text('Relleno 1'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.people, color: Theme.of(context).primaryColor),
            title: Text('Relleno 2'),
            onTap: () {},
          ),

          ListTile(
              leading:
                  Icon(Icons.settings, color: Theme.of(context).primaryColor),
              title: Text('Ajustes'),
              onTap: () {
                Navigator.pushReplacementNamed(context, SettingsPage.routeName);
                prefs.lastPage = SettingsPage.routeName;
              })
        ],
      ),
    );
  }
}
