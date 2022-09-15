import 'package:flutter/material.dart';
import 'package:all_uni_dev/Calendars/Calendar.dart';
import 'package:all_uni_dev/Pages/CalendarPages/DatabaseLoadPage.dart';


class DrawerCalendarChooseButton extends StatefulWidget {

  String currentView = "";
  List<bool> isSelected = [];
  DrawerCalendarChooseButton({
    super.key,
    required this.currentView,
    required this.isSelected,
  });

  @override
  State<DrawerCalendarChooseButton> createState() => _DrawerCalendarChooseButtonState();
}



class _DrawerCalendarChooseButtonState extends State<DrawerCalendarChooseButton> {
  @override
  Widget build(BuildContext context) {
    var isSelected = widget.isSelected;
    var currentView = widget.currentView;
    return Container(
      alignment: Alignment.center,
      color: Colors.indigo.withOpacity(0.15),
      child: ToggleButtons(
        isSelected: isSelected,
        fillColor: Colors.indigo,
        selectedColor: Colors.white,
        renderBorder: false,
        color: Colors.black,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.calendar_view_day_rounded),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.amp_stories),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.calendar_view_week_rounded),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.calendar_month_outlined),
          ),
        ],
        onPressed: (int SelectedButtonIndex) {
          setState(() {
            for (int index = 0; index < isSelected.length; index++) {
              if (index == SelectedButtonIndex) {
                isSelected[index] = true;
              } else {
                isSelected[index] = false;
              }
            }
            Navigator.pop(context);
            });
        },
      ),
    );
  }
}
