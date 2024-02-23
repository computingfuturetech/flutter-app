import 'package:demo_project/utils/exports.dart';

Widget OnboardSlide({required int currentIndex}) {
  return SizedBox(
    height: 10,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        if (index == currentIndex) {
          return const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.circle,
                color: Colors.orange,
                size: 10,
              ),
            ),
          );
        }
        return const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(
            Icons.circle,
            color: Colors.grey,
            size: 10,
          ),
        );
      },
    ),
  );
}
