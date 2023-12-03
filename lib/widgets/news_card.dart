import 'package:code_academy_http/controllers/news_controller/news_cubit.dart';
import 'package:code_academy_http/widgets/image_not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCard extends StatelessWidget {
  final int i;
  const NewsCard({super.key, required this.i,});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NewsCubit>(context);
    return Row(
      children: [
        cubit.news[i].image != null?
        Image.network(
          cubit.news[i].image!,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ) : ImageNotFound(),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cubit.news[i].title.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10,),
              Text(cubit.news[i].publishedAt!.split("T")[0]),
            ],
          ),
        )
      ],
    );
  }
}