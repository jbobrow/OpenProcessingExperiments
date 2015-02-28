
//Data obtained from: R. Abbasi et al., Phys. Rev. D 79, 062001 (2009).
//Drawing created by Ron F. Shvartsman in the Generative Design Processes Course at SCI-Arc.
//Instructed by Jeremy Rotsztain.

//This drawing is a study of Neutrino Data and and its behavorial relationships through a course
//undertaken at SCI-Arc Post-Graduate MediaSCAPES Program.

//import processing.video.*;
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

//MovieMaker mm;
PeasyCam cam;

Particle particleSystem;
float numFrames = 5000;
float lon;
float lat;
int energy;
float direction;

//declare data arrays
float[] dataDEC;
float[] dataRA;
int[] dataNRG;
float[] dataDIR;

void setup() {
  size(900,900,P3D);
  //mm = new MovieMaker(this, 900, 900, "neutrino_cloud.mov", 24, MovieMaker.JPEG, MovieMaker.LOSSLESS);
  smooth();
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(5000);


  //strokeWeight(0);
  noFill();
  stroke(255);
  strokeWeight(1);

  particleSystem = new Particle(lon,lat,energy,direction);

  //Load text file as a String
  String[] DEC = loadStrings("DEC.txt");
  String[] RA = loadStrings("RA.txt");
  String[] NRG = loadStrings("NRG.txt");
  String[] DIR = loadStrings("DIR.TXT");

  //Convert string into an array of integers
  //using ',' as a delimiter
  dataDEC = float(split(DEC[0],','));
  dataRA = float(split(RA[0],','));
  dataNRG = int(split(NRG[0],','));
  dataDIR = float(split(DIR[0],','));

  //println(DEC);
  //println(RA);
  //println(NRG);
}

void draw() {
  rotateX(-.5);
  rotateY(-.5);
  background(0);
  fill(255,0,0);
  pushMatrix();
  fill(0,0,255);
  popMatrix();
  background(0);
  particleSystem.drawData();
  //if (frameCount <= numFrames) {
  //saveFrame("dataStills=####.png");
  //}
  //mm.addFrame();
}



