import 'package:app_with_api/Cubit/cubit/all_news_cubit.dart';

import 'package:app_with_api/Screens/details_screen.dart';
import 'package:app_with_api/repositery/all_news_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenH = 812;
    double screenW = 375;
    double responsevW = MediaQuery.of(context).size.width;
    double responsevH = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 16 / screenH * responsevH,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 15 / screenW * responsevW),
              height: (32 / screenH) * responsevH,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFF0F1FA),
                      ),
                      color: Colors.white,
                    ),
                    width: 296 / screenW * responsevW,
                    child: const TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: "Dogecoin to the Moon...",
                        hintStyle: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            height:
                                1 // assuming that line-height is equal to normal
                            ),
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.only(
                        //     bottom: 8 / screenH * responsevH,
                        //     left: 16 / screenW * responsevW),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => AllNewsRepo().getNews(),
                    child: Container(
                        child: SvgPicture.asset(
                          "assets/Group.svg",
                        ),
                        width: 33 / screenW * responsevW,
                        height: 32 / screenH * responsevH,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffFF3A44),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24 / screenH * responsevH,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 15 / screenW * responsevW),
              height: (21 / screenH) * responsevH,
              child: Row(
                children: [
                  const Text(
                    'Latest News',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'New York Small',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      height: 1.15556,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xFF0080FF),
                      fontFamily: 'Nunito',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    width: 16 / screenW * responsevW,
                  ),
                  SvgPicture.asset('assets/arrow.svg')
                ],
              ),
            ),
            SizedBox(
              height: 8 / screenH * responsevH,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<AllNewsCubit>().MyData();
                },
                child: Text("get news")),
            SizedBox(
              height: 16 / screenH * responsevH,
            ),
            Expanded(
              child: BlocBuilder<AllNewsCubit, AllNewsState>(
                builder: (context, state) {
                  if (state is AllNewsInitial) {
                    return Center(
                        child: Text("press the above button to get news"));
                  } else if (state is AllNewsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is AllNewsSuccess) {
                    return ListView.builder(
                      itemCount: state.ourResponse.articles!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        content: state.ourResponse
                                            .articles![index].content!,
                                        imageUrl: state.ourResponse
                                            .articles![index].urlToImage,
                                         author: state.ourResponse
                                            .articles![index].author ,
                                         title:  state.ourResponse
                                            .articles![index].title!,
                                         published: state.ourResponse
                                            .articles![index].publishedAt!,         
                                      ))),
                          child: Container(
                            // color: Colors.black,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(state.ourResponse
                                        .articles![index].urlToImage!))),
                            margin: EdgeInsets.all(15 / screenW * responsevW),
                            padding: EdgeInsets.all(15 / screenW * responsevW),
                            height: (240 / screenH) * responsevH,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacer(),
                                if (state.ourResponse.articles![index].author !=
                                    null)
                                  Text(
                                    state.ourResponse.articles![index].author!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Nunito',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.normal,
                                      height: 1,
                                    ),
                                  ),
                                Text(
                                  state.ourResponse.articles![index].title!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'New York Small',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    height: 1.3,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  state.ourResponse.articles![index]
                                      .description!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Nunito',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    height: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text("Error in server"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
