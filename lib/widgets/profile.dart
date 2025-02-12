import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = "";
  String lastName = "";
  String email = "";
  String phoneNumber = "";

  @override
  void initState() {
    super.initState();
    loadClientInfo();
  }

  Future<void> loadClientInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('firstName') ?? "Prénom";
      lastName = prefs.getString('lastName') ?? "Nom";
      email = prefs.getString('email') ?? "Email";
      phoneNumber = prefs.getString('phoneNumber') ?? "Numéro de téléphone";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "PUBLIC INFO",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          _buildInfoTile("First Name", firstName),
          _buildInfoTile("Last Name", lastName),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "PRIVATE DETAILS",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          _buildInfoTile("Email Address", email),
          _buildInfoTile("Phone Number", phoneNumber),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // Ajoute la logique d'enregistrement ici
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              minimumSize: const Size(300, 50),
            ),
            child: const Text("Save", style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          trailing: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const Divider(),
      ],
    );
  }
}
