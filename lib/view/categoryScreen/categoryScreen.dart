import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp_project/controller/categoryController.dart';
import 'package:newsapp_project/view/widget/news_Card.dart';
import 'package:provider/provider.dart';

class CAtegoryScreen extends StatelessWidget {

  void fetchData(BuildContext context) async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }
  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Consumer<CategoryController>(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: provider.categoryList.length,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              titleTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 1, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              title: const Text("Categories",),
              bottom: TabBar(
                labelStyle:  GoogleFonts.abrilFatface(
                    color: Color.fromARGB(255, 210, 29, 29),
                    fontWeight: FontWeight.w600),
                labelColor: Color.fromARGB(255, 12, 10, 17),
                unselectedLabelColor: Color.fromARGB(255, 12, 10, 17),
                indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: 5),
                unselectedLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 210, 29, 29),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                overlayColor:  const MaterialStatePropertyAll(
                    Colors.white),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    color: const Color.fromARGB(255, 210, 29, 29),
                    borderRadius: BorderRadius.circular(10)),
                isScrollable: true,
                tabs: List.generate(provider.categoryList.length,
                      (index) => Tab(
                    text: provider.categoryList[index],
                  ),
                ),
                onTap: (value) {
                  provider.onTap(index: value);
                },
              ),
            ),
            body: provider.isLoading == true ? Center(
                child: LottieBuilder.asset(
                  "assets/animations/Animation - 1702395258490 (2).json",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ))
                : Padding(padding: const EdgeInsets.all(10),
              child: ListView.separated(
                  itemBuilder: (context, index) => NewsCard(
                    title: provider.newsModel.articles?[index].title.toString()
                        ?? "",
                    description: provider.newsModel.articles?[index].description
                        .toString() ?? "",
                    date: provider.newsModel.articles?[index].publishedAt,
                    imageUrl: provider.newsModel.articles?[index].urlToImage
                        .toString() ?? "",
                    contant: provider.newsModel.articles?[index].content
                        .toString() ?? "",
                    sourceName: provider.newsModel.articles?[index].source?.name
                        .toString() ??
                        "",
                    url: provider.newsModel.articles?[index].url
                        .toString() ??
                        "",
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    height: 20,
                  ),
                  itemCount: provider.newsModel.articles?.length ?? 0),
            ),
          ),
        );
      },
    );
  }
}