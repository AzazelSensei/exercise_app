import '../common/common_libs.dart';
import '../widgets/custom_spacer.dart';

extension DoubleExtension on double {
  Widget get space => CustomSpacer(height: this);
}
