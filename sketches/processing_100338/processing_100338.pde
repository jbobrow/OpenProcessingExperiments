
/**
 * Explode 
 * by Daniel Shiffman. 
 * 
 * slight tweak by David Cox
 **/
 
/* @pjs preload="eames.jpg"; */ 

Starfield starfield;

PImage babe1,babe2,babe3;       // The source image
int cellsize = 2; // Dimensions of each cell in the grid
int cellsize2 = 4;
int cellsize3 = 8;
int columns, rows, columns2, rows2, columns3, rows3;   // Number of columns and rows in our system


void setup() {
  size(850, 379, P3D); 
  babe1 = loadImage("eames.jpg");  // Load the image
  babe2 = loadImage("eames.jpg");
  babe3 = loadImage("eames.jpg");
  columns = babe1.width / cellsize;  // Calculate # of columns
  rows = babe1.height / cellsize;  // Calculate # of rows
  columns2 = babe2.width / cellsize2;
  rows2 = babe2.height / cellsize2; 
  columns3 = babe3.width / cellsize3;
  rows3 = babe3.height / cellsize3; 
  starfield = new Starfield(100);
}

void draw() {
  background(0);
  starfield.draw(); 
  // Begin loop for columns
  for ( int i = 0; i < columns; i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*babe1.width;  // Pixel array location
      color c = babe1.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX / float(width/2)) * brightness(babe1.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x, y, z);
      float randomcolor = random(255);
      fill(c, randomcolor);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
  
   for ( int k = 0; k < columns2; k++) {
    // Begin loop for rows
    for ( int l = 0; l < rows2; l++) {
      int x = k*cellsize2 + cellsize2/2;  // x position
      int y = l*cellsize2 + cellsize2/2;  // y position
      int loc = x + y*babe2.width;  // Pixel array location
      color c = babe2.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX / float(width/4)) * brightness(babe2.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x+280, y, z);
      float randomcolor = random(255);
      fill(c, randomcolor);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize*4, cellsize*4);
      popMatrix();
    }
  }
  
   for ( int m = 0; m < columns3; m++) {
    for ( int n = 0; n < rows3; n++) {
      int x = m*cellsize3+ cellsize3/2;  // x position
      int y = n*cellsize3 + cellsize3/2;  // y position
      int loc = x + y*babe3.width;  // Pixel array location
      color c = babe3.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX / float(width/8)) * brightness(babe3.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x+560, y, z);
      float randomcolor = random(255);
      fill(c, randomcolor);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize*8, cellsize*8);
      popMatrix();
    }
  } 
}

public class Starfield {
private Star stars[];
private int count;
public Starfield( int count ) {
this.count = count;
stars = new Star[count];
for ( int i =0; i < count; i++) {
stars[i] = new Star( random( width ), random( height ), random( 50 ));
}
}
public void draw() {
strokeWeight(random(255));
for ( int i =0; i < count; i++) {
  float randomstar = random(255);
stroke( stars[i].z * randomstar );
point( stars[i].x, stars[i].y );
stars[i].x -= stars[i].z;
if (stars[i].x < 0) {
stars[i] = new Star( width, random( height ), sqrt(random( 100 )));
}
}
}
}
class Star {
float x, y, z;
Star( float x, float y, float z ) {
this.x = x;
this.y = y;
this.z = z;
}
}


