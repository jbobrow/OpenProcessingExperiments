
import ddf.minim.*;
AudioPlayer Suspense;
Minim minim;

PImage Muttmatt;
float M = 0;
float s = 0.0;
float sBack = 0.0;
float ADDON = 0.0;
float opacity = 5;

void setup()
{
  size(100, 100);
  frameRate(60);
  minim = new Minim(this);
  Suspense = minim.loadFile("Suspense.mp3", 1024);
  Suspense.loop();

  Muttmatt = loadImage("MM.PNG");
}

void draw()
{
  background(0);
  for(float j = 0; j <=2000; j+=5000)
  {
  M = M+.06;
  }
  sBack = sBack +.0002;
  s = sin(sBack)*3;
  translate(50, 50);
  smooth();
  rotate(M);
  scale(s);
  opacity = opacity +.1;
  tint(255,opacity);
  image(Muttmatt, -55, -55);
  
  //OPTIONS
  if((keyPressed = true) && (key == '='))
  {
    M= M +.002;
  }
  
  if((keyPressed = true) && (key == '-'))
  {
    M = M -.01;
  }
}


