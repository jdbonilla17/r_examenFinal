import 'package:flutter/cupertino.dart';


class TileDriver extends StatelessWidget {
  const TileDriver({
    super.key,
    required this.imgUrlDriver,
    required this.imgUrlFlagCountry,
    required this.nameDriver,
    required this.roleDriver,
    required this.team,
    required this.car,
  });

  final String imgUrlDriver;
  final String imgUrlFlagCountry;
  final String nameDriver;
  final String roleDriver;
  final String team;
  final String car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 78, 78, 80),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Image.network(imgUrlDriver),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Image.network(imgUrlFlagCountry),),
                  Text(nameDriver),
                  Text(roleDriver),
                  Text(team),
                  Text(car),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
