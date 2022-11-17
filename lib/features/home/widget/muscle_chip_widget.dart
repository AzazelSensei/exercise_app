import '../../../core/common/common_libs.dart';
import '../constant/exercise_type_enum.dart';
import '../view_model/exercise_bloc.dart';

class MuscleChipWidget extends StatelessWidget {
  const MuscleChipWidget({
    Key? key,
    required ExerciseBloc exerciseBloc,
    required this.state,
  })  : _exerciseBloc = exerciseBloc,
        super(key: key);

  final ExerciseBloc _exerciseBloc;
  final ExerciseState state;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        ExerciseMuscle.values.length,
        (index) => GestureDetector(
          onTap: () {
            _exerciseBloc.add(ChangeFilter(
              type: state.exerciseType,
              muscle: ExerciseMuscle.values[index],
            ));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Chip(
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              backgroundColor:
                  state.exerciseMuscle == ExerciseMuscle.values[index]
                      ? Colors.deepPurple
                      : Colors.black12,
              label: Text(
                ExerciseMuscle.values[index].name.toUpperCase(),
                style: TextStyle(
                    color: state.exerciseMuscle == ExerciseMuscle.values[index]
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
