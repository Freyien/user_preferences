import 'package:flutter/material.dart';

import 'package:user_preferences/src/widgets/drawer_menu_widget.dart';
import 'package:user_preferences/src/share_prefs/user_preferences.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    String gender; 
    String secondaryColor; 
    
    if (prefs.gender == 1)
      gender = 'Hombre';
    else
      gender = 'Mujer';

    if (prefs.secondaryColor)
      secondaryColor = 'Activo';
    else
      secondaryColor = 'Inactivo';
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text('Color secundario: $secondaryColor'),
          Divider(),

          Text('Género: $gender'),
          Divider(),

          Text('Nombre usuario: ${prefs.name}'),
          Divider(),

        ],
      ),
    );
  }
}