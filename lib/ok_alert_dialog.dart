import 'package:flutter/material.dart';

class CustomAlertDialog {
  // Alert Dialog with Ok [حسنا] ---------------------------------------------------------------------------
  static void okAlertDialog(BuildContext context, String message) {
    MediaQueryData _newMediaQueryData = MediaQuery.of(context);
    double contentMessageHeight = _newMediaQueryData.size.height * 0.15;
    // todo, button should in bottom center of AlertDialog!!!!!
    double buttonHeight = _newMediaQueryData.size.height * 0.06;

    AlertDialog alertDialog = AlertDialog(
      //backgroundColor: Colors.amber,
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Stack(
        alignment: Alignment.bottomCenter,
        overflow: Overflow.visible,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(7))),
            height: contentMessageHeight,
            child: Center(
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            top: contentMessageHeight - (buttonHeight * 0.5),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: buttonHeight,
              child: RaisedButton(
                child: Text(
                  "حسنا",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  // todo, why cannot get into onPress, will check it in Users App??
                  print('popup clicked');

                  //Navigator.pop(context);
                },
                elevation: 5,
                color: Colors.red,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
        ],
      ),
      /*actions: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: [

          ],
        ),
      ],*/
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
