
import processing.video.*;

Capture video;

int camw = 400;
int camh = 300;
int fps = 15;
int newx = 0;
int newy = 0;
int xjump = 8;
int yjump = 8;

color trackColor;
//PImage img;
int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system


void setup() {
  size(camw,camh,P3D);
  video = new Capture(this, camw, camh, fps);
  //img = loadImage( "sunflower.jpg" ); // Load the image
  cols = video.width/cellsize;  // Calculate # of columns
  rows = video.height/cellsize; // Calculate # of rows
  trackColor = color(255,0,0);
}

void draw() {
  background(0);
  video.loadPixels();
  image(video, newx, newy);
  
   float worldRecord = 500;

  // Begin loop for columns
  for (int i = cols-1; i >= 0; i-- ) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2; 
      int y = j*cellsize + cellsize/2;
      int loc = x + y*video.width;  
      color c = video.pixels[loc]; 
      float r1 = red(c);
      float g1 = green(c);
      float b1 = blue(c);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);
      
      float d = dist(r1,g1,b1,r2,g2,b2);
      
      if (d < worldRecord) {
        worldRecord = d;
        newx = x;
        newy = y;
      }

      // Calculate a z position as a function of mouseX and pixel brightness
      //float z = (mouseX/(float)video.width) * brightness(video.pixels[loc])- 100.0;

      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x,y/*,z*/); 
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();
      
      drawPoints(c);

    newx+=xjump;
    }
    newx = 0;
    newy+=yjump;
  }
  newy = 0;
  video.updatePixels();
}

void drawPoints(color c) {
  int op = 0;
  float value = saturation(c);
  tint(0, 0, 0,500);
  noFill();
  smooth();
  strokeWeight(10);
  float r = red(c);
  float g = green(c);  
  float b = blue(c);
  

  if (r < 150) {
    stroke(100, g, b);
} else if (r > 150) {
    stroke(160, b, g);
    
}

  if (g < 150) {
    stroke(r, 50, b);
} else if (g > 150) {
    stroke(r, 210, b);  
}


  if (b < 150) {
    stroke(r, g, 30);
} else if (b > 150) {
    stroke(r, g, 250);  
}

if (value > 100) {
  op = 200; } else
  { op = 0; } 

  stroke(r,g,b, op);
  point(newx, newy);
}


void captureEvent(Capture v) {
  v.read();
}




