import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconButtons extends StatefulWidget {
  const IconButtons({Key? key}) : super(key: key);

  @override
  _IconButtonsState createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {
  int _selectedIcon = 0;

  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.bicycle
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          spacing: 25,
          textDirection: TextDirection.ltr,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: icons
              .asMap()
              .entries
              .map((entry) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = entry.key;
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: _selectedIcon == entry.key
                                ? Colors.blue[100]
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(15),
                        child: Icon(
                          entry.value,
                          size: 20,
                          color: _selectedIcon == entry.key
                              ? Colors.blue.shade300
                              : Colors.grey.shade500,
                        )),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
