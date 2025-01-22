import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  String buttonText = "Connexion";
  String accountFirstText = "Vous n'avez pas de compte ? ";
  String accountSeconText = " Créez un compte";
  VoidCallback buttonAction;
  Widget accountActionScreen;
  double height;
  Footer({
    super.key,
    required this.buttonText,
    required this.accountFirstText,
    required this.accountSeconText,
    required this.buttonAction,
    required this.accountActionScreen,
    required this.height
  
    });

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.accountFirstText,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => widget.accountActionScreen,
                      ),
                     );
                },
                child: Text(
                  widget.accountSeconText,
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 40,),
          Container(
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(colors: [Colors.blue, Colors.tealAccent]),
            ),
            child: TextButton(onPressed: widget.buttonAction,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
              ),
              child: Text(
                widget.buttonText,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}