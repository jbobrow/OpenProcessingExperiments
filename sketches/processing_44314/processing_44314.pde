
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage img; 
int water= 0;
int circleX = 200;
int circleY = 175;


void setup(){
  size(425,275,P2D);
  frameRate(85);
  minim = new Minim(this);
  player = minim.loadFile("pouringwater.mp3", 2048);
  player.play();
  img=loadImage("teabag.JPG");
}

void draw(){
  image(img, 0,0);
  noStroke();
  fill(#E7E8E1,75);
  ellipse(circleX,circleY,water,water);

  if (keyPressed == true){
    if (key == 's')
    water = 0;
  } else{
    water = water +1;
  }
 if (keyPressed == true){
   if(key == 's')
   player.loop(1);
 }}


  void stop(){
  player.close();
  minim.stop();
  super.stop();
}

