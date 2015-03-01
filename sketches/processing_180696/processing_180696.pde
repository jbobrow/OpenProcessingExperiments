
//Silvia Quach
//Janet's Rage

import ddf.minim.Minim;
import ddf.minim.*;
PImage imgBackground;
PImage movingMouse;
int textPosition = -25;
int textSize = 100;

Minim minim;
AudioPlayer player;
AudioInput input;

void setup ()
{
  size (1000,800);
  smooth();
  frameRate (100);
  imgBackground = loadImage("Janet N.jpg");
  movingMouse = loadImage("100.jpg");

  minim = new Minim(this);
  player = minim.loadFile("marketing_tuition.mp3");
  input = minim.getLineIn();
}


void draw()
{
  image(imgBackground, 0, 0);
  rectMode(CENTER);

  noStroke();
  image(movingMouse, mouseX-350, mouseY-150);

  fill(0,120,0);
  text("$$$$$$$$$$", textPosition, textPosition);
  textSize(textSize);
  textPosition = textPosition +10;

  fill(0,120,0);
  translate(150,175);
  text("$$$$$$$$$$", textPosition, textPosition);
  textSize(textSize);
  textPosition = textPosition +100;

  fill(0,120,0);
  translate(50,200);
  text("$$$$$$$$$$", textPosition, textPosition);
  textSize(textSize);
  textPosition = textPosition +100;

  fill(0,120,0);
  translate(0,200);
  text("$$$$$$$$$$", textPosition, textPosition);
  textSize(textSize);
  textPosition = textPosition +100;

  if (textPosition > width + textPosition/2)
  {
    textPosition = textPosition/2* -1;
  }
}

void mousePressed() 
{
  println("CASH MONEY"); 
  player.play();
}

void mouseDragged()
{
  filter(INVERT);
}

void mouseReleased()
{
  player.close();
  player = minim.loadFile("marketing_tuition.mp3");
}


