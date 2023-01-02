import 'package:maicolandapp/model/entity/category.dart';
import 'package:maicolandapp/model/entity/land_planning.dart';
import 'package:maicolandapp/model/entity/news.dart';
import 'package:maicolandapp/model/repository/news_repository.dart';
import 'package:maicolandapp/model/repository/planning_land_repository.dart';

class HomeRepository {
  List<LandPlanning> landPlannings = []; 
  List<News> news =[];
  Future getHomeData() async{
    // landPlannings = await PlanningLandRepository().getHomeLand();
    // news = await NewsRepository().getHomeNews();
  }





}