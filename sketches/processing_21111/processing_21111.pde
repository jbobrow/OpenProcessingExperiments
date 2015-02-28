
PImage img;       // The source image
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

float freq = 0;
float amp = 0;
float samples = 512;

int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system
float extrude = 0;
float cameraX, cameraY;
  
void setup() {
  size(900, 900, P3D);
  colorMode(HSB);

  img  = loadImage("Painting.jpg"); // Load the image
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;            // Calculate # of rows
  
  minim = new Minim(this);
  out = minim.getLineOut(150);
  sine = new SineWave(freq, amp, samples);
  out.addSignal(sine);
}
  
void draw() {
  cameraX = radians(map(mouseX, 0, width, -135, 45));
  cameraY = radians(map(mouseY, 0, height, 180, 0));
  
  println(cos(cameraX));
  
  camera(500 * cos(cameraX * 2), 0, 500 * sin(cameraX * 2), width/2, height/2, 0, 0, 1, 0);
  
  background(0);
  loadPixels();
  // Begin loop for columns
  for ( int i = 0; i < cols;i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color myColor = img.pixels[loc];       // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (floor(extrude)) * brightness(img.pixels[loc])/10;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x,y,z);
      fill(myColor);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();
      
      color soundColor = get(mouseX,mouseY);
  
      float freq = map(int(floor(brightness(myColor))), 0, 255, 1, 150);
      sine.setFreq(freq);
    }
  }
}
 
void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      extrude++;
    }
    else if(keyCode == DOWN){
      extrude--;
    }
  }
  /*if (key == 'm'){
    if(out.isMuted()){
      out.unMute();
    }
    else{
      out.mute();
    }
  }*/
}

void stop(){
  out.close();
  minim.stop();
}

