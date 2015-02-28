
AudioPlayer player;
Minim minim;

import ddf.minim.*;
PImage a;
PImage b;
PImage c;

void setup(){
 size(400, 250);
 background(255);
minim = new Minim(this);
player = minim.loadFile("Haloween track.wav", 2048);
 a = loadImage("Toilet lock vacant.jpg");
 b = loadImage("Toilet lock occupied.jpg");
 c = loadImage("Happy halloween.jpg");
image(a, 100, 20);
}

void draw(){
 
}
  
void mousePressed(){
  if (mouseButton == LEFT){
    image(b, 100,20);
   
  } 
  } 
  
void mouseReleased(){
  if (mouseButton == LEFT){
    delay(5000);
    player.play();

    image(c, 0, 0, 400, 250);
    delay(40000);
   
  } 
}




void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  
  super.stop();
}

