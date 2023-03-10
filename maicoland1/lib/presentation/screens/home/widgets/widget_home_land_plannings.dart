import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maicolandapp/logic/blocs/land_planning/land_planning_bloc.dart';
import 'package:maicolandapp/logic/blocs/land_planning/land_planning_state.dart';
import 'package:maicolandapp/model/entity/land_planning.dart';
import 'package:maicolandapp/presentation/common_widgets/widgets.dart';
import 'package:maicolandapp/presentation/screens/home/widgets/widget_home_card_land_plannings.dart';
import 'package:maicolandapp/presentation/screens/land_plannings/land_planning_details/land_planning_details_screen.dart';

class WidgetHomeLandPlanning extends StatelessWidget {
  List<LandPlanning> items = [];

  @override 
  Widget build(BuildContext context){
     return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                  const SizedBox(height : 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: const HeadingTextWidget(text: "Quy hoạch"),
                  ),
                  const SizedBox(height : 10),

                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/landplannings");
                      },
                      child: Text(
                        "Xem thêm",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontFamily: "Montserrat",
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Container(height: 210.0, child: _buildContent()),
            ],
          );
      
  }

  @override
  Widget _buildContent() {
    return BlocBuilder<LandPlanningBloc, LandPlanningState>(
      builder: (context, state) {
        if (state is LandPlanningLoaded) {
          // items = state.landPlannings;

                                return  _buildListLandPlanning();
            
          
        } else if (state is LandPlanningNotLoaded) {
          return   Text("Lỗi hệ thống. Vui lòng báo lên quản trị viên ");
        } else {
          return   Center(
            child: CircularProgressIndicator(),
          );
          
        }
      },
    );
  }

  _buildListLandPlanning() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: items.length < 6 ? items.length : 5,
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return  GestureDetector(
          onTap : ()=>  Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => DetailMapLandPlanning(
                        landPlanning: item,
                      ))),
          child: WidgetHomeCardLandPlanning(
              landPlanning: item,
            
          ),
        );
      },
    );
  }
}