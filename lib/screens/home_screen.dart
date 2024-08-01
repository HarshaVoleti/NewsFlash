import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashnews/models/Article.dart';
import 'package:flashnews/models/colors.dart';
import 'package:flashnews/models/textstyles.dart';
import 'package:flashnews/providers/auth_provider.dart';
import 'package:flashnews/providers/news_provider.dart';
import 'package:flashnews/screens/login_screen.dart';
import 'package:flashnews/services/remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.grey,
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Text(
            'My News',
            style: TextStyles.headingwhite,
          ),
        ),
        actions: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/pointer.svg',
                color: MyColors.white,
                height: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                RemoteConfig.getString('country_code').toUpperCase(),
                style: TextStyles.buttontext,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: MyColors.grey,
        height: size.height,
        width: size.width,
        child: Consumer<NewsProvider>(builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: MyColors.blue,
              ),
            );
          }
          if (provider.articles.isEmpty) {
            return Center(
              child: Text(
                'No news available',
                style: TextStyles.heading,
              ),
            );
          }
          if (provider.error != null) {
            return Center(
              child: Text(
                provider.error!,
                style: TextStyles.heading,
              ),
            );
          }
          final List<Article> articles = provider.articles;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Headlines',
                  style: TextStyles.title,
                ),
                ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: size.width * 0.38,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  articles[index].source.name,
                                  style: TextStyles.title,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  articles[index].title,
                                  style: TextStyles.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Spacer(),
                                Text(
                                  TextStyles()
                                      .timeAgo(articles[index].publishedAt),
                                  style: TextStyles.date,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: MyColors.grey,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/bgimage.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: MyColors.white,
                  title: Text(
                    '${FirebaseAuth.instance.currentUser!.email} Logout',
                    style: TextStyles.heading,
                  ),
                  content: Text(
                    'Are you sure you want to logout?',
                    style: TextStyles.description,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'No',
                        style: TextStyles.textbutton,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        AuthenticationProvider().logout();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false);
                      },
                      child: Text(
                        'Yes',
                        style: TextStyles.textbutton,
                      ),
                    ),
                  ],
                );
              });
        },
        child: Icon(
          Icons.person,
          color: MyColors.white,
        ),
        backgroundColor: MyColors.blue,
      ),
    );
  }
}
