
/*
Final project Introduction to Computational Arts: Processing
march 2014 by Felicia Rindt
Before starting this course I never made my own code in any programming language and this is my fourth sketch I ever made in processing
The theme of my project is music. In this interactive sketch you can play the piano using keyboard input.
While you play, you will hear the sound of the piano key you press and random shapes will be drawn to the canvas to create your own art.
See comments in the code for a further description of the functions.
*/


//global variables
//Declare a PImage variable type
PImage bg;

//import audio files
import ddf.minim.*;

Minim minim;
//set audio samples variables
AudioSample c3key;
AudioSample csharp3key;
AudioSample d3key;
AudioSample dsharp3key;
AudioSample e3key;
AudioSample f3key;
AudioSample fsharp3key;
AudioSample g3key;
AudioSample gsharp3key;
AudioSample a3key;
AudioSample asharp3key;
AudioSample b3key;
AudioSample c4key;
AudioSample csharp4key;
AudioSample d4key;
AudioSample dsharp4key;
AudioSample e4key;

//setup
void setup(){
  //setup canvas size 1280 by 720 pixels
  size(1280, 720);
  //load an image file from HDD and set as background
  bg = loadImage("Background.jpg");
  background(bg);
  //set audio samples
  minim = new Minim(this);
  c3key = minim.loadSample("c3key.mp3");
  csharp3key = minim.loadSample("csharp3key.mp3");
  d3key = minim.loadSample("d3key.mp3");
  dsharp3key = minim.loadSample("dsharp3key.mp3");
  e3key = minim.loadSample("e3key.mp3");
  f3key = minim.loadSample("f3key.mp3");
  fsharp3key = minim.loadSample("fsharp3key.mp3");
  g3key = minim.loadSample("g3key.mp3");
  gsharp3key = minim.loadSample("gsharp3key.mp3");
  a3key = minim.loadSample("a3key.mp3");
  asharp3key = minim.loadSample("asharp3key.mp3");
  b3key = minim.loadSample("b3key.mp3");
  c4key = minim.loadSample("c4key.mp3");
  csharp4key = minim.loadSample("csharp4key.mp3");
  d4key = minim.loadSample("d4key.mp3");
  dsharp4key = minim.loadSample("dsharp4key.mp3");
  e4key = minim.loadSample("e4key.mp3");
}

