

import gifAnimation.*;

PImage[] animation;
Gif Gif_Bg;
Gif Gif_Run;
boolean pause = false;
float s1 ;
float s2 ;
float a ;
float b ;
float x;
float y;

public void setup() {
  size(680, 418);
  frameRate(100);
  
  println("gifAnimation " + Gif.version());

  Gif_Bg = new Gif(this, "bg.gif");
  Gif_Bg.loop();
  Gif_Run = new Gif(this, "running.gif");
  Gif_Run.play();
  Gif_Run.ignoreRepeat();
}

void draw() {
  background(255 / (float)height * mouseY);
  
  image(Gif_Bg, 340, 209 ); 
  imageMode(CENTER);
  image(Gif_Run, 340, 220 , x,y);
  x = 164 - s1;
  y = 226 - s2;

if (mousePressed == true) {     
  Gif_Run.play();
  s1 -=a;
  s2 -=b;
  a =  0.820;
  b =  1.130;
  }
  else{
  s1 -=a;
  s2 -=b;
  a = -0.656;
  b = -0.904;  
  }
  
if (x < 0) {
   x = 0;
  }  
  
if (y < 0) {
   y = 0;
  }    

}



