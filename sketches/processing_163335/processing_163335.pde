
// Week 5 assignment - expressive color
// Deena Khattab - IML 404

import ddf.minim.*;
Minim minim;
AudioPlayer song;

PFont myFont;

float increment = 0.01;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.02; 

void setup() {
  size(900, 300);
  frameRate(100);
  
  // loads sound file from data folder
  minim = new Minim(this);
  song = minim.loadFile("lavieenRose.wav");
  song.play();
}

void draw() {

  // defines noise detail 
  noiseDetail(8,0.65f);
  
  loadPixels();

  float xoff = 0.0; // Start xoff at 0
  
  // calculates noise value for every x, y coordinate
  for (int x = 0; x < width; x++) {
    xoff += increment;   
    float yoff = 0.0;   
    for (int y = 0; y < height; y++) {
      yoff += increment; 
      
      // Calculate noise and scale by 255
      float bright = noise(xoff,yoff,zoff)*255;
      
      // controls color of each dimension
      pixels[x+y*width] = color(200,bright,bright);
    }
  }
  updatePixels();
  
  zoff += zincrement; 
  
  myFont = createFont("Lavanderia Regular.otf", 22);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  fill(50, 20, 50);
  text("la vie en rose", width/2,255);
  
}


