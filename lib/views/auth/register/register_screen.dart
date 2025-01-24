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
      body: Padding(
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
                    SizedBox(height: 15,),
                    Center(child: Logo(size: 50,)),
                    SizedBox(height: 15,),
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
                    SizedBox(height: 50,),
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
                  obscureText: !showPass,
                ),
                Footer(buttonText: "Créer un compte", accountFirstText: "Vous avez déjà un compte ? ", accountSeconText: " Connectez vous ", buttonAction: () {
              if(formKey.currentState!.validate()){}

            }, 
            accountActionScreen: LoginScreen(), height: MediaQuery.sizeOf(context).height  * 0.4, ),

                  ],
                ),
              ) 
            )
          ],
        ),
      ),
    );
  }
}