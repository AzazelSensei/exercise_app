enum ExerciseType {
  cardio,
  olympicWeightlifting,
  plyometrics,
  powerlifting,
  strength,
  stretching,
  strongman,
}

enum ExerciseMuscle {
  abdominals,
  abductors,
  adductors,
  biceps,
  calves,
  chest,
  forearms,
  glutes,
  hamstrings,
  lats,
  lowerbackMiddleback,
  neck,
  quadriceps,
  traps,
  triceps,
}

extension ExerciseMuscleExtension on ExerciseMuscle {
  String? get value {
    switch (this) {
      case ExerciseMuscle.abdominals:
        return 'abdominals';
      case ExerciseMuscle.abductors:
        return 'abductors';
      case ExerciseMuscle.adductors:
        return 'adductors';
      case ExerciseMuscle.biceps:
        return 'biceps';
      case ExerciseMuscle.calves:
        return 'calves';
      case ExerciseMuscle.chest:
        return 'chest';
      case ExerciseMuscle.forearms:
        return 'forearms';
      case ExerciseMuscle.glutes:
        return 'glutes';
      case ExerciseMuscle.hamstrings:
        return 'hamstrings';
      case ExerciseMuscle.lats:
        return 'lats';
      case ExerciseMuscle.lowerbackMiddleback:
        return 'lowerback middleback';
      case ExerciseMuscle.neck:
        return 'neck';
      case ExerciseMuscle.quadriceps:
        return 'quadriceps';
      case ExerciseMuscle.traps:
        return 'traps';
      case ExerciseMuscle.triceps:
        return 'triceps';
      default:
        return null;
    }
  }
}

extension ExerciseTypeExtension on ExerciseType {
  String? get value {
    switch (this) {
      case ExerciseType.cardio:
        return 'cardio';
      //camel case olmadığı için extension ile stringe çevirdik
      case ExerciseType.olympicWeightlifting:
        return 'olympic_weightlifting';
      case ExerciseType.plyometrics:
        return 'plyometrics';
      case ExerciseType.powerlifting:
        return 'powerlifting';
      case ExerciseType.strength:
        return 'strength';
      case ExerciseType.stretching:
        return 'stretching';
      case ExerciseType.strongman:
        return 'strongman';
      default:
        return null;
    }
  }
}
