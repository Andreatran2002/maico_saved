import 'package:maicolandapp/model/entity/land_planning.dart';
import 'package:maicolandapp/model/entity/news.dart';

class HomeResponse{
  List<LandPlanning> landPlannings;
  List<News> news; 
  HomeResponse({required this.landPlannings, required this.news});
}