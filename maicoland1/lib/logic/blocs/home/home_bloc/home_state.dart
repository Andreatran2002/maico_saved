import 'package:equatable/equatable.dart';
import 'package:maicolandapp/model/api/response/home_response.dart';
import 'package:maicolandapp/model/repository/home_repository.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeResponse response;

  const HomeLoaded( {required this.response});

  @override
  List<Object> get props {
    return [response];
  }

  @override
  String toString() {
    return 'HomeLoaded{response: $response}';
  }
}

class HomeNotLoaded extends HomeState {
  final String e;

  const HomeNotLoaded(this.e);

  @override
  String toString() {
    return 'HomeNotLoaded{e: $e}';
  }
}
