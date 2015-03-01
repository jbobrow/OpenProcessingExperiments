
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
BeatDetect beat;

void setup(){
  size(800, 800, P3D);
  smooth();
  minim = new Minim(this);
  player= minim.loadFile("Ugly Drums - Alright Alright(Original Mix).mp3");
  player.play();
  beat=new BeatDetect();
  background(255);
}

void draw(){
  // animation option 2
  int nd=100; 
  float ad=PI*2/nd; 
  translate(width/2,height/2); 
  
  stroke(0,0,255,50);
  strokeWeight(height*5);
  
  //frameRate(24); //for screen capture
  
  background(255);
  beat.detect(player.mix);
  
  for(int i=0; i<player.bufferSize()-1; i++){
    rotate(ad); // animation option 2
    float x1 = map( i, 0, player.bufferSize(), 0,width);
    float x2 = map( i+1, 0, player.bufferSize(), 0, width);
    line( x1, 400 + player.left.get(i)*100, x2, 400 + player.left.get(i+1)*100 );
    line( x1, 400 + player.right.get(i)*100, x2, 400 + player.right.get(i+1)*100 );
 } 
  //saveFrame("video/drums-####.png"); // for screen capture or video export 
  //if(frameCount>150){noLoop();} // for screen capture
}

void stop(){
  minim.stop();
  player.close();
  super.stop();
  
}



