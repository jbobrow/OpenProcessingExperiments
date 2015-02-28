
/*
Pearlyn Lii
 ID 3 - Spring 2013
 1/31/13
 */

//declare global variables -----

float i = 0;
float j = 0;
float k = 0;

//setup -----

void setup() {
  background(255); // background white
  size(800, 800);
  smooth();
  strokeWeight(2);
  colorMode(HSB); // change color mode
}

//draw -----

void draw() {
  i = i + .01; //changes path 
  j = j + .05; //changes path

  //_____________________________

  //changes color increment
  k = k + 1; 
  if (k > 300) {
    k = 0;
  }
  stroke(k, 70, 200, 30); //changes color range // EDIT changed Hue value to k; saturation to 100 and brilliance to 200

  float a = map(cos(i), -2, 2, 0, width+800);
  float b = map(sin(i), -1, 1, 0, height);
  float c = map(cos(j), -2, 2, 0, width-800);
  float d = map(sin(j), -1, 1, 0, height);

  line(a, b, c, d);
}


