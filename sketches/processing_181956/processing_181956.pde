

import ddf.minim.Minim;
import ddf.minim.*;
PImage imgBackground;
PImage movingMouse;
int textPosition = -25;
int textSize = 50;
float r= random(50);

String oneName = "would you";
String otherName = "fuck me?";
String displayed ="";

int interval = 800; 
int time;

PFont font;
 
Minim minim;
AudioPlayer player;
AudioInput input;
 
void setup ()
{ 
  size (720,810);
  smooth();
  frameRate (60);
  imgBackground = loadImage("blurbg.jpg");
  movingMouse = loadImage("tongueout3.png");
 
  minim = new Minim(this);
  player = minim.loadFile("idfuckme.mp3");
  input = minim.getLineIn();
}
 
void draw()
{
  textSize(20);
  fill(255);
  text("if we're friends, you'd click & hold me. don't let go.", 000, 300);
 
  fill(0,0,0);
 textSize(textSize);
  textPosition = textPosition +100;
 
  
    text(displayed, width/2 - textWidth(displayed)/2, height/2);
  if (millis() - time > interval) {
    displayed = displayed.equals(oneName)? otherName:oneName;
    time  = millis();
  
  image(imgBackground, 0, 0);
  rectMode(CENTER);
 
  noStroke();
  image(movingMouse, mouseX-50, mouseY-50);
 

  if (textPosition > width + textPosition/2)
  {
    textPosition = textPosition/2* -1;
  }
  }
}
 
void mousePressed()
{
  println("HELP.");
  player.play();
  fill(0,0,0);
  text("who am i?",r+100,textPosition);
}
 
void mouseDragged()
{
  filter(INVERT);
 text("i think i'm glitching out.",r+100,textPosition);
}
 
void mouseReleased()
{
  player.close();
  player = minim.loadFile("idfuckme.mp3");
}

