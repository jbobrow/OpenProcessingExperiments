
//Sound fingerprint
//A simple way of visualizing sounds creating a unique fingerprint 
//Ale González, 2013
//Credits: "Basura Sónica No Deseada" by AZ-Rotator. In "Spam", 2010, Discontinu Records.
//artist info:
//www.azrotator.info
//www.myspace.com/azrotator

import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioPlayer song;

int 
  samples = 1024; 
float 
  angleStep  = TWO_PI/samples,
  maxRadius = 300.,
  scaleF = 125.,
  radiusStep;
PVector 
  shapeCenter, 
  currentVertex;
PVector[] 
  lookupTable;

void setup()
{
    size(800, 800);
    smooth();
    noStroke();
    background(-1);
    noCursor();
     shapeCenter  = new PVector(width/2, height/2);
    currentVertex= new PVector();
    lookupTable= new PVector[samples];
    for (int i = 0; i < samples; i++) 
    {
         float angle= i*angleStep + HALF_PI;
         lookupTable[i] = new PVector(cos(angle), sin(angle)); 
    }
    minim = new Minim(this);
    song = minim.loadFile("az.mp3", samples);
    radiusStep = maxRadius/(song.length()*6/100);
    song.play();
}

void draw()
{
    if (song.isPlaying()) 
    {
         visualizeWaves(song.right.toArray(), 0x50ff0000, maxRadius, scaleF);
         visualizeWaves(song.left.toArray(), 0x50000000, maxRadius, scaleF);
         visualizeWaves(song.mix.toArray(), 0xffffffff, maxRadius -= radiusStep, scaleF);
    }
}

void visualizeWaves(float [] wavesToVisualize, color fillColor, float radius, float scale_factor)
{
     fill(fillColor);
     stroke(0x10ffffff);
     beginShape();
     for (int i = 0; i < wavesToVisualize.length; i++)
     {
          float  r = radius + wavesToVisualize[i]*scale_factor;
          currentVertex = PVector.add(shapeCenter, PVector.mult(lookupTable[i], r));
          vertex (currentVertex.x, currentVertex.y);
      }
      endShape();
} 

void stop(){
  song.close();
  minim.stop();
  super.stop();
}


