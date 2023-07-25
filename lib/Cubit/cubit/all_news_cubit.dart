import 'package:app_with_api/Model/all_news_model/all_news_model.dart';
import 'package:app_with_api/repositery/all_news_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit() : super(AllNewsInitial());

  MyData() async {
    emit(AllNewsLoading());

    AllNewsModel? data = await AllNewsRepo().getNews();
    if (data != null) {
      emit(AllNewsSuccess(ourResponse: data));
    } else {
      emit(AllNewsFailed());
    }

    // or :

    // await AllNewsRepo().getNews().then((data){
    // if (data != null) {
    //   emit( AllNewsSuccess(ourResponse: data)) ;
    // }
    // else {
    //   emit(AllNewsFailed()) ;
    // }
    // });
  }
}
