import 'package:flutter/material.dart';
import 'package:quickbite/components/my_drawer_tile.dart';
import 'package:quickbite/pages/settings.dart';
import 'package:quickbite/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final _authService = AuthService();
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 70,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //home list tile
          MyDrawerTile(
              icon: Icons.home_filled,
              ontap: () => Navigator.pop(context),
              text: 'H O M E'),
          //settings list tile
          MyDrawerTile(
              icon: Icons.settings,
              ontap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
              text: 'S E T T I N G S'),
          const Spacer(),
          //log out tile
          MyDrawerTile(
              icon: Icons.logout_outlined, ontap: logout, text: 'L O G O U T'),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