void draw() {
  
//Draw white piano keys as rectangles
fill(#FFFFFF); 
strokeWeight(2);
stroke(#000000);
rect(140, 220, 60, 300);
rect(200, 220, 60, 300); 
rect(260, 220, 60, 300);
rect(320, 220, 60, 300); 
rect(380, 220, 60, 300); 
rect(440, 220, 60, 300); 
rect(500, 220, 60, 300); 
rect(560, 220, 60, 300); 
rect(620, 220, 60, 300); 
rect(680, 220, 60, 300);

//Draw black piano keys as rectangles
fill(#000000);
rect(180, 220, 40, 200);
rect(240, 220, 40, 200);
rect(360, 220, 40, 200);
rect(420, 220, 40, 200);
rect(480, 220, 40, 200);
rect(600, 220, 40, 200);
rect(660, 220, 40, 200);

noFill();
}

/* 
You can play the piano if you have a US or Spanish QWERTY keyboard, using the second row ('a' up to ';' or 'ñ' key for spanish keyboards) to play the white keys and the first row ('w' 'e' 't' 'y' 'u' 'o' 'p') to play the black keys.
When keys 'a' 's' 'd' 'f' 'g' 'h' 'j' 'k' 'l' ';' or 'ñ' are being pressed,
a random shape will appear in the speaker. Starting with a triangle for the 'a' up to a dodecagon (polygon with 12 sides) for the ';' key (or 'ñ' key for spanish keyboards)
The colour for the shapes are random and to reset your drawing simply press backspace or delete.
You can now try to make your own little piece of art while you play the piano.
*/

void keyPressed () {
// if 'a' or 'A' is pressed on your keyboard
if ( key == 'a' || key == 'A') {
  //audio sample of the c key will play
  c3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#CE9A77);
  beginShape();
  vertex(140, 220);
  vertex(180, 220);
  vertex(180, 420);
  vertex(200, 420);
  vertex(200, 520);
  vertex(140, 520);
  endShape();
  noFill();
  
  //draw a random sized and coloured triangle in the speaker
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 3, 3);
  //maximum radius for the drawings
  float radius = random(100);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
 } 
// if 'w' or 'W' is pressed on your keyboard    
if ( key == 'w' || key == 'W') {
  //audio sample of the c sharp key will play
  csharp3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#906C55);
  rect(180, 220, 40, 200);
}
// if 's' or 'S' is pressed on your keyboard
if ( key == 's' || key == 'S') {
  //audio sample of the d key will play
  d3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#CE9A77);
  beginShape();
  vertex(220, 220);
  vertex(240, 220);
  vertex(240, 420);
  vertex(260, 420);
  vertex(260, 520);
  vertex(200, 520);
  vertex(200, 420);
  vertex(220, 420);
  vertex(220, 220);
  endShape();
  noFill();
  
  //draw a random sized and coloured quadrilateral in the speaker
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 4, 4);
  //maximum radius for the drawings
  float radius = random(100);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
  } 
// if 'e' or 'E' is pressed on your keyboard
if ( key == 'e' || key == 'E') {
  //audio sample of the d sharp key will play
  dsharp3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#906C55);
  rect(240, 220, 40, 200);
}

// if 'd' or 'D' is pressed on your keyboard
if ( key == 'd' || key == 'D') {
  //audio sample of the e key will play
  e3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#CE9A77);
  beginShape();
  vertex(280, 220);
  vertex(320, 220);
  vertex(320, 520);
  vertex(260, 520);
  vertex(260, 420);
  vertex(280, 420);
  vertex(280, 220);
  endShape();
  noFill();
  
  //draw a random sized and coloured pentagon in the speaker
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 5, 5);
  //maximum radius for the drawings
  float radius = random(100);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
 } 

// if 'f' or 'F' is pressed on your keyboard
if ( key == 'f' || key == 'F') {
  //audio sample of the f key will play
  f3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#CE9A77);
  beginShape();
  vertex(320, 220);
  vertex(360, 220);
  vertex(360, 420);
  vertex(380, 420);
  vertex(380, 520);
  vertex(320, 520);
  vertex(320, 220);
  endShape();
  noFill();
  
  //draw a random sized and coloured hexagon in the speaker
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 6, 6);
  //maximum radius for the drawings
  float radius = random(100);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
 } 

// if 't' or 'T' is pressed on your keyboard
if ( key == 't' || key == 'T') {
  //audio sample of the f sharp key will play
  fsharp3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#906C55);
  rect(360, 220, 40, 200);
}

// if 'g' or 'G' is pressed on your keyboard
if ( key == 'g' || key == 'G') {
  //audio sample of the g key will play
  g3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#CE9A77);
  beginShape();
  vertex(400, 220);
  vertex(420, 220);
  vertex(420, 420);
  vertex(440, 420);
  vertex(440, 520);
  vertex(380, 520);
  vertex(380, 420);
  vertex(400, 420);
  vertex(400, 220);
  endShape();
  noFill();
  
  //draw a random sized and coloured heptagon in the speaker
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 7, 7);
  //maximum radius for the drawings
  float radius = random(100);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
 } 

// if 'y' or 'Y' is pressed on your keyboard
if ( key == 'y' || key == 'Y') {
  //audio sample of the g sharp key will play
  gsharp3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#906C55);
  rect(420, 220, 40, 200);
}

// if 'h' or 'H' is pressed on your keyboard
if ( key == 'h' || key == 'H') {
  //audio sample of the a key will play
  a3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#CE9A77);
  beginShape();
  vertex(460, 220);
  vertex(480, 220);
  vertex(480, 420);
  vertex(500, 420);
  vertex(500, 520);
  vertex(440, 520);
  vertex(440, 420);
  vertex(460, 420);
  vertex(460, 220);
  endShape();
  noFill();
  
  //draw a random sized and coloured octagon in the speaker
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 8, 8);
  //maximum radius for the drawings
  float radius = random(100);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
 } 

// if 'u' or 'U' is pressed on your keyboard
if ( key == 'u' || key == 'U') {
  //audio sample of the a sharp key will play
  asharp3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#906C55);
  rect(480, 220, 40, 200);
}

