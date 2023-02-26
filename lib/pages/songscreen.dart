import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:time/time.dart';

class SongScreen extends StatefulWidget{
  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final audioplayer=AudioPlayer();
  bool isplaying = false;
  Duration duration = Duration.zero;
  Duration position= Duration.zero;
  void initState(){
    super.initState();
    SetAudio();
  audioplayer.onPlayerStateChanged.listen((state){
      setState((){
        isplaying=state==PlayerState.playing;
      });
    });
    audioplayer.onDurationChanged.listen((newDuration) { 
      setState((){
        duration=newDuration;
      });
    });
    audioplayer.onPositionChanged.listen((newPosition) {
      setState((){
        position=newPosition;
      });
    });
  }
  Future SetAudio()async{
    audioplayer.setReleaseMode(ReleaseMode.loop);
    String url='http://melody4arab.com/music/egypt/amr_diab/shoft_el_ayam/Kan_Kol_Haga_Melody4Arab.Com.mp3';
    audioplayer.setSourceUrl(url);

  }
 
  void dispose(){
    audioplayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
 return  Scaffold(
   appBar: AppBar(
     backgroundColor: Colors.transparent,
     elevation: 0,

   ),extendBodyBehindAppBar: true,
   body: Stack(
     fit: StackFit.expand,
     children: [
       Image.network('https://th.bing.com/th?q=Amr+Diab+Instagram&w=120&'
           'h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.3&pid=InlineBlock&mkt=en-XA&cc=EG&setlang=en&adlt=strict&t=1&mw=247'
         ,fit: BoxFit.cover,),Container(
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
   crossAxisAlignment: CrossAxisAlignment.center,
   mainAxisAlignment: MainAxisAlignment.center ,

   children: [
     Text("kan kul Haga",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:
     Colors.deepPurple,fontWeight: FontWeight.bold),),
     Text("AMR DIAB",style: Theme.of(context).textTheme.bodySmall!.copyWith(color:
     Colors.white,fontWeight: FontWeight.bold),),
     Slider(
       min: 0.0,
       activeColor: Colors.deepPurple,
       inactiveColor: Colors.grey,
       max: duration.inSeconds.toDouble(),
       value: position.inSeconds.toDouble(),
       onChanged: (value)async{
         final position=Duration(seconds: value.toInt());
         await audioplayer.seek(position);
         await audioplayer.resume();
       },
     ),Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(formatTime(position)),
           Text(formatTime(duration-position))
         ],
       ),
     ),CircleAvatar(
       radius: 35,
       child: IconButton(
         color: Colors.deepPurple,
         icon: Icon(
           isplaying?Icons.pause:Icons.play_arrow,
         ),
         iconSize: 50,
         onPressed: ()async{
           if(isplaying){
            await audioplayer.pause();
           }else{

            await audioplayer.resume();
           }
         },
       ),
     )


   ],
 ),



     ShaderMask(
         shaderCallback: (rect){
           return  LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors: [
               Colors.white,
               Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.0)


               ],stops:[0.0,0.4,0.6]).createShader(rect);
         },blendMode: BlendMode.dstOut,
       child: Container(
   decoration: BoxDecoration(
         gradient: LinearGradient(
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
             colors: [
         Colors.deepPurple.shade200,
         Colors.deepPurple.shade800


   ])),
   ),
     ),
 ]))]));

  }
}

String formatTime(Duration duration) {
  String twoDigits(int n)=>n.toString().padLeft(2,'0');
  final hours=twoDigits(duration.inHours);
  final minutes=twoDigits(duration.inMinutes.remainder(60));
  final seconds= twoDigits(duration.inSeconds.remainder(60));
  return[
    if(duration.inHours>0)hours,minutes,seconds,].join(':');

}