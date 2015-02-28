
/*
 * SnakeDance by Geo Meadows www.mecol.co.uk
 * Based on original code by Keith Peters (www.bit-101.com). 
 */
import ddf.minim.*;
import ddf.minim.signals.*;

int segnum = 40;
float segLength =7;
boolean head;
float[] x = new float[segnum];
float[] y = new float[segnum];
int j;
//AUDIO DEFS
Minim minim;
AudioPlayer audio;
String in = "groove";  //change for your own mp3 in data dir
int samp;
float vol;
float smooth = 0.05;  //amplitude smoothing
//SETUP
void setup() {
  size(600, 400);
  colorMode(HSB,100);
  smooth(); 
  strokeWeight(5);
  stroke(10,100,100,100);
  frameRate(25);
  minim = new Minim(this);
  audio = minim.loadFile(in+".mp3");
  audio.loop();
   PFont font;
  font = loadFont("ComicSansMS-48.vlw");
  textFont(font, 16);
}
//DRAW LOOP
void draw() {
  background(20);   
  vol = lerp(vol, audio.mix.level(), smooth);
//draw amplitude bar
  int amp = int(vol*height*5);  
  rect((frameCount+1)%width, height, 5, -amp+9);
//draw snake  
  dragSegment(0, frameCount%width, height-amp);
  for(int i=0; i<x.length-1; i++) {   
    stroke(i/2,100,100,100);
    if (i == 0 ) {head=true;}
    else {head=false;}
    dragSegment(i+1, x[i], y[i]);
  }
}

void stop()
{
  audio.close();
  minim.stop();  
  super.stop();
}

//FUNCTIONS
void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  if (head) {
    ellipse(5,0,20,5); 
    stroke(0);
    ellipse(10,-3,2,2); 
  }
  else { line(0, 0, segLength, 0); }
  popMatrix();
}



