
// @ Title: Echofaxious
// @ Author: Mike Boulrice
// @ Date: 6/6/2012
// All credit for the soundcipher library goes to Andrew R. Brown www.explodingart.com/soundcipher/

// Import the soundcipher library for use with this sketch
import arb.soundcipher.*;

//instantiate the soundCipher class
SoundCipher sc = new SoundCipher(this);
SoundCipher sc2 = new SoundCipher(this);
SoundCipher sc3 = new SoundCipher(this);
SoundCipher sc4 = new SoundCipher(this);

// Screen size width
int ssx= 400;

// Screen size height
int ssy = 200;

float my  = map (ssy-mouseY, 0, height, 0, 127);

float c = 0;
int cc = 0;
int tx = 4;
// Creates an array to be selected as pitch
float[] pitchSet = {my, my+1, my+1, my, my, my+2, my+3, my+5, my+7};

// Creates a float which will be used to select a random value from the array
float setSize = pitchSet.length;

// This is used to compute the key of the notes being played
float keyRoot = 0;
float keyRoot2 = 0;
float ry1 = 0;
float ry2 = 0;
float note = 0;
float r = 0;
// Determines the pace of the notes being played
float density = 0.4;

//
float i = 1;

// Run the following a single time at startup
void setup() {
  
// Set the size of display area
  size(ssx,ssy);
  
// Set the aamount of frames rendered per seccond
  frameRate(12);
  
// Set colormode to HSB
  colorMode(HSB, 256);

// Set the instrument for each channel
  sc.instrument (120);
  sc2.instrument(121);
  sc3.instrument(125);
  sc4.instrument(123);
  
// set initial background color to black
  background(0, 0, 0);
}
//repeat the following
void draw(){
  
// as the mouse is moved from left to right speed up the pace
  delay((ssx-mouseX)/2);
 
// refresh the background to black  
background(0,0,0);  
  
// variables to hold random number
float ex1 = random(ssx); // Elipse 1 x
float ex2 = random(ssy); // Elipse 1 y
float tx1 = random(ssx); // Triangle 1 x
float ty1 = random(ssy); // Triangle 1 y
float tx2 = random(ssx); // Triangle 2 x
float ty2 = random(ssy); // Triangle 2 y
float tx3 = random(ssx); // Triangle 3 x
float ty3 = random(ssy); // Triangle 3 y 
float h = random (256); // Hue
float s = random (256); // Saturation
float b = random(256); // Brightness
float t = random(256); // Transparancy
  float my  = map (ssy-mouseY, 0, height, 0, 93);
  float[] pitchSet = {my, my+1, my+1, my, my, my+2, my+3, my+5, my+7};
  float c;
  // if a random # between 0 and 1 is greater that the set density a note will play and an image displayed
  if (random(1) < density) {
// play a note (pitch, loudness, time)
    float ry = random(90)+30;
    float rx = random(20)/10 + 0.2;
    float tc = pitchSet[(int)random(setSize)]+keyRoot;
    float ccc = cc+map(tc, 0, 100, -20, 20);
    sc.playNote(tc, ry, rx);
// select a color to fill the object(Hue, saturation, brightness, transparancy)
    fill(color(ccc, mouseX, mouseY, tc));
// draw a rectangle with selected color and random size    
    triangle(tx1, ty1, tx2, ty2, tx3, ty3);
    strokeWeight(1);
    stroke(cc,s,h);
    line(tx1, ty1, tx2, ty2);
    line(tx2, ty2, tx3, ty3);
    line(tx3, ty3, tx1, ty1);
  }
    if (frameCount%(64) == 0) {
    ry1 = random (40);
    keyRoot = (random(30)-2)*2;
    density = random(7) / 10 + 0.3;
    note = 36+keyRoot;
    sc2.playNote(note, ry1 + 70, 3.2);
    fill(color(note,random(256),random(256), random(256)));
    rect(random(ssx-100),random(ssy-80),100,(ry1*2));
  }
  if (frameCount%(tx*4) == 0) {
   ry2 = random(50);
   r = random(setSize);
   float[] pitches = {pitchSet[(int)random(setSize)]+keyRoot-12, pitchSet[(int)random(setSize)]+keyRoot-12};
   sc3.playChord(pitches, ry2+30, 0.8);
   fill(color(r,random(256),random(256), random(256)));
   rect(random(ssx-50),random(-50),50,ry2*5+50);
  }
// every 4 frames repeat the beat  
if (frameCount%(tx) == 0) {
  float i2 = i + 1;
  keyRoot2 = i2%60;
  sc4.playNote(keyRoot2+40, random(40) + 70, 0.2);
  fill(random(256),125,125,50);
  ellipse(tx1,tx2, 25, 25);
    }
  }

// Do nothing unless mouse is pressed
void mousePressed() {
  
// If the left mouse button is clicked
  if(mouseButton == LEFT) {
    
// Create a variable that will map the mouse x position to a value between 0 and 127
    float mapx = map (mouseX, 0, width, 0, 122);    
    
// Create a variable that will map the mouse y position to a value between 0 and 127    
    float mapy = map (mouseY, 0, height, 0, 122);
    
// Average the mapped mouse x and mouse y variables
    float xpa = (mapx + mapy)/2;
    cc = int(map(xpa, 0, 127, 0, 256));
// Change the instruments used
      sc.instrument (xpa);
      sc2.instrument(xpa+1);
      sc3.instrument(xpa+5);
      sc4.instrument(xpa+3);
      
// If the right mouse button is clicked
  } else if  (mouseButton == RIGHT) {  
  tx = int(random(1,12));
  }
}  

