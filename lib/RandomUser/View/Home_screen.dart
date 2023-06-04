import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_api/RandomUser/Provider/User_provider.dart';
import 'package:sizer/sizer.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  UserProvider? providerF;
  UserProvider? providerT;

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).userDataModel();
  }

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<UserProvider>(context, listen: false);
    providerT = Provider.of<UserProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.search,
            size: 30,
            color: Colors.blue,
          ),
          title: Text(
            "User Data",
            style: TextStyle(fontSize: 25, color: Colors.blue),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.blue,
                ))
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              color: Colors.white,
            ),
            child: providerT!.data==null?Center(child: CircularProgressIndicator()):Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${providerT!.data!.results![0].picture!.large}")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 20.h,
                        width: 50.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            dataPrint(50,"First Name :-    ${providerT!.data!.results![0].name!.first}"),
                            dataPrint(50,"Last Name :-    ${providerT!.data!.results![0].name!.last}"),
                            dataPrint(50,"Email :-    ${providerT!.data!.results![0].email}"),
                            dataPrint(50,"Phone :-    ${providerT!.data!.results![0].phone}"),
                          ],
                        ),
                        ),
                    ),
                  ],
                ),
                Text("   Date of birth :-"),
                dataPrint(90,"Date :-    ${providerT!.data!.results![0].dob!.date}"),
                dataPrint(90,"Age :-    ${providerT!.data!.results![0].dob!.age}"),
                dataPrint(90,"Gender :-    ${providerT!.data!.results![0].gender}"),
                Text("   Address :-"),
                dataPrint(90, "City :-    ${providerT!.data!.results![0].location!.city}"),
                dataPrint(90, "State :-    ${providerT!.data!.results![0].location!.state}"),
                dataPrint(90, "Country :-    ${providerT!.data!.results![0].location!.country}"),
                dataPrint(90, "Post Code :-    ${providerT!.data!.results![0].location!.postcode}"),
                Text("   Login :-"),
                dataPrint(90, "uuId :-    ${providerT!.data!.results![0].login!.uuid}"),
                dataPrint(90, "User Name :-    ${providerT!.data!.results![0].login!.username}"),
                dataPrint(90, "Password :-    ${providerT!.data!.results![0].login!.password}"),
                dataPrint(90, "Salt :-    ${providerT!.data!.results![0].login!.salt}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      providerF!.userDataModel();
                    }, child: Text("Next ⏭️")),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dataPrint(int we,String data)
  {
    return Container(
      width: we.w,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text("$data"),
      ),
    );
  }

}
