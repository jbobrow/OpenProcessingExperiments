

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
  background(200);
  size(800, 800);
  smooth();
  strokeWeight(2);
}
 
//draw -----
 
void draw() {
  i = i + .02; //changes path
  j = j + .05; //changes path
 
  //_____________________________
 
  //changes color increment
  k = k + 2;
  if (k > 142) {
    k = 0;
  }
  fill(20);
  stroke(k, 72, 255,70); //changes color range
 
  float a = map(cos(i/2), -2, 2, 0, width);
  float b = map(sin(i), -1, 1, 0, height);
  float c = map(cos(j*2), -2, 2, 0, width);
  float d = map(sin(j), -1, 1, 3, height);
 
  ellipse(a, b, c, d);
}


