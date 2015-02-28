
PImage img;
float x;
import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup(){
  size(800,600);
  img=loadImage("outthedoor.jpg");
  
  minim = new Minim(this);
player = minim.loadFile("Rachmaninoff - The Flight of the Bumblebee (Piano).mp3");
 player.play();
  player.loop(2000);
  
  


}



void draw(){
  x +=3;
  if (x > width){
    x= -width;
    
  }
  
  image(img,x,0);
}


