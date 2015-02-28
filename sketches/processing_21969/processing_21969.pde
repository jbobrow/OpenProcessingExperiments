
         ////////////////////////////////////////////////////////////
         ////                                                    ////
         ////    Sean M Gillespie                                ////
         ////    Arch 4050 ~ Computational Methods               ////
         ////    Professor Nick Senske                           ////
         ////    Beat and Level Comparative Vector Analysis      ////
         ////                                                    ////
         ////////////////////////////////////////////////////////////

//Importing the minim libraries
import ddf.minim.*;
import ddf.minim.analysis.*;

//Providing direct export of individual frames to PDF format
import processing.pdf.*;

boolean record;

//Creating space for AudioPlayer, BeatDetect, BeatListener, and Minim libraries
Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

//Allowing variables to be defined from arrayed information
//Each of points is utilized in the draw function
float[]xpoints = new float[4];
float[]ypoints = new float[4];
float[]xtarget = new float[4];
float[]ytarget = new float[4];


void setup(){
  size(800,800);
  background(255);
  stroke(0,15);
  //smooth();
  
  //Loading the minim library and utilized file for the program
  minim = new Minim(this);
  song = minim.loadFile("Slow Jamz.mp3",2048);
  song.loop();
  
  //Setting up the detecting software to analyze audio data
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  
  //Adjustment of sensitivity to changes in Kick, Snare, and Hat in BeatDetect
  beat.setSensitivity(750);
  
  //Setting the parameters for the recording of beat variations
  bl = new BeatListener(beat, song);
  
  //Creating a series of starting points for the vectors within startup
  //The array of numbers is filled by the randomization of numbers within the window
  for(int i=0; i<4; i++){
    xpoints[i] = random(width);
    ypoints[i] = random(height);
    xtarget[i] = random(width);
    ytarget[i] = random(height);
  }
}



void draw(){
  
  //Creation of an export command attempting to save individual frames to PDF
  //Each saved frame will be named after the frame # it is taken from
  if(record){
    beginRecord(PDF, "frame-####.pdf");
  }
  
  //Initial fudging to create equilibrium between input and output
  //delay(0);
  
  //The description of two functions that follow the same functional formatting of object script
  quadDrawer();
  quadCompare();
  
  //creating a closed loop saving method in order to avoid excess capture
  if(record){
    endRecord();
    record = false;
  }
}



//The first portion of function script
void quadDrawer(){
  
  //variables defined by audio input through levels(L)
  float leftLevel = song.left.level() * 1000;
  
  //variables defined by audio input through levels(R)
  float rightLevel = song.right.level() *1000;
  stroke(rightLevel,mouseX,mouseY,15);
  quad(xpoints[0],ypoints[0],xpoints[1],ypoints[1],xpoints[2],ypoints[2],xpoints[3],ypoints[3]);
  if(beat.isKick()){
      fill(rightLevel,mouseX,mouseY,25);
    }
    if(beat.isSnare()){
      fill(0,mouseX,mouseY,15);
    }
}



//The function quadCompare is utilized to adjust the display of the image itself
void quadCompare(){
  for(int i = 0; i<4; i++){
    if(int(xpoints[i])<int(xtarget[i])){
      xpoints[i]+=1;
    }
    if(int(xpoints[i])>int(xtarget[i])){
      xpoints[i]-=1;
    }
    if(int(xpoints[i])==int(xtarget[i])){
      xtarget[i] = random(width);
    }
    if(int(ypoints[i])<int(ytarget[i])){
      ypoints[i]+=1;
    }
    if(int(ypoints[i])>int(ytarget[i])){
      ypoints[i]-=1;
    }
    if(int(ypoints[i])==int(ytarget[i])){
      ytarget[i] = random(height);
    }
    if(beat.isKick()){
      xpoints[i] += 20;
      xtarget[i] += 20;
      ypoints[i] += 20;
      ytarget[i] += 20;
    }
    if(beat.isSnare()){
      xpoints[i] -=10;
      xtarget[i] -=10;
      ypoints[i] -=10;
      ytarget[i] -=10;
    }
  }
}



void stop(){
  song.close();
  minim.stop();
  super.stop();
}



class BeatListener implements AudioListener{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source){
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  void samples(float[] samps){
    beat.detect(source.mix);
  }
  void samples(float[] sampsL, float[] sampsR){
    beat.detect(source.mix);
  }
}



void keyPressed(){
  if(key == 's' || key == 'S'){
    record = true;
  }
}



void mousePressed(){
  for(int i = 0; i<4; i++){
    xpoints[i]-=40;
    ypoints[i]-=40;
    xtarget[i]+=40;
    ytarget[i]+=40;
  }
}

