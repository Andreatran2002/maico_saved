import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:maicolandapp/model/entity/news.dart';
import 'package:maicolandapp/model/repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';
part 'news_event.dart';
part 'news_state.dart';
class NewsBloc

    extends Bloc<NewsEvent, NewsState> {
  // final NewsRepository _newsRepo = NewsRepository();
  final _newsSubject = BehaviorSubject<List<News>>();
  
  Stream<List<News>> get news => _newsSubject.stream;

  NewsBloc() : super(NewsLoading())  {
    
    
     on<NewsLoad>(_mapNewsLoadToState);
    on<NewsRefresh>((event,emit){
        emit(NewsLoading());
    });
  }

  void _mapNewsLoadToState(NewsLoad event, emit) async {  
   try {      
      // final response =await _newsRepo.getAll();

      emit(NewsLoaded());
    } catch (e) {
      emit(NewsNotLoaded());
    }
  }
  



  @override
  NewsState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(NewsState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}