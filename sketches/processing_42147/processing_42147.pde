
/*
 CO2 Emissions with data from The Gaurdian DataStore.
 */

import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioSnippet snip;
AudioOutput out;
SineWave sine;
TriangleWave tri;
PinkNoise pn;


Emissions[] Emissions1 = new Emissions[0];
ColorFade[] ColorFade1 = new ColorFade[1];
String[] input1;
String[] splits;
float[] ems;
float currentEm;
float lastMillis;
int emCount = 0;
int allCount = 0;
int splitCount = 0;

float hertz = 0;
float volume = 0;


void setup() {
  size(900, 800, OPENGL);
  background(255);
  smooth();

  minim = new Minim(this);  
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);

  //Load the .CSV files
  input1 = loadStrings("C02_emissions.csv");
  ems = new float[input1.length];

  fillNewValues();

  for (int i = 0; i < Emissions1.length; i++) {
    Emissions1[i] = new Emissions(currentEm);
  }
  for (int i = 0; i < ColorFade1.length; i++) {
    ColorFade1[i] = new ColorFade();
  }
}


void draw() { 
//  BGr = floor(random(200,255));
//  BGrZ += (BGr-BGrZ)*0.05;
//  println(BGr);
//  background(BGrZ,BGrZ,BGrZ);
  //background(random(200,255),random(200,255),random(200,255));
  //opencv.read(); // read a new frame
  //image( opencv.image(), 0, 0 ); // and display image
  
  for (int i = 0; i < ColorFade1.length; i++) {
    ColorFade1[i].display();
    ColorFade1[i].update();
  }

  for (int i = 0; i < Emissions1.length; i++) {
    Emissions1[i].display();
    Emissions1[i].update();
    //println(Emissions1.length);
  }  

  // set the time interval
  if (millis()>lastMillis+1000) { //been at least 200 millis 
    lastMillis=millis();
    for (int ii = 0; ii< 1; ii++) {
      if (emCount < 225) {
        currentEm = ems[emCount];
        Emissions temps = new Emissions(currentEm);
        Emissions1 = (Emissions[])append (Emissions1, temps);
        hertz = floor(map(currentEm, 0, 6300, 100, 600)/100);
        hertz = hertz*110;
        volume = int(map(currentEm, 0, 6300, 0.4, 0.8)*10);
        volume = volume*0.1;
        //println(hertz);
        //println(volume);
        Emissions1[allCount].randomStart(hertz, volume);
        emCount += 1;
        allCount += 1;
      } 
      else if (splitCount < 28) {
        emCount = 0;
        splitCount += 1;
        fillNewValues();
      }
    }
  }
}

void fillNewValues() {
  if (splitCount < 28) {
    for (int i=0; i < input1.length; i++) {
      splits = input1[i].split(",");
      for (int ii=0; ii < 1; ii++) {
        ems[i] = float(splits[splitCount]);
      }
    }
  }
  //println(splitCount);
  //println(ems[0]);
}


void stop() {
  out.close();
  minim.stop();
  super.stop();
}


