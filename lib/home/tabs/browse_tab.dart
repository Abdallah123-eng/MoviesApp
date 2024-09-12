
import 'package:flutter/material.dart';
import 'package:movies_app/API_Manager.dart';
import 'package:movies_app/Colors_App.dart';
import 'package:movies_app/SourceResponse.dart';
import 'package:movies_app/home/tabs/Browse_Details_Screen.dart';



class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  late Future<List<Gener>> GenerApiURL;

  @override
  void initState() {
    GenerApiURL = APIManager2().generSources();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Browse Category',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder(
              future: GenerApiURL,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final gend = snapshot.data!;

                return Expanded(
                  child: GridView.builder(
                    itemCount: gend.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final generd = gend[index];
                      return InkWell(
                        onTap: (){
                         variable.BrowseId=generd.id;
                         variable.Browsename=generd.name;
                          Navigator.of(context).pushNamed(
                              BrowseDetailsScreen.routeName);
                        },
                        child: Container(
                          color: Colors.red,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/photo1.png',
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Text(
                                generd.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.red
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );

              },
            )
          ],
    );
  }
}
