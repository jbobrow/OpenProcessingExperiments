
/*
 * Creative Coding
 * Exercise w_03_02 -JugglingActD
 * by DEFurugen
 *
 * This program demonstrates the use of arrays.
 * It creates three arrays that store the y-position, speed and phase of some oscillating circles.
 * You can change the number of circles by changing the value of num in setup()
 * You can change the background colour by holding the left mouse button and dragging.
 * 
 */

int     num;    // the number of items in the array (# of circles)
float   radius; // radius of each circle
float[] x;      // x-position of each circle 
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = 100;
float green = 80;
float blue = 220;

void setup() {
  size(500, 500);

  num = 7;
  radius = 45;
  
  // allocate space for each array
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(6);
    phase[i] = random(TWO_PI);
  }
}
   
void draw() {
  background (red, green, blue);

  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    x[i] = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200;
    fill (random(255), random(255), 255);
    ellipse(x[i], y[i], radius, radius);
  }
}


// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, random(255));
  green = map(mouseY, 0, height, 0, random (255));
  blue = map(mouseX+mouseY, 0, width+height, random(255), 0);
}
 
 void mousePressed() {
   
  for(int i=0; i<num; i++){
  if (dist(mouseX, mouseY, x[i], y[i]) <= radius) {
    if (speed[i] > 0){ //moving
      speed[i] = 0;
    } else {
      speed[i] = random(6);
      phase[i] = random(HALF_PI);
    }
   }
 }
} 
 


