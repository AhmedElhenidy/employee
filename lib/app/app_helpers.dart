import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

navigateTo(BuildContext context , Widget page , {bool removeAll = false , Function? onResult })async{
  if(removeAll) {
    var result = await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
    if(onResult != null) onResult(result) ;
  }
  else {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
    if(onResult != null) onResult() ;
  }
}
 double getWidth(BuildContext context){
return MediaQuery.of(context).size.width ;
}

 double getHeight(BuildContext context){
return MediaQuery.of(context).size.height ;
}
hideKeyboard(BuildContext context){
  FocusScopeNode scope = FocusScope.of(context);
  if(!scope.hasPrimaryFocus){
    FocusScope.of(context).requestFocus( FocusNode());
  }

}

// MaterialColor buildMaterialColor(Color color) {
//   List strengths = <double>[.05];
//   Map swatch = <int, Color>{};
//   final int r = color.red, g = color.green, b = color.blue;
//
//   for (int i = 1; i < 10; i++) {
//     strengths.add(0.1 * i);
//   }
//   strengths.forEach((strength) {
//     final double ds = 0.5 - strength;
//     swatch[(strength * 1000).round()] = Color.fromRGBO(
//       r + ((ds < 0 ? r : (255 - r)) * ds).round(),
//       g + ((ds < 0 ? g : (255 - g)) * ds).round(),
//       b + ((ds < 0 ? b : (255 - b)) * ds).round(),
//       1,
//     );
//   });
//   return MaterialColor(color.value, swatch);
// }