// if 'j' or 'J' is pressed on your keyboard
if ( key == 'j' || key == 'J') {
  //audio sample of the b4 key will play
  b3key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#CE9A77);
  beginShape();
  vertex(520, 220);
  vertex(560, 220);
  vertex(560, 520);
  vertex(500, 520);
  vertex(500, 420);
  vertex(520, 420);
  vertex(520, 220);
  endShape();
  noFill();
  
  //draw a random sized and coloured nonagon in the speaker
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 9, 9);
  //maximum radius for the drawings
  float radius = random(105);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
 } 

// if 'k' or 'K' is pressed on your keyboard
if ( key == 'k' || key == 'K') {
  //audio sample of the c4 key will play
  c4key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#CE9A77);
  beginShape();
  vertex(560, 220);
  vertex(600, 220);
  vertex(600, 420);
  vertex(620, 420);
  vertex(620, 520);
  vertex(560, 520);
  vertex(560, 220);
  endShape();
  noFill();
  
  //draw a random sized and coloured decagon in the speaker
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 10, 10);
  //maximum radius for the drawings
  float radius = random(100);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
 } 

// if 'o' or 'O' is pressed on your keyboard
if ( key == 'o' || key == 'O') {
  //audio sample of the c4 sharp key will play
  csharp4key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#906C55);
  rect(600, 220, 40, 200);
}

// if 'l' or 'L' is pressed on your keyboard  
if ( key == 'l' || key == 'L') {
  //audio sample of the d4 key will play
  d4key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#CE9A77);
  beginShape();
  vertex(640, 220);
  vertex(660, 220);
  vertex(660, 420);
  vertex(680, 420);
  vertex(680, 520);
  vertex(620, 520);
  vertex(620, 420);
  vertex(640, 420);
  vertex(640, 220);
  endShape();
  noFill();
  
  //draw a random sized and coloured hendecagon in the speaker
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 11, 11);
  //maximum radius for the drawings
  float radius = random(100);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
 } 

// if 'p' or 'P' is pressed on your keyboard
if ( key == 'p'|| key == 'P') {
   //audio sample of the d4 sharp key will play
  dsharp4key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#906C55);
  rect(660, 220, 40, 200);
}

// if ';' or ':' is pressed on your keyboard
if ( key == ';'|| key == ':') {
  //audio sample of the e4 key will play
  e4key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard
  fill(#CE9A77);
  beginShape();
  vertex(700, 220);
  vertex(740, 220);
  vertex(740, 520);
  vertex(680, 520);
  vertex(680, 420);
  vertex(700, 420);
  vertex(700, 220);
  endShape();
  noFill();
  
  //draw a random sized and coloured dodecagon in the speaker
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 12, 12);
  //maximum radius for the drawings
  float radius = random(100);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
 } 
 
// if 'ñ' or 'Ñ' is pressed on your keyboard
if ( key == 'ñ'|| key == 'Ñ') {
  //audio sample of the e4 key will play
  e4key.trigger();
  //the piano key you play will change to a brown/orange-ish colour when you press the key on your computer keyboard 
  fill(#CE9A77);
  beginShape();
  vertex(700, 220);
  vertex(740, 220);
  vertex(740, 520);
  vertex(680, 520);
  vertex(680, 420);
  vertex(700, 420);
  vertex(700, 220);
  endShape();
  noFill();
 
  //draw a random sized and coloured dodecagon in the speaker 
  pushMatrix();
  translate(1070, 430);
  int circleResolution =(int)map(0, 0, height, 12, 12);
  //maximum radius for the drawings
  float radius = random(100);
  float angle = TWO_PI/circleResolution;
  //style
  colorMode(HSB, width, height, 105);
  strokeWeight(random(6));
  stroke(random(width), random(height), random(100, 360), 100);
  //draw polygons 
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
 } 
}


void keyReleased(){
  //when the delete or backspace key is released, the drawing in the speaker will reset
  if (key == DELETE || key == BACKSPACE) background(bg);
  //when enter is released, a screenshot will save if you saved the code to your computer
  if (key == ENTER) saveFrame("screenshot.png");
}


