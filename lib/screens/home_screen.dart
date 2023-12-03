import 'package:code_academy_http/controllers/news_controller/news_cubit.dart';
import 'package:code_academy_http/controllers/news_controller/news_state.dart';
import 'package:code_academy_http/widgets/image_not_found.dart';
import 'package:code_academy_http/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NewsCubit>(context).getNewsFromServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest News"),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NewsCubit>(context);
          if(state is LoadingNewsState){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is SuccessNewsState){
            return ListView.separated(
              itemBuilder: (context, i){
                return NewsCard(i: i);
                // return Row(
                //   children: [
                //     cubit.news[i].image != null?
                //     Image.network(
                //       cubit.news[i].image!,
                //       width: 100,
                //       height: 100,
                //       fit: BoxFit.cover,
                //     ) : ImageNotFound(),
                //     const SizedBox(width: 10,),
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             cubit.news[i].title.toString(),
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold
                //             ),
                //           ),
                //           SizedBox(height: 10,),
                //           Text(cubit.news[i].publishedAt!.split("T")[0]),
                //         ],
                //       ),
                //     )
                //   ],
                // );
              }, 
              separatorBuilder: (context, i){
                return const SizedBox(height: 10,);
              }, 
              itemCount: cubit.news.length,
            );
          }
          else{
            return Center(child: Text(
              "Go to work there is no news today",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            ),);
          }
        }
      ),
    );
  }
}