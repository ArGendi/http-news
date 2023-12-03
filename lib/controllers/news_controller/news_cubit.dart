import 'package:bloc/bloc.dart';
import 'package:code_academy_http/controllers/news_controller/news_state.dart';
import 'package:code_academy_http/model/news.dart';
import 'package:code_academy_http/services/web_services.dart';

class NewsCubit extends Cubit<NewsState>{
  List<News> news = [];

  NewsCubit() : super(InitNewsState());

  void getNewsFromServices() async{
    emit(LoadingNewsState());
    WebServices webServices = WebServices();
    List<News>? responseNews = await webServices.getNews();
    if(responseNews != null){
      news = responseNews;
      emit(SuccessNewsState());
    }
    else{
      emit(FailNewsState());
    }
  }
}