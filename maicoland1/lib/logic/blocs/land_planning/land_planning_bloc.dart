import 'package:bloc/bloc.dart';
import 'package:maicolandapp/logic/blocs/land_planning/land_planning_event.dart';
import 'package:maicolandapp/logic/blocs/land_planning/land_planning_state.dart';
import 'package:maicolandapp/model/entity/land_planning.dart';
import 'package:maicolandapp/model/repository/planning_land_repository.dart';

class LandPlanningBloc extends Bloc<LandPlanningEvent, LandPlanningState> {
  // PlanningLandRepository _LandPlanningsRepository = PlanningLandRepository();
  LandPlanningBloc() : super(LandPlanningLoading()) {
    on<DisplayLandPlanning>(_mapDisplayLandPlanningToState);
  }

  void _mapDisplayLandPlanningToState(DisplayLandPlanning event, emit) async {
    try {
      // List<LandPlanning> response = await _LandPlanningsRepository.getAll();

      emit(LandPlanningLoaded());
    } catch (e) {
      emit(LandPlanningNotLoaded("Lỗi nè " + e.toString()));
    }
    emit(LandPlanningLoaded());
  }
}
