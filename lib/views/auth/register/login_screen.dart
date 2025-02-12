import 'package:depot_boisson/navigation_menu.dart';
import 'package:depot_boisson/views/agent/home_page.dart';
import 'package:depot_boisson/views/auth/register/register_screen.dart';
import 'package:depot_boisson/widgets/Logo.dart';
import 'package:depot_boisson/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPass = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(child: Column(
                children: [
                  const SizedBox(height: 40,),
                  const Logo(size : 50),
                  const SizedBox(height: 15,),
                  const Text("Application de Livraison",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  ),
                  const SizedBox(height: 30,),
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
                  SizedBox(height: 15,),
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
              ),
              Footer(buttonText: "Connexion", accountFirstText: "pas de compte ? ", accountSeconText: " Créez un compte", buttonAction: () {
                // if(formKey.currentState!.validate()){
                  
                // }
        
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  NavigationMenu()),
                  );
                // Get.to(() => NavigationMenu());
              }, 
              accountActionScreen: RegisterScreen(), height: MediaQuery.sizeOf(context).height  * 0.4, ),
            ],
          ),
        ),
      ),
    );
  }
}