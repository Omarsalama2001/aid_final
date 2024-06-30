// import 'package:aid_humanity/Features/profile/presentation/widgets/user_page_widgets/text_form_widget.dart';
// import 'package:aid_humanity/core/extensions/mediaquery_extension.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../profile_page_widgets/profile_user_item_widget.dart';
// /// handle google sign in details with google sign up
// class SliverUSerFormWidget extends StatefulWidget {
//    SliverUSerFormWidget({super.key,});
//   //  final String FullName;
//   // final String email;
//   // final String photoUrl;
//   //  final String docid;
//   //  final String oldname;
//   @override
//   State<SliverUSerFormWidget> createState() => _SliverUSerFormWidgetState();
// }
//
// class _SliverUSerFormWidgetState extends State<SliverUSerFormWidget> {
//   List<QueryDocumentSnapshot>data=[];
//   bool isloading=true;
//
//   // CollectionReference categories = FirebaseFirestore.instance.collection("UsersAuth");
//
//   // editCategory() async {
//   //
//   //
//   //       await categories.doc(widget.docid).set({"FullName": FullName,"id":FirebaseAuth.instance.currentUser!.uid});
//   //
//   //       setState(() {});
//   //
//   //
//   // }
//
//   getdata()async
//   {
//     // QuerySnapShot --> to can take a data(list of document) from collection
//     //FirebaseFirestore.instance.collection("categories").where("id",isEqualTo:FirebaseAuth.instance.currentUser!.uid ).get(); to get the data from firestore that belong to user
//     QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection("UsersAuth").where("id",isEqualTo:FirebaseAuth.instance.currentUser!.uid ).get();
//     print(querySnapshot);
//     //addAll -->Appends all objects of [iterable] to the end of this list
//     data.addAll(querySnapshot.docs);
//     await Future.delayed(Duration(seconds: 2));
//     isloading=false;
//     // علشان يعمل رفرش لليوزر انترفيس بعد جلب ال بيانات
//     setState(() {
//
//     });
//   }
//
//   @override
//   void initState() {
//       getdata();
//  // FullName=widget.oldname;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverList.builder(
//       itemBuilder: (context,i)
//       {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Name',
//                     style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: context.getDefaultSize() * 0.3,
//                   ),
//                   TextFromWidget(
//                     controller: TextEditingController(text: data[i]['Full Name'] ),
//                     obscureText: false,
//                     prefixIcon: Icons.person,
//                     keyboardType: TextInputType.name,
//                     labelText: null,
//                   ),
//                   SizedBox(
//                     height: context.getDefaultSize() * 1.5,
//                   ),
//                   Text(
//                     "Email",
//                     style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: context.getDefaultSize() * 0.3,
//                   ),
//                   TextFromWidget(
//                     controller: TextEditingController(text:data[i]['Email']),
//                     obscureText: false,
//                     prefixIcon: Icons.email_outlined,
//                     keyboardType: TextInputType.emailAddress,
//                     labelText: null,
//                   ),
//                   SizedBox(
//                     height: context.getDefaultSize() * 1.5,
//                   ),
//                   Text(
//                     "Phone",
//                     style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: context.getDefaultSize() * 0.3,
//                   ),
//                   TextFromWidget(
//                     controller: TextEditingController(text: data[i]['Phone']),
//                     obscureText: false,
//                     prefixIcon: Icons.phone_android_outlined,
//                     keyboardType: TextInputType.phone,
//                     labelText: null,
//                   ),
//                   SizedBox(
//                     height: context.getDefaultSize() * 1.5,
//                   ),
//                   // Text(
//                   //   "Password",
//                   //   style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
//                   // ),
//                   // SizedBox(
//                   //   height: context.getDefaultSize() * 0.3,
//                   // ),
//                   // TextFromWidget(
//                   //   controller: TextEditingController(text: "Omar Salama"),
//                   //   obscureText: false,
//                   //   prefixIcon: Icons.lock_open_outlined,
//                   //   keyboardType: TextInputType.text,
//                   //   labelText: null,
//                   // ),
//                   SizedBox(
//                     height: context.getDefaultSize() * 1.5,
//                   ),
//                   Text(
//                     "Address",
//                     style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: context.getDefaultSize() * 0.3,
//                   ),
//                   TextFromWidget(
//                     maxLines: 5,
//                     controller: TextEditingController(text:data[i]['Address']),
//                     obscureText: false,
//                     prefixIcon: Icons.location_on_outlined,
//                     keyboardType: TextInputType.text,
//                     labelText: null,
//                   )
//                 ],
//               )
//             ],
//           ),
//         );
//         // SizedBox(
//         // height: context.getDefaultSize() * 30,
//         // ),
//       },
//       itemCount: data.length,
//
//       // delegate: SliverChildListDelegate(
//       //   [
//       //
//       //   ],
//
//     );
//   }
// }
import 'package:aid_humanity/Features/profile/presentation/widgets/user_page_widgets/text_form_widget.dart';
import 'package:aid_humanity/core/extensions/mediaquery_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../profile_page_widgets/profile_user_item_widget.dart';
/// handle google sign in details with google sign up
class SliverUSerFormWidget extends StatefulWidget {
  SliverUSerFormWidget({super.key, required this.fullName, required this.email, required this.phone, required this.street, required this.region, required this.city, required this.country, required this.flatNumber, required this.floorNumber,});
  final String fullName;
  final String email;
  final String phone;
  final String street;
  final String region;
  final String city;
  final String country;
  final String flatNumber;
  final String floorNumber;
  @override
  State<SliverUSerFormWidget> createState() => _SliverUSerFormWidgetState();
}

