
//minim library and input format taken from minim example AudioPlayer

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//PImage img;
Minim minim;
AudioPlayer in;

int s = second();
WalkLikeAnEgyptian [] GoRight;
WalkLikeAnEgyptianOtherWay[] GoLeft;

void setup() 
{
  size(500, 400);
  minim = new Minim(this);
  in = minim.loadFile("dancingqueen.mp3");
  in.play();
  smooth();
  noStroke();

  int numSets = width;
  GoLeft = new WalkLikeAnEgyptianOtherWay[numSets];
  GoRight = new WalkLikeAnEgyptian[numSets];
  for (int i=0; i<numSets; i++)
  {
    GoRight[i] = new WalkLikeAnEgyptian (i*100, 110, 0, 0);
    GoLeft[i] = new WalkLikeAnEgyptianOtherWay (i*100, -85, 0, 0);
  }
}

void draw() 
{
  int s = second();
  println(s);
  if (s== 1)
  {
    for (int i =0; i<width; i++)
    {
      GoRight[i].display();
    }
  }

  if (s== 30)
  {
    for (int i =0; i<width; i++)
    {
      GoLeft[i].display();
    }
  }
}

void  stop()
{
 in.close();
minim.stop();

super.stop();
}

