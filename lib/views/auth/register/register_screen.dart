import 'package:depot_boisson/views/auth/register/login_screen.dart';
import 'package:depot_boisson/widgets/Logo.dart';
import 'package:depot_boisson/widgets/footer.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPass = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: formKey,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Center(child: Logo(size: 50,)),
                      SizedBox(height: 10,),
                      Center(
                        child: Text(
                          "Créer un compte",
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Ce champ est obligatoire";
                      }
                      const emailPattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      final emailRegExp = RegExp(emailPattern);
                      if (!emailRegExp.hasMatch(value)) {
                      return 'Veuillez entrer une adresse e-mail valide.';
                    }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      border :OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
          
                  ),
                  SizedBox(height: 18,),
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Ce champ est obligatoire";
                      } else if (value.length < 8){
                        return "Veuillez entrer au moins huit(8) caractères ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Mot de passe",
                      border :OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          showPass ? Icons.visibility_off : Icons.remove_red_eye,
                        ),
                        onTap: (){
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                      )
                    ),
                    obscureText: !showPass,
                   ),
                  ],
                  ),
                ) 
              ),
              Footer(buttonText: "Créer un compte", accountFirstText: "Vous avez déjà un compte ? ", accountSeconText: " Connectez vous ", buttonAction: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen()),
                  );
              }, 
              accountActionScreen: LoginScreen(), height: MediaQuery.sizeOf(context).height  * 0.4, ),
            ],
          ),
        ),
      ),
    );
  }
}