import 'package:depot_boisson/views/auth/register/register_screen.dart';
import 'package:depot_boisson/widgets/Logo.dart';
import 'package:depot_boisson/widgets/footer.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(child: Column(
              children: [
                const SizedBox(height: 60,),
                const Logo(size : 50),
                const SizedBox(height: 20,),
                const Text("Application de Livraison",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                ),
                const SizedBox(height: 50,),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Ce champ est obligatoire";
                    } else if (value.length < 6){
                      return "Veuillez entrer au moins six(6) caractères ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Nom",
                    border :OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
        
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
        
                ),
              ],
            ),
            ),
            Footer(buttonText: "Connexion", accountFirstText: "Vous n'avez pas de compte ? ", accountSeconText: " Créez un compte", buttonAction: () {
              if(formKey.currentState!.validate()){}

            }, 
            accountActionScreen: RegisterScreen(), height: MediaQuery.sizeOf(context).height  * 0.4, ),
          ],
        ),
      ),
    );
  }
}