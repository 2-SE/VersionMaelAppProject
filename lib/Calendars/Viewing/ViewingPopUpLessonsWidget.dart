import 'package:AllUni/Models/CalendarAppointmentsModel.dart';
import 'package:AllUni/Utils/DateHourUtils.dart';
import 'package:flutter/material.dart';

class ViewingPopUpLessonsWidget extends StatefulWidget {
  final CalendarAppointment calendarAppointment;
  const ViewingPopUpLessonsWidget({
    Key? key,
    required this.calendarAppointment,
  }) : super(key: key);

  @override
  State<ViewingPopUpLessonsWidget> createState() =>
      _ViewingPopUpLessonsWidgetState();
}

class _ViewingPopUpLessonsWidgetState extends State<ViewingPopUpLessonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (DateHourUtils.toDate(widget.calendarAppointment.fromDate) ==
                DateHourUtils.toDate(widget.calendarAppointment.toDate))
            ? Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Date :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        DateHourUtils.toDate(
                            widget.calendarAppointment.fromDate),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Horaires :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${DateHourUtils.toTime(widget.calendarAppointment.fromDate)} - ${DateHourUtils.toTime(widget.calendarAppointment.toDate)}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  const Text(
                    "Dates :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Du :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${DateHourUtils.toDate(widget.calendarAppointment.fromDate)}  -  ${DateHourUtils.toTime(widget.calendarAppointment.fromDate)}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Jusqu'au :   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${DateHourUtils.toDate(widget.calendarAppointment.toDate)}  -  ${DateHourUtils.toTime(widget.calendarAppointment.toDate)}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Lieu :   ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Wrap(
              runAlignment: WrapAlignment.start,
              runSpacing: 4,
              children: [
                Text(
                  widget.calendarAppointment.localization,
                  maxLines: 5,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Professeur :   ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Wrap(
              runAlignment: WrapAlignment.start,
              runSpacing: 4,
              children: [
                Text(
                  "Professeur",
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        ClipRRect(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  (widget.calendarAppointment.description != "")
                      ? widget.calendarAppointment.description
                      : "Aucune note enregistrée pour ce cours.",
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize:
                        (widget.calendarAppointment.localization.isNotEmpty ||
                                widget.calendarAppointment.localization != "")
                            ? 18
                            : 15,
                    fontStyle:
                        (widget.calendarAppointment.localization.isNotEmpty ||
                                widget.calendarAppointment.localization != "")
                            ? FontStyle.normal
                            : FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
        ),
        //Description view in a scroll section ? (or in an adaptive height view)
      ],
    );
  }
}