
import ddf.minim.*;
//import ddf.minim.signals.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;

import processing.video.*;

//MovieMaker mm;

float spin = 0.0;
float angle = 15.5;
float d = 30;

void setup()
{
  size(1400, 700, P3D);
  noStroke();
  minim = new Minim(this);
 song = minim.loadFile("bounce.wav");
  frameRate(28);
  
 song.play();
 // smooth();
 // mm = new MovieMaker(this, width, height, "Sphere_Animation.mov", 
 //                      30, MovieMaker.H263, MovieMaker.LOSSLESS);
  
}

void draw()
{
  background(0);
  lights();
  spin += 0.05;
  angle += PI/100;
  camera(cos(angle)*d,0, sin(angle)*d, 0, 25,0,0, -1, 0);
 
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(1/PI);
  rotate(PI/5 + spin);
  fill(#00FADB);
  sphere(60);
 // mm.addFrame();
  popMatrix();
 

}
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}
/*
void keyPressed()
{
  if(key ==' ')
  {
    mm.finish();
  }
}
*/

