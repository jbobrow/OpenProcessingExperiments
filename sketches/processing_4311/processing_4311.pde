
// 'Coloured Sand' by Thrainn Hjalmarsson's 'SUD'
// @ http://www.openprocessing.org/visuals/?visualID=3278
// Modification by tommy

PImage b;

int  rnd = 2; 
int tally = 0; 
int high = 0;    
int low = 99999; 
int numRepeats = 1 ; 
 
void setup() 
{ 
  size(400, 600, P3D); // resized according to module brief
  frameRate(4); // changed from 200
  b = loadImage("sydney_bg.png"); // image embedded and created by me
 // b = loadImage("sydney_bg_sunset.png"); // image embedded and created by me
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
      pixels[i] = rnd >> f;  // Throw away the "less random" lower bits 
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
  image(b, 0, 0);
} 

