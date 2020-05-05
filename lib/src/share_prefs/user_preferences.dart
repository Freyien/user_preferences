import 'package:shared_preferences/shared_preferences.dart';


class UserPreferences {
  static final UserPreferences _userPreferences = new UserPreferences._internal();

  factory UserPreferences() {
    return _userPreferences;
  }

  UserPreferences._internal();

  //Properties
  SharedPreferences _prefs;

  //Getters
  bool    get secondaryColor => _prefs.getBool('secondaryColor') ?? false;
  int     get gender => _prefs.getInt('gender') ?? 1;
  String  get name => _prefs.getString('name') ?? '';
  String  get lastPage => _prefs.getString('lastPage') ?? 'home';

  //Setters
  set secondaryColor(bool secondaryColor) {
    _prefs.setBool('secondaryColor', secondaryColor);
  }

  set gender(int gender) {
    _prefs.setInt('gender', gender);
  }

  set name(String name) {
    _prefs.setString('name', name);
  }

  set lastPage(String lastPage) {
    _prefs.setString('lastPage', lastPage);
  }

  //Methods
  void initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }


}