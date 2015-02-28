
//simplePolarSoundVisualization//2011//Alejandro Gonzalez//a(en)60rpm.tv//Dominio Publico/////
//////////////////////////////////////////////////////////////////////////////////////////////

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
MinimLoader minimLoader;


String 
loading = "Please wait while the song is loading... It can take a few minutes...";

final int
SAMPLES_NUMBER = 1024;
final float
ANGLE_STEP  = TWO_PI/SAMPLES_NUMBER,
SHAPE_RADIUS= 200f,
SCALE_FACTOR= 150f;
PVector
shapeCenter,
currentVertex;
PVector[]
lookupTable;
float[] 
mix;


void setup(){
  //general settings
  size(700,700,P2D);
  background(0xeeeeeeee);
  smooth();
  noStroke();
  strokeWeight(1.5);
  //declarations && other stuff
  shapeCenter  = new PVector(width/2,height/2);
  currentVertex= new PVector();
  lookupTable= new PVector[SAMPLES_NUMBER];
  mix= new float[SAMPLES_NUMBER];
  for (int i=0;i<SAMPLES_NUMBER;i++){
    float angle= i*ANGLE_STEP + HALF_PI;
    lookupTable[i]= new PVector ( cos(angle),sin(angle) ); 
  }
  //sound settings
  minim  = new Minim(this);
  minimLoader = new MinimLoader(minim,song,"0.mp3",SAMPLES_NUMBER);
  minimLoader.start();
  text (loading,10,10);
}


void draw(){
  if(!minimLoader.isRunning()){
    //fade effect
    fill(0x25eeeeee);
    rect(0,0,width,height);
    fill(0x25000000);
    //drawing music...
    mix= minimLoader.getSong().mix.toArray();
    beginShape();
      for (int i=0;i<mix.length;i++){
        float  r= SHAPE_RADIUS + mix[i]*SCALE_FACTOR;
        currentVertex= PVector.add(shapeCenter,PVector.mult(lookupTable[i],r));
        vertex (currentVertex.x,currentVertex.y);
      }
    endShape();
  }
}

void stop(){
  song.close();
  minim.stop();
  super.stop();
}



