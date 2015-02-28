
/**
 * Array 2D. 
 * 
 * Demonstrates the syntax for creating a two-dimensional (2D) array.
 * Values in a 2D array are accessed through two index values.  
 * 2D arrays are useful for storing images. In this example, each dot 
 * is colored in relation to its distance from the center of the image. 
 */

float[] distances;
float maxDistance;
int spacer;

void setup() {
  size(640, 360);
  maxDistance = dist(width/2, height/2, width, height);
  distances = new float[width];
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) { 
      float[] z;     
      z[x] = random(-10,10);
      distances[x] = x+10+z;
    }
  }
  spacer = 10;
  noLoop();  // Run once and stop
}

void draw() {
  background(0);
  // This embedded loop skips over values in the arrays based on
  // the spacer variable, so there are more values in the array
  // than are drawn here. Change the value of the spacer variable
  // to change the density of the points

    for (int x = 0; x < width; x += spacer) {
     //if(z[x]>0)
      stroke(255);
     //else
      //stroke(255); 
      point(x + spacer/2, distances[x]);
    }
 
}



