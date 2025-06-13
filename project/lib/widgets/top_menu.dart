import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:odontologo/main.dart';
// ignore: avoid_web_libraries_in_flutter


//barra de botones superior
class TopMenuSuperior extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool back;

  const TopMenuSuperior({super.key, required this.title, this.back = false});

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;

  @override
  // ignore: library_private_types_in_public_api
  _TopMenuSuperior createState() => _TopMenuSuperior();
}

class _TopMenuSuperior extends State<TopMenuSuperior> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    //final authService = Provider.of<AuthService>(context, listen: false);

    return AppBar(
      title: Text(widget.title,style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      leading : IconButton(icon: const Icon(Icons.exit_to_app_rounded),  //const ImageIcon(AssetImage('package:lib/img/icons8-arrow-left-64.png'),),
        onPressed: () {
        widget.back ? Navigator.pop(context) :
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const MyApp()));
        },
      ),
      leadingWidth: 100,
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: Colors.white12,
      actions: [
        PopupMenuButton(
          shadowColor: Colors.red,
          icon: const Icon(Icons.more_vert_outlined, color: Colors.black87,),
          onSelected: (newValue) {
            setState(() {
              if(newValue==0){
                //_showLock();
              }else if(newValue==1){
                Navigator.pushNamed(context,'about');
                //MaterialPageRoute(builder: (context) => About_scren());
              }else if(newValue==2){
                AwesomeDialog(
                  context: context,
                  animType: AnimType.bottomSlide,
                  dismissOnBackKeyPress: false,
                  dialogType: DialogType.question,
                  title: 'Dental Blis',
                  desc:'Quieres cerrar sesion?',
                  btnOkText: 'Si',
                  btnOkOnPress: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const MyApp()));
                  },
                  btnCancelText: 'No',
                  btnCancelOnPress: () {
                  },
                ).show();
              }else if(newValue==3){
                SystemNavigator.pop();
              }else if(newValue==4){
                //html.window.close();
              }
            });
          },
          itemBuilder: (context) => [
/*             PopupMenuItem(
              child:
              Row(
                children: [
                  Icon(Icons.settings,color: Colors.black,),
                  Text('Configuración')
                ],
              ),
              value: 0,
            ), */
            PopupMenuItem(
              value: 1,
              child: Row(
                children: [
                  Icon(Icons.info,color: Colors.black,),
                  Text('Acerca de')
                ],
              ),
            ),
            kIsWeb ? PopupMenuItem(
              value: 4,
              child: Row(
                children: [
                  Icon(Icons.exit_to_app,color: Colors.black,),
                  Text('Cerrar APP')
                ],
              ),
            ): PopupMenuItem(
              value: 3,
              child: Row(
                children: [
                  Icon(Icons.exit_to_app,color: Colors.black,),
                  Text('Cerrar APP')
                ],
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Row(
                children: [
                  Icon(Icons.login_outlined,color: Colors.black,),
                  Text('Cerrar sesión')
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

/*   Future<void> _showLock() async {
    screenLock(
      context: context,
      correctString: '999990',
      //customizedButtonChild: const Icon(Icons.fingerprint),
      onCancelled: Navigator.of(context).pop,
      onUnlocked: launchSettings,
    );
  } */

 
  Future<void> launchSettings() async {
    Navigator.pushNamed(context, 'setting');
  }
}

