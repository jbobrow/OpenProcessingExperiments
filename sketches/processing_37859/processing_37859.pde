
import ddf.minim.*;

AudioPlayer player;
Minim minim;

float X;

void setup(){
  size(600, 400, P3D);

  minim = new Minim(this);
 
  player = minim.loadFile("Resistance.mp3", 2048);
  player.play();
  
  X=0;
}

void draw(){
  background(0);
  stroke(255);
  translate(-300,height/2);
  X+=3;
  if(X>360) X=0;
  rotateX(radians(X));
  
  for(int i = 0; i < player.left.size()-1; i++){
    line(i,  height/2+ player.left.get(i)*150,i+1, height/2+ player.left.get(i+1)*150);
 }  
}

void stop(){
  player.close();
  minim.stop();
  
  super.stop();
}

