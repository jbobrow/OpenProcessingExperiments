
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioPlayer audio;
Minim minim;

float colo = random(0, 255);
float colo1 = random(0, 255);
float colo2 = random(0, 255); 


void setup()
{
  size(550, 550);
  smooth();
  minim=new Minim(this);
  audio=minim.loadFile("music.mp3");
  audio.play();
  frameRate(4);
}
float x1=0, x2=0;
float y1=0, y2=0, y3=0, y4=0;
void draw()
{
  background(0);
  noFill();
  for (int i=0;i<audio.left.size()-1;i++)
  {
    x1=abs(audio.left.get(i))*500+75;
    x2=475-abs(audio.right.get(i))*500;
  }
  if (x1>275)
  {
    x1=275;
  }
  if (x2<275)
  {
    x2=275;
  }

  println(x1+"  "+x2);
  strokeWeight(1);
  stroke(colo, 0, 0);
  ellipse (275, 275, 400, 400);
  y1=sqrt(40000-pow(x1-275, 2))+275;
  y2=sqrt(40000-pow(x2-275, 2))+275;
  y3=-sqrt(40000-pow(x1-275, 2))+275;
  y4=-sqrt(40000-pow(x2-275, 2))+275;
  strokeWeight(1);
  bezier(x1, y1, 175, 275, 375, 275, x2, y4);
  bezier(x2, y2, 175, 275, 375, 275, x1, y3);
  strokeWeight(10);
  stroke(colo1, 0, 0);
  point(x1, y1);
  stroke(0, 0, colo);
  point(x2, y2);
  stroke(0, 0, colo1);
  point(x1, y3);
  stroke(0, 0, colo2);
  point(x2, y4);
}


