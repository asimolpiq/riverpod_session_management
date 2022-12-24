import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_session_management/product/components/appbar/custom_appbar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:riverpod_session_management/product/utility/project_colors.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:table_calendar/table_calendar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: "TimeSheet"),
        bottomNavigationBar: const _CustomBottomBar(),
        body: Column(
          children: [
            TableCalendar(
              focusedDay: today,
              firstDay: DateTime.utc(1950, 1, 1),
              lastDay: DateTime.utc(2050, 1, 1),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  today = selectedDay;
                });
              },
            ),
            _divider(),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  "Seçilen Tarihte Girilmiş Etkinlik Bulunamadı.",
                  style: GoogleFonts.montserrat(
                    textStyle: context.textTheme.bodyMedium,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () async {
                      List<DateTime>? dateTime = await showOmniDateTimeRangePicker(
                        context: context,
                        is24HourMode: true,
                      );
                      for (var i in dateTime!) {
                        print(i);
                      }
                    },
                    icon: const Icon(Icons.add_box_outlined),
                    color: ProjectColors.primaryLight),
              ),
            )
          ],
        ));
  }

  Divider _divider() {
    return const Divider(
      color: ProjectColors.lightGrey,
      thickness: 2,
    );
  }
}

class _CustomBottomBar extends StatelessWidget {
  const _CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 8,
      backgroundColor: ProjectColors.primary,
      activeColor: ProjectColors.white,
      color: ProjectColors.lightGrey,
      duration: context.durationLow,
      tabs: const [
        GButton(
          icon: Icons.event,
          text: 'TimeSheet',
        ),
        GButton(
          icon: Icons.task,
          text: 'Görevler',
        ),
        GButton(
          icon: Icons.message_outlined,
          text: 'Chat',
        )
      ],
    );
  }
}
