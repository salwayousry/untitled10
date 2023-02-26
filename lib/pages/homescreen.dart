import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled10/pages/songscreen.dart';
import 'package:untitled10/section_header.dart';

import '../models/song_models.dart';

class HomeScreen extends StatelessWidget{
  static var routeName;

  @override
  Widget build(BuildContext context) {
    List<Song>song=Song.song;
   return Container(
     decoration: BoxDecoration(
       gradient: LinearGradient(
         begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: [
             Colors.deepPurple.shade800.withOpacity(0.8),
             Colors.deepPurple.shade200.withOpacity(0.8)
           ])
           
     ),
     child: Scaffold(
       backgroundColor: Colors.transparent,
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0,
         leading: Icon(Icons.grid_view_rounded),
         actions: [
           Container(
             margin: EdgeInsets.only(right: 20),
             child: CircleAvatar(
               backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.6TKtCuOGeixGTVTRTC7ZkQHaJQ?w=121&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7') ,
             ),
             
           )
         ],
       ),
       bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
         backgroundColor: Colors.deepPurple.shade800,
           unselectedItemColor: Colors.white,
           selectedItemColor: Colors.white,
           showUnselectedLabels: false,
           showSelectedLabels: false,
           items: [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
         BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
         BottomNavigationBarItem(icon: Icon(Icons.play_circle_outlined),label: 'Play'),
         BottomNavigationBarItem(icon: Icon(Icons.people_outline),label: 'Profile')
       ]),
       body: SingleChildScrollView(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'Welcome'
                         ,style: Theme.of(context).textTheme.bodyLarge!),
                   SizedBox(height: 5,),
                   Text(
                     'Enjoy Your Favorite Music'
                     ,style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                   ),
                   SizedBox(height: 20),
                   TextFormField(
                     decoration: InputDecoration(
                       isDense: true,
                       filled: true,
                       fillColor: Colors.white,
                       hintText: 'Search',
                       hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey.shade400),
                       prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,),
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                         borderSide: BorderSide.none
                       )
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(
                       left: 20.0,
                       top: 20.0,
                       bottom: 20.0
                     ),
                     child: Column(
                       children: [
                         
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trending Music',
                                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold,color: Colors.white)),
                              Text('View More',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),)
                            ],
                          ),
                        )
                       ],
                     ),
                   ),
                   SizedBox(height: 20,),
                   SizedBox(height: MediaQuery.of(context).size.height*0.45,

                           child: Stack(
                             alignment: Alignment.bottomCenter,
                             children:[ Container(
                                 margin: EdgeInsets.only(right: 10),
                               width: MediaQuery.of(context).size.width*0.45,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15.0),
image:     DecorationImage(image:
NetworkImage('https://th.bing.com/th?q=Amr+Diab+Instagram&w=120&'
    'h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.3&pid=InlineBlock&mkt=en-XA&cc=EG&setlang=en&adlt=strict&t=1&mw=247'),fit: BoxFit.cover),


                                 ) ),
                           Container(
                             height:50,
                           width: MediaQuery.of(context).size.width*0.37,
                               margin: EdgeInsets.only(bottom: 10),
                           decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15.0),
                           color: Colors.white.withOpacity(0.8),

                           ),child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround ,
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center ,

                                 children: [
                                   Text("kan kul Haga",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:
                                   Colors.deepPurple,fontWeight: FontWeight.bold),),
                                   Text("AMR DIAB",style: Theme.of(context).textTheme.bodySmall!.copyWith(color:
                                   Colors.white,fontWeight: FontWeight.bold),)
                                 ],
                               ),
                             ],
                           ),
                           ),InkWell(
                                 onTap: (){
                                          Get.toNamed('/song' );
                                 },
                                   child: Icon(Icons.play_circle,color: Colors.deepPurple,)),

                             ] ),

                         )

                 ])),



             Padding(
               padding: const EdgeInsets.only(right: 20.0),
               child: Column(
               children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Playlist', style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold,color: Colors.white)),
                    Text('View More',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white))      ],
                ),

                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network('https://th.bing.com/th/id/OIP.oZZGFQvFBCWT19Y-Iv3wTQHaHa?w=173&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'
                              ,height: 50,width: 50,fit: BoxFit.cover,),

                          ), Text('KUL HYATEE',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:
                          Colors.deepPurple,fontWeight: FontWeight.bold))
                 ,ClipRRect(
                           borderRadius: BorderRadius.circular(15.0) ,
                 child:Image.network('https://th.bing.com/th/id/OIP.zsz7vpplswJVxsYssHl2vAAAAA?w=173&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'
                            ,height: 50,width: 50,fit: BoxFit.cover)),
                       Text('AMAREEN',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:
                       Colors.deepPurple,fontWeight: FontWeight.bold)),
                       ClipRRect(
                       borderRadius: BorderRadius.circular(15.0)  ,
                       child: Image.network('https://th.bing.com/th/id/OIP.oB7nqiLzU8HfBpINUHbkIAHaHa?w=181&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7'
                          ,height: 50,width: 50,fit: BoxFit.cover)),
                          Text('GAW GAMAIL',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:
                          Colors.deepPurple,fontWeight: FontWeight.bold))
                 ],
                      ),
                    ],
                  ),

                ),
               


               ],
               ),

             ),


           ],
         ),
       ),
     ),
   );
  }

}