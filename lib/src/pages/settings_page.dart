import 'package:flutter/material.dart';

import 'package:user_preferences/src/widgets/drawer_menu_widget.dart';
import 'package:user_preferences/src/share_prefs/user_preferences.dart';


class SettingsPage extends StatefulWidget {
  static final String routeName = 'setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = new UserPreferences();
  TextEditingController controller;

  bool _secondaryColor = false;
  String _name;
  int _gender;

  @override
  void initState() {    
    _secondaryColor = prefs.secondaryColor;
    _gender         = prefs.gender;
    _name           = prefs.name;
    
    controller = new TextEditingController(text: _name);

    super.initState();
  }

  _setGender(int value) async {
    prefs.gender = value;
    _gender = value;
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: DrawerMenu(),
      body: ListView(
        children: <Widget>[

          Container(
            padding: EdgeInsets.all(10),
            child: Text('Ajustes', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          ),

          Divider(),

          SwitchListTile(
            value: _secondaryColor, 
            title: Text('Color secundario'),
            onChanged: (bool value) {
              _secondaryColor = value;
              prefs.secondaryColor = value;
              setState(() {
                
              });
            },
            activeColor: Colors.teal
          ),

          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: _gender, 
            onChanged: _setGender,
            activeColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue
          ),

          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: _gender, 
            onChanged: _setGender,
            activeColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue
          ),

          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona'
              ),
              onChanged: (value) {
                prefs.name = value;
              },
            ),
          )

        ],
      )
    );
  }
}