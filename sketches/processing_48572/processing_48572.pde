
import ddf.minim.*;


import ddf.minim.analysis.*;


Minim minim;


AudioPlayer player;


BeatDetect beat;


float vol = 0;



float b=50;
float a =100;
float c =200;

//
void setup(){
  size(300,400);

  minim = new Minim(this);


  player = minim.loadFile("Sia.mp3");


 beat = new BeatDetect(player.bufferSize(), player.sampleRate());

  player.play();

//drum();

smooth();
frameRate(25);

}

void draw (){
 background(0); 
 
  vol = player.mix.level();
  beat.detect(player.mix);

  if ( beat.isSnare() == true ) { a = 200; b=50; }
fill(random(250),random(b),random(a)); 
 ellipse(random(180-vol*300),random(250-vol*300),25+vol*300,25+vol*300);
//  ellipse(random(250,300)-vol*500,random(250,350)-vol*500,25,25);

a *= 0.95;

colorCir();

}

void colorCir(){
   
 for (int d = 150; d>0; d-= 10) {
 noStroke();
   fill(random(256-vol*200), random(256-vol*100), random(256-vol*300));
  ellipse(250,380,d,d);

}   
}


  void mouseMoved(){
 for (int d =100; d>0; d-= 10) {

   fill(random(256), random(60), random(100)+vol*5);
   ellipse(200,250,d/2,d/2);//red
  ellipse(random(150,200),random(50,200),d,d); //lightcloud

 fill(random(100)+vol*2, random(60), random(256));
  ellipse(100,300,d/2,d/2); //blue
} 
  }

