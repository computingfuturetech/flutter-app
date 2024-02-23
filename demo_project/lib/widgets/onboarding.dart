import 'package:demo_project/utils/exports.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({
    super.key,
    required this.index,
    required this.image,
    required this.title,
    required this.desc,
  });

  final image, title, desc, index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page ${index + 1}'),
    );

    // return Column(
    //   children: [
    //     SizedBox(
    //       height: MediaQuery.of(context).size.height * 0.02,
    //     ),
    //     Expanded(
    //       child: Container(
    //         decoration: const BoxDecoration(
    //           color: Colors.green,
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(20),
    //           ),
    //         ),
    //         child: Column(
    //           children: [
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             Row(
    //               children: [
    //                 const SizedBox(
    //                   width: 20,
    //                 ),
    //                 // Image.asset(
    //                 //   logo,
    //                 //   width: 130,
    //                 // ),
    //                 const Spacer(),
    //                 if (index != 2)
    //                   InkWell(
    //                     onTap: () {
    //                       Navigator.pushAndRemoveUntil(
    //                           context,
    //                           PageTransition(
    //                               type: PageTransitionType.rightToLeft,
    //                               child: const Home(),
    //                               isIos: true),
    //                           ((route) => false));
    //                       // Navigator.pushAndRemoveUntil(
    //                       //     context,
    //                       //     MaterialPageRoute(
    //                       //         builder: (context) =>
    //                       //             const LoginScreen()),
    //                       //     (route) => false);
    //                     },
    //                     child: const Text(
    //                       'Skip for now',
    //                       style: TextStyle(
    //                         fontSize: 14,
    //                       ),
    //                     ),
    //                   ),
    //                 const SizedBox(
    //                   width: 20,
    //                 ),
    //               ],
    //             ),
    //             const Spacer(),
    //             // Image.asset(
    //             //   s1,
    //             //   width: 300,
    //             // ),
    //             Stack(
    //               children: <Widget>[
    //                 // The first icon is the shadow
    //                 Positioned(
    //                   left: 15,
    //                   top: 15,
    //                   child: Container(
    //                     height: 300,
    //                     width: 300,
    //                     decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                         image: ExactAssetImage(image),
    //                         fit: BoxFit.cover,
    //                       ),
    //                     ),
    //                     //   child: ClipRRect(
    //                     //     // ,make sure we apply clip it properly
    //                     //     child: BackdropFilter(
    //                     //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    //                     //       child: Container(),
    //                     //     ),
    //                     //   ),
    //                   ),
    //                 ),
    //                 Image.asset(
    //                   image,
    //                   width: 300,
    //                 )
    //               ],
    //             ),
    //             const Spacer(),
    //           ],
    //         ),
    //       ),
    //     ),
    //     SizedBox(
    //       height: MediaQuery.of(context).size.height * 0.05,
    //     ),
    //     Text(
    //       title,
    //       textAlign: TextAlign.center,
    //       style: const TextStyle(
    //         fontSize: 24,
    //       ),
    //     ),
    //     const SizedBox(
    //       height: 10,
    //     ),
    //     Text(
    //       desc,
    //       textAlign: TextAlign.center,
    //       style: const TextStyle(
    //         fontSize: 14,
    //       ),
    //     ),
    //   ],
    // );
  }
}
