import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/common/common_libs.dart';

class ExcerciseIcon extends StatelessWidget {
  const ExcerciseIcon({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/icons/$name.svg',
          width: 80,
          height: 80,
        ),
      ],
    );
  }
}
