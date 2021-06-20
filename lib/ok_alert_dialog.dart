
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog {
  // Alert Dialog with Ok [حسنا] ---------------------------------------------------------------------------
  static void okAlertDialog(BuildContext context, String message) {
    MediaQueryData _newMediaQueryData = MediaQuery.of(context);
    double contentMessageHeight = _newMediaQueryData.size.height * 0.15;
    // todo, button should in bottom center of AlertDialog!!!!!
    double buttonHeight = _newMediaQueryData.size.height * 0.06;

    Dialog alertDialog = Dialog(
      //backgroundColor: Colors.amber,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Container(
        height: contentMessageHeight + buttonHeight,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              height: contentMessageHeight,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    message,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.7),
              child: GestureDetector(
                child: MaterialButton(
                  color: Colors.amber,
                  elevation: 2,
                  height: buttonHeight,
                  minWidth: MediaQuery.of(context).size.width / 2,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Text(
                    "حسنا",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    // todo, why cannot get into onPress, will check it in Users App??
                    print('popup clicked');

                    //Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
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
