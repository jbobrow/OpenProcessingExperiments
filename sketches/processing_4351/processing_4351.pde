
// 'Coloured Sand' based on Thrainn Hjalmarsson's 'SUD'
// @ http://www.openprocessing.org/visuals/?visualID=3278
// Movement by based on Danny's 'Swarm of human movement'
// @ http://openprocessing.org/visuals/?visualID=4252
// Modification by Tommy | ARCH1391 | Module 2: Dynamic Projection

PImage b; // image imported by me

int  rnd = 2; 
int tally = 0; 
int high = 0;    
int low = 99999; 
int numRepeats = 1 ; 
float x, y; 
float size = 20; 
 
void setup() 
{ 
  size(400, 600, P3D); // resized according to module brief
  frameRate(4); // changed from 200
  b = loadImage("sydney_bg_sunset.png"); // image embedded and created by me
} 
 
void draw() 
{ 
  loadPixels(); 
  int frameStart = millis(); 

  int f = 1 + (second()/2);
 
  for (int repeat = 0; repeat < numRepeats; repeat++) 
  { 
    for (int i = pixels.length - 1; i >= 0; i--) 
    { 
      rnd *= 16807; 
      pixels[i] = rnd >> f;
    } 
  } 
  int now = millis(); 
  int frameTime = now - frameStart; 
  if (frameTime < low) low = frameTime; 
  if (frameTime > high) high = frameTime; 
  tally += frameTime; 
  float average = tally / (float)(frameCount); 
  float frac = 1.0 / numRepeats; 
  updatePixels();
   
// code below ported from Danny's 'Swarm of human movement'
// incorporated img instead of shapes to create illusion of moving panoramic landscape

  x = x + 4; // changed translation amount
   
  if (x > width + size) { 
    x = -size; 
  }  
   
  translate(x, 0); 
  image(b, -624, 0); // some offset on the img; used image instead of primitives
   
} 

