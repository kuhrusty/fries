import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_html/style.dart';

///  Sheesh, I just wanted a simple HTML display... it took two tries and a
///  lot of angry shouting.
void showAboutWidget(BuildContext context) async {
  String html = await rootBundle.loadString("assets/about.html");

  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Hi!"),
        content: _StaticHTMLWidget(html),
        actions: [
          RaisedButton(  //  wrapping this in Center() doesn't help
            child: Text("Great, thanks!"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class _StaticHTMLWidget extends StatelessWidget {
  final _html;

  _StaticHTMLWidget(this._html);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Html(
        data: _html,
//        style: {
//          "html": Style(
//            backgroundColor: Color(0xffeeffdd)
//          ),
//        },
        shrinkWrap: true,
        onLinkTap: (url) async {
          if (await canLaunch(url)) {
            launch(url);
          } else {
            print("uhh, not sure what to do with \"$url\"");
          }
        },
      ),
    );
  }
}
