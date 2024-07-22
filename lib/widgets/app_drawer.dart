import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:docu/utils/app_state.dart';

class AppDrawer extends StatelessWidget {
  final String appName;
  final String appVersion;

  const AppDrawer({
    super.key,
    required this.appName,
    required this.appVersion,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  appName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                    appState.isDarkMode ? Icons.light_mode : Icons.dark_mode),
                title: Text(appState.isDarkMode ? 'Light Mode' : 'Dark Mode'),
                onTap: () {
                  appState.toggleDarkMode();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Recent PDFs'),
                onTap: () {
                  Navigator.pop(context);
                  // You can add navigation to a recent PDFs screen here if needed
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Clear History'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Clear History'),
                        content: const Text(
                            'Are you sure you want to clear your PDF history?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Clear'),
                            onPressed: () {
                              appState.clearRecentPdfs();
                              Navigator.of(context).pop();
                              Navigator.pop(context); // Close drawer
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('App Info'),
                subtitle: Text('Version $appVersion'),
              ),
            ],
          ),
        );
      },
    );
  }
}
