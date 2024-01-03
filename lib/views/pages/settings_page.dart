import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  final Function(int index)? onTileTap;

  const SettingsPage({Key? key, this.onTileTap}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Map<String, dynamic>> allSettings = [
    {'title': 'Notifications', 'icon': Icons.notifications_outlined},
    {'title': 'Payment Methods', 'icon': Icons.payment_outlined},
    {'title': 'Orders', 'icon': Icons.checklist_outlined},
    {'title': 'Close Friends', 'icon': Icons.people_alt_outlined},
    {'title': 'Privacy', 'icon': Icons.lock_outline_rounded},
    {'title': 'Security', 'icon': Icons.security_outlined},
    {'title': 'Account', 'icon': Icons.person_2_outlined},
    {'title': 'Help', 'icon': Icons.help_outline_outlined},
    {'title': 'About', 'icon': Icons.info_outline},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredSettings = allSettings
        .where((setting) =>
            setting['title'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: const Color(0xff262628),
          ),
        ),
      ),
      body: Column(
        children: [
          SearchBar(
            onQueryChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSettings.length,
              itemBuilder: (context, index) {
                return buildListTile(
                  filteredSettings[index]['title'],
                  filteredSettings[index]['icon'],
                  index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xff262628),
        ),
      ),
      onTap: () {
        // Handle tile tap by calling the provided callback
        if (widget.onTileTap != null) {
          widget.onTileTap!(index);
        }
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  final void Function(String)? onQueryChanged;

  const SearchBar({Key? key, this.onQueryChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
        ),
        onChanged: onQueryChanged,
      ),
    );
  }
}
