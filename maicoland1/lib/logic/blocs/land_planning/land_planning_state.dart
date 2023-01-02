import 'package:equatable/equatable.dart';
import 'package:maicolandapp/model/entity/land_planning.dart';

abstract class LandPlanningState extends Equatable {
  const LandPlanningState();

  @override
  List<Object> get props => [];
}
class LandPlanningLoading extends LandPlanningState {}

class LandPlanningLoaded extends LandPlanningState {
  // final List<LandPlanning> landPlannings;

  LandPlanningLoaded();

  // @override
  // List<Object> get props => landPlannings;

  // @override
  // String toString() {
  //   return 'LandPlanningLoaded{LandPlannings: $landPlannings}';
  // }
}

class LandPlanningNotLoaded extends LandPlanningState {
  final String e;

  const LandPlanningNotLoaded(this.e);

  @override
  String toString() {
    return 'LandPlanningNotLoaded{e: $e}';
  }
}