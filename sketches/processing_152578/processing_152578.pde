
/*
 * Creative Coding
 * Week 3, 06 - rule-based system
 * by Indae Hwang and Jon McCormack
 * tweaked by Jessica Fenlon
 *
 * This sketch draws a series of moving Elements (circles) according to the following rules:
 * - start from a random position and move in a constant random direction
 * - if the point reaches the boundary of the screen move in the opposite direction with new velocity
 * - if the circles intersect then draw a line connecting their centres, colouring the line based on the circle being odd or even
 *
 * For reasons unknown to me, I started playing with 3-dimensional space by adding z-coordinates.
 * Forcing the array to shift to 3D spheres would have invited an entire rewrite of the sketch,
 * not something I'm up to tonight. But this was fun, playing with adding a parameter to 
 * the operating space of the moving spheres, and getting the arrows to display it for me.
 * Oh plus switched to translucent ellipses. !FUN!
 */

float[] x;      // position
float[] y;
float[] z;
float[] xInc;   // change per frame
float[] yInc;
float[] zInc;
int numArray;   // number of elements

float proximity;  // if distance between elements < proximity then draw a line between them

void setup() {
  size(800, 450, P3D);
  frameRate(36);
  numArray = 48;

  // allocate arrays
  x= new float[numArray];
  y= new float[numArray];
  z= new float[numArray];
  xInc= new float[numArray];
  yInc= new float[numArray];
  zInc= new float[numArray];
  
  proximity = 48;   // influence distance

  // random starting position and direction
  for (int i=0; i<numArray; i++) {
    x[i] = random(width);
    y[i] = random(height);
    z[i] = random(Z);
    xInc[i] = random(-1, 1);
    yInc[i] = random(-1, 1);
    zInc[i] = random(-1, 1);
  }

  strokeWeight(2);
}

void draw() {

  background(255);

  // iterate over each point
  for (int i=0; i<numArray; i++) {

    x[i] += xInc[i];
    y[i] += yInc[i];
    z[i] += zInc[i];

    // bounce off the sides of the window
    if (x[i] > width || x[i] < 0) {
      xInc[i] = xInc[i] > 0 ? -random(3) : random(3);
    }

    if (y[i] > height || y[i] < 0 ) {
      yInc[i] = yInc[i] > 0 ? -random(3) : random(3);
    }
    
    if (z[i] > (height+width)/5 || z[i] < -100) {
      zInc[i] = zInc[i] > 0 ? -random(3) : random(3);
    }
    drawElement(x[i], y[i], z[i], xInc[i], yInc[i], zInc[i]);
  }

  for (int i=0; i<numArray; i++) {
    for (int j=0; j<i; j++) {
      float dist = dist(x[i], y[i], z[i], x[j], y[j], z[j]);
      if (dist < proximity) {
        if (i%2 == 0 || j%2==0) {
          stroke(0, 0, 255, 80);
        } 
        else {
          stroke(255, 0, 255, 80);
        }
        line(x[i], y[i], z[i], x[j], y[j], z[j] );
      }
    }
  }
}

void drawElement(float x, float y, float z, float dx, float dy, float dz) {

  // draw the point in red
fill(255,0,0,75);
stroke(255, 0, 0);
ellipse(x, y, z, z);
  
//noStroke();
//lights();
//translate(x, y, z);
//sphere(proximity);

  // draw an arrow in the current direction of travel
  stroke(0, 100);
  float endX = x + (dx*30);
  float endY = y + (dy*30);
  float endZ = z + (dz*30);
  float arX = x + (dx*25);
  float arY = y + (dy*25);
  float arZ = z + (dz*25);
  line(x, y, z, endX, endY, endZ);
  line(endX, endY, endZ, arX + (dy * 5), arY - (dx * 5), arZ + (dz * 5));
  line(endX, endY, endZ, arX - (dy * 5), arY + (dx * 5), arZ - (dz * 5));


  // draw the boundary of proximity
  stroke(0, 10);
  ellipse(x, y, z, z);
}

