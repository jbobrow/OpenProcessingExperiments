
/*
 * Written for the FL Creative Coding Course of Monash University
 * Week 3, 02 - array with sin()
 * modified by Luvi, June 18th 2014
 *
 * You can change the number of circles by changing 
 * the value of num in setup()
 * You can change the background colour by holding 
 * the left mouse button and dragging.
 * 
 * Challenge: modify this sketch so that if you click 
 * on a circle that circle stops and turns red and if 
 * you click on it again, it restarts with a new random 
 * speed and phase.
 */

int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = random(255);
float green = random(255);
float blue = random(255);

// array for the circles that have been caught
float [] caught;


void setup() {
  size(500, 500);
  background(255);

  num = (int) random(3,15);

  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 
  caught = new float[num];

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(10);
    phase[i] = random(TWO_PI);
    caught[i] = 0;
  }
}


void draw() {
  background(red, green, blue);

  for (int i=0; i<num; i++) {
    
    // calculate the x-position of each ball based on the speed, phase and current frame
    float x = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200;
   
   if (caught[i] == 1) {
     fill(255,0,0);
    }
    else {
      fill(red, green, blue);
      }
   
   /* Use dist() to check if your mouse position 
    * is within each circle’s radius and if so, 
    * set that circle’s speed to 0.
    */

   int radius = 20;
   ellipse(x, y[i], radius*2, radius*2);
    
    if (mousePressed) {
     if ( dist(mouseX,mouseY,x,y[i]) < radius && caught[i] == 0) {
     speed[i] = 0;
     phase[i] = 0;
     caught[i] = 1;
    }
    else if ( dist(mouseX, mouseY, x, y[i]) < radius && caught[i] == 1) {
      speed[i] = random(10);
      caught[i] = 0;
      }
    }
  }
}


// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}
