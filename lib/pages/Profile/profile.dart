import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material3/routes/routes.dart';
import 'package:flutter_material3/services/auth_service.dart';
import 'package:flutter_material3/utils/constants.dart';
import 'package:get/get.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _updateProfile() {
    // AuthService.authInstance.updateProfile(
    //   _nameController.text,
    //   _emailController.text,
    //   _passwordController.text,
    // );
  }

  @override
  Widget build(BuildContext context) {
    User? user = AuthService.firebaseUser.value;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: user?.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : NetworkImage("https://ui-avatars.com/api/?name=${user?.displayName}&size=150"),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                user?.displayName ?? 'No name',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 40),
            _buildProfileInfoTile(
              context,
              icon: Icons.email,
              title: 'Email',
              value: user?.email ?? 'No email',
            ),
            const SizedBox(height: 20),
            _buildProfileInfoTile(
              context,
              icon: Icons.phone,
              title: 'Phone Number',
              value: user?.phoneNumber ?? 'No phone number',
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: (){
                  Get.toNamed(RouteHelper.editProfile);
                },
                child: const Text('Update Profile'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: AuthService.authInstance.signOut,
                child: const Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildProfileInfoTile(BuildContext context,
      {required IconData icon, required String title, required String value}) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title, style: Theme.of(context).textTheme.labelMedium),
      subtitle: Text(value, style: Theme.of(context).textTheme.bodyMedium),
    );
  }