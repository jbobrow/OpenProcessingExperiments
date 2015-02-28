
import ddf.minim.*;
int x = 125;
int y = 50;

PImage myImage;

AudioPlayer player;
Minim minim;

void setup(){
  size(600,700);
  myImage=loadImage("shaker.jpg");
  minim=new Minim(this);
  player=minim.loadFile("giggle.mp3",2048);
}


void draw(){
  background(255);
  if(mouseX>250&&mouseX<350){
  player.play();  
  x = x + int(random(-4,4));
  y = y + int(random(-4,4));
  background (255);
  image(myImage, x, y ,350,350);
  fill (random(255),random (255),random (255));
  if (x<0)
  {
    x = x + int(random(0,4));
  }
  if (y<0)
  {
    y = y + int(random(0,4));
  }
  if (x>250)
  {
    x = x + int (random(-4,0));
  }
  if (y>100)
  {
    y = y + int (random(-4,0));
  }
  if (x>75)
  {
    x = x + int(random(-4,4));
  }
  if (y>75)
  {
    y = y+ int(random(-4,4));
  }
  if (x<175)
  {
    x = x + int(random(-4,4));
  }
  fill(244,245,163);
  noStroke();
  
 // ellipse(350, int(random(0,4)),30,30);
  
  
  } else {
  image(myImage, 100,100,350,350);
 player.pause();
}
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

