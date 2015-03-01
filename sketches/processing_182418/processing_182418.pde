
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
import ddf.minim.analysis.*;
// --------- Colour Schemes ----------------//
color [] group1 ={#081472,#78AF2C,#920031,#7F207B,#A65F00,#A60400};//colour1
color [] group2 ={#717DD7,#BCF46E,#E1004C,#D460CF,#FFC373,#FF0700};//colour2
color [] group3 ={#3278bf,#574a6e,#f44e52,#ce44cb,#FFC373,#d19395};//colour3
color [] group4 ={#FFF800,#ffB100,#FFFA00,#FFDE40,#D6FA3F,#E3FB71};//colour4
color [] group5 ={#ff6400,#3B0470,#009B95,#259433,#6C48D7,#26537C};//colour5
color [] group6 ={#A64100,#A069D6,#33CDC7,#66E275,#210672,#408DD2};//colour6
// --------- Image setup ----------------//
PImage img;
// --------- Minim ----------------//
Minim minim;
AudioInput in;
AudioPlayer player1;
FFT fft;
int sampleRate = 44100;
int bufferSize = 512;
int fft_base_freq = 86; // size of the smallest octave to use (in Hz) so we calculate averages based on a miminum octave width of 86 Hz 
int  fft_band_per_oct = 1; // how many bands to split each octave into? in this case split each octave into 1 band
int numZones = 0;
// --------- Variables ----------------//
float theta = 0;
float theta2 = 0;
float theta3 = 0;
float theta4 = 0;
float v1 = 0;
float v2 = 5;
float v3 = 10;
float v4 = 20;

boolean next = false;
float m = 0;

float s = 0;
float l = 0;
float r = 0;

int f = (hour()/4);
int file = 2;
// --------- Test Strings ----------------//
String[] Levels = {
  "35dB", 
  "50dB",
  "60dB",
  "70dB",
  "80dB",
  "Decibels",
 };
String[] Levels2 = {
  "Tranquil Environment", 
  "Natural Environment",
  "Office Environment",
  "High Urban Environment",
  "Industrial Environment",
 };
 int ambience = 40;
 PFont font;

void setup() {
  size(1280, 720);
  smooth();
  frameRate(25);
  // --------- Minim Setup ----------------//
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT( bufferSize, sampleRate ); // make a new fft
  // first parameter specifies the size of the smallest octave to use (in Hz), second is how many bands to split each octave into.
  fft.logAverages(fft_base_freq, fft_band_per_oct); // results in 9 bands
  fft.window(FFT.HAMMING);
  numZones = fft.avgSize(); // avgSize() returns the number of averages currently being calculated
  // println("numZones: " + numZones); // returns 9 bands
  rectMode(CENTER);
  noStroke();
  // --------- Background iMAGE ----------------//
  img = loadImage("back.jpg");
  // --------- FONT Setup ----------------//
  font = createFont("Josefin Sans",16,true);
}

void selection(){
  if (next == false){
    player1 = minim.loadFile(str(file)+"/"+str(int(random(1,5)))+".mp3", bufferSize);
    player1.play();
    println(file);
    next = true;
  }
}

void draw() {
  image(img, 0, 0);
  selection();
  waveform();
  visulizer();
  
  // --------- Mesument lines ----------------//
  strokeWeight(1.5);
  stroke(255,255,255);
  line(0, height/2+height/20, width, height/2+height/20);
  line(0, height/2-height/20, width, height/2-height/20);
  stroke(255);
  line(0, height/2+height/20*2, width, height/2+height/20*2);
  line(0, height/2-height/20*2, width, height/2-height/20*2);
  stroke(255);
  line(0, height/2+height/20*4, width, height/2+height/20*4);
  line(0, height/2-height/20*4, width, height/2-height/20*4);
  stroke(255);
  line(0, height/2+height/20*6, width, height/2+height/20*6);
  line(0, height/2-height/20*6, width, height/2-height/20*6);
  stroke(255);
  line(0, height/2+height/20*9, width, height/2+height/20*9);
  line(0, height/2-height/20*9, width, height/2-height/20*9);
  
  // --------- Text ----------------//
  noStroke();
  fill(0);
  textFont(font,16);
  textAlign(CENTER);
  text(Levels[0],width/2,height/2-height/20*0.3);
  textFont(font,20);
  text(Levels[1],width/2,height/2-height/20*1.3); 
  textFont(font,25);
  text(Levels[2],width/2,height/2-height/20*2.7); 
  textFont(font,30);
  fill(255);
  text(Levels[3],width/2,height/2-height/20*5); 
  textFont(font,36);
  text(Levels[4],width/2,height/2-height/20*7.5);
  text(Levels[5],width/2,height/2-height/20*9-5);
  
  fill(255);
  textAlign(RIGHT);
  textFont(font,16);
  text(Levels2[0],width/6*5,height/2+height/20*0.7);
  textFont(font,20);
  text(Levels2[1],width/6*5,height/2+height/20*1.7); 
  textFont(font,26);
  text(Levels2[2],width/6*5,height/2+height/20*3.2);
  textFont(font,28);
  text(Levels2[3],width/6*5,height/2+height/20*5.2); 
  textFont(font,40);
  text(Levels2[4],width/6*5,height/2+height/20*7.8);
  
  // --------- lines background ----------------//
  for (int l = 0; l < height; l = l+15) {
    strokeWeight(0.5);
    stroke(155,90);
    line(0, l, width, l);
  }
  // --------- song selecton base on input ----------------//
  for(int i = 0; i < in.bufferSize() - 1; i++) {
    if ( abs(in.mix.get(i)) > m ) {
      m = abs(in.mix.get(i)*100);
      
      if ((m > v1) && (m < v2)){
          file = 1;
        }
        if ((m > v2) && (m < v3)){
          file = 2;        
        }
       if ((m > v3) && (m < v4)){
          file = 3; 
        }
       if (m > v4){
         file = 4;
       }
      }
    if (!player1.isPlaying()) {
      println("DONE");
      next = false;
    } 
  }
 }
 
 void visulizer(){
  fft.forward(in.mix); // perform forward FFT on songs mix buffer
  int highZone = numZones - 1;
  for (int i = 0; i < numZones; i++) { // 9 bands / zones / averages
    float average = fft.getAvg(i); // return the value of the requested average band, ie. returns averages[i]
    float avg = 0;
    int lowFreq;

    if ( i == 0 ) {
      lowFreq = 0;
    } 
    else {
      lowFreq = (int)((sampleRate/2) / (float)Math.pow(2, numZones - i)); // 0, 86, 172, 344, 689, 1378, 2756, 5512, 11025
    }
    int hiFreq = (int)((sampleRate/2) / (float)Math.pow(2, highZone - i)); // 86, 172, 344, 689, 1378, 2756, 5512, 11025, 22050
    int lowBound = fft.freqToIndex(lowFreq);
    int hiBound = fft.freqToIndex(hiFreq);

    for (int j = lowBound; j <= hiBound; j++) { 
      float spectrum = fft.getBand(j); 
      avg += spectrum;
    }
    avg /= (hiBound - lowBound + 1);
    average = avg;
    // ***** 0 Hz - 86 Hz ***** // 
    // big center circle ------------------------
    if (i == 0) {  // if the frequency band is equal to 0 ie. between 0 Hz and 86 Hz

      if (average > 10.0) {
        stroke(group4[int(f)]);
      }
      else {
        stroke(group3[int(f)]);
      }
      if (average > 7.0) {
        noFill();
        strokeWeight(average/2);
        ellipse(width/2, height/2, average * ambience, average * ambience);
      }
      else {
        noFill();
        strokeWeight(5);
        ellipse(width/2, height/2, 500, 500);
      }
    }
    
    // ***** 86 Hz - 172 Hz ***** //
    // side circles ------------------------
    if (i == 1) { 
      noStroke();
      if (average > 10) {
        ellipse(width/8, height/2, average * ambience/2, average * ambience/2);
        ellipse(width/8*7, height/2, average * ambience/2, average * ambience/2);
      }
      if (average > 10 && average < 14) {
        fill(group2[int(f)]);
        ellipse(width/8, height/2, average * ambience/2, average * ambience/2);
        ellipse(width/8*7, height/2, average * ambience/2, average * ambience/2);
      } 

      if (average > 8 && average < 10) {
        fill(group6[int(f)]);
        ellipse(width/8, height/2, average * ambience/2, average * ambience/2);
        ellipse(width/8*7, height/2, average * ambience/2, average * ambience/2);
      }
       else {
        fill(group1[int(f)]);
        ellipse(width/8, height/2, 100, 100);
        ellipse(width/8*7, height/2, 100, 100);
      }
    }

    // ***** 172 Hz - 344 Hz ***** //
    // small center circle
    if (i == 2) { 
          if (average > 10.0) {
            stroke(group2[int(f)]);
          }
          if (average > 7.0) {
            noFill();
            strokeWeight(average/2);
            ellipse(width/2, height/2, average * ambience, average * ambience);
          }
          else {
            noFill();
            strokeWeight(3);
            
            fill(group2[int(f)]);
            ellipse(width/2, height/2, 250, 250);
          }
        }
    // ***** 344 Hz - 689 Hz ***** //
    // center line pluse-----------------------//
    if (i == 3) { 
      
    }
    noStroke();

    // ***** 689 Hz - 1378 Hz ***** //
    // bottom dots -----------------------//
    if (i == 4) { 
      
    }
    // ***** 1378 Hz - 2756 Hz ***** //

    if (i == 5) {   
     for(int s=0; s<10 ;s++){
        pushMatrix();
        translate(width/8*7, height/2);
        pushMatrix();
        rotate(-theta);
        translate(100, 0);
        fill(group5[int(f)]);
        ellipse(0, 0, 32, 32);
        pushMatrix();
        rotate(theta*4);
        translate(36, 0);
        fill(group4[int(f)]);          
        ellipse(0, 0, 12, 12);
        popMatrix();
        popMatrix();
        popMatrix();
        theta = theta+ 0.01 *average;
      } 
    }
    // ***** 2756 Hz - 5512 Hz ***** //
    // lines connecting dots -----------------------//
    if (i == 6) { 
      for(int s=0; s<10 ;s++){
        pushMatrix();
        translate(width/8, height/2);
        pushMatrix();
        rotate(theta3);
        translate(100, 0);
        fill(group5[int(f)]);
        ellipse(0, 0, 32, 32);
        pushMatrix();
        rotate(-theta3*4);
        translate(36, 0);
        fill(group4[int(f)]);          
        ellipse(0, 0, 12, 12);
        popMatrix();
        popMatrix();
        popMatrix();
        theta3 = theta3+ 0.01 *average;
      }
    
    }
    // ***** 5512 Hz - 11025 Hz ***** //
    if (i == 7) { 
      float newSize = map(average, 0.0, 0.3, 0.0,5);     
        for(int s=0; s<10 ;s++){
        pushMatrix();
        translate(width/2, height/2);
        pushMatrix();
        rotate(theta2);
        translate(250, 0);
        fill(group5[int(f)]);
        ellipse(0, 0, 32, 32);
        pushMatrix();
        rotate(-theta2*3);
        translate(36, 0);
        fill(group4[int(f)]);          
        ellipse(0, 0, 12, 12);
        popMatrix();
        popMatrix();
        popMatrix();
        theta2 = theta2+ 0.01 *newSize;
      }
    }
  
    
    // ***** 11025 Hz - 22050 Hz ***** //
    if (i == 8) {        
      float newSize2 = map(average, 0.0, 0.3, 0.0,5);     
        for(int s=0; s<10 ;s++){
        pushMatrix();
        translate(width/2, height/2);
        pushMatrix();
        rotate(-theta4);
        translate(250, 0);
        fill(group5[int(f)]);
        ellipse(0, 0, 32, 32);
        pushMatrix();
        rotate(theta4*3);
        translate(36, 0);
        fill(group4[int(f)]);          
        ellipse(0, 0, 12, 12);
        popMatrix();
        popMatrix();
        popMatrix();
        theta4 = theta4+ 0.01 *newSize2;
      }
    }
  }
}

void waveform() {
  // --------- Frequency wave ----------------//
   for (int j = 0; j < in.bufferSize(); j++){
      if (j>0) {
        pushMatrix();
        int scale = width/512*2; 
        scale(scale);
        strokeWeight(0.5);
        stroke(group4[int(f)]);  //this is the colour of the first line (red)
        line(j, height/scale/2 + in.mix.get(j)*100, j+1, height/scale/2 + in.mix.get(j)*100);
        popMatrix();
    }
    fill(255, 3);
     noStroke();
     float mix = in.mix.get(100)*500;
     rect(0,height/2,width*2,mix);
    }
}

void stop(){
  // always close Minim audio classes when you finish with them
  in.close();
  player1.close();
  // always stop Minim before exiting
  minim.stop();
  super.stop();
}