class _SliverUSerFormWidgetState extends State<SliverUSerFormWidget> {


  @override
  Widget build(BuildContext context) {
    return SliverList(

      delegate: SliverChildListDelegate(
        [
       Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.getDefaultSize() * 0.3,
              ),
              TextFromWidget(
                controller: TextEditingController(text: widget.fullName ),
                obscureText: false,
                prefixIcon: Icons.person,
                keyboardType: TextInputType.name,
                labelText: null,
              ),
              SizedBox(
                height: context.getDefaultSize() * 1.5,
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.getDefaultSize() * 0.3,
              ),
              TextFromWidget(
                controller: TextEditingController(text:widget.email),
                obscureText: false,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                labelText: null,
              ),
              SizedBox(
                height: context.getDefaultSize() * 1.5,
              ),
              Text(
                "Phone",
                style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.getDefaultSize() * 0.3,
              ),
              TextFromWidget(
                controller: TextEditingController(text: widget.phone),
                obscureText: false,
                prefixIcon: Icons.phone_android_outlined,
                keyboardType: TextInputType.phone,
                labelText: null,
              ),
              SizedBox(
                height: context.getDefaultSize() * 1.5,
              ),
              Text(
                "Street",
                style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.getDefaultSize() * 1.3,
              ),
              TextFromWidget(
                maxLines: 1,
                controller: TextEditingController(text:widget.street),
                obscureText: false,
                prefixIcon: Icons.location_on_outlined,
                keyboardType: TextInputType.text,
                labelText: null,
              ),
              SizedBox(
                height: context.getDefaultSize() * 1.3,
              ),
              Text(
                "Region",
                style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.getDefaultSize() * 1.3,
              ),
              TextFromWidget(
                maxLines: 1,
                controller: TextEditingController(text:widget.region),
                obscureText: false,
                prefixIcon: Icons.location_on_outlined,
                keyboardType: TextInputType.text,
                labelText: null,
              ),
              SizedBox(
                height: context.getDefaultSize() * 2,
              ),
              Text(
                "City",
                style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.getDefaultSize() * 0.3,
              ),
              TextFromWidget(
                maxLines: 1,
                controller: TextEditingController(text:widget.city),
                obscureText: false,
                prefixIcon: Icons.location_on_outlined,
                keyboardType: TextInputType.text,
                labelText: null,
              ),
              SizedBox(
                height: context.getDefaultSize() * 1.5,
              ),
              Text(
                "Country",
                style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.getDefaultSize() * 1.5,
              ),
              TextFromWidget(
                maxLines: 1,
                controller: TextEditingController(text:widget.country),
                obscureText: false,
                prefixIcon: Icons.location_on_outlined,
                keyboardType: TextInputType.text,
                labelText: null,
              ),
              SizedBox(
                height: context.getDefaultSize() *1.3,
              ),
              Text(
                "floorNumber",
                style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.getDefaultSize() * 0.3,
              ),
              TextFromWidget(
                maxLines: 1,
                controller: TextEditingController(text:widget.floorNumber),
                obscureText: false,
                prefixIcon: Icons.location_on_outlined,
                keyboardType: TextInputType.text,
                labelText: null,
              ),
              SizedBox(
                height: context.getDefaultSize() * 1.5,
              ),
              Text(
                "flatNumber",
                style: TextStyle(fontSize: context.getDefaultSize() * 2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.getDefaultSize() *1.3,
              ),
              TextFromWidget(
                maxLines: 1,
                controller: TextEditingController(text:widget.flatNumber),
                obscureText: false,
                prefixIcon: Icons.location_on_outlined,
                keyboardType: TextInputType.text,
                labelText: null,
              ),
              SizedBox(
                height: context.getDefaultSize() * 1.5,
              ),

            ],
          )
        ],
      ),

    )
    ]
    )
    );
  }
}
