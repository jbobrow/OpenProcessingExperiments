
float x1;
float y1;
float x2;
float y2;
float randomStrokeWeight;
float rValue;
float gValue;
float bValue;
float alphaValue;

void setup() {
  size(500,500);
  background(255);
  smooth();
}

void draw() {
  x1 = random(width);    // x1 has a random value between 0 and 500 (width of the window)
  y1 = random(height);   // y1 has a random value between 0 and 500 (height of the window)
  x2 = random(width);    // x2 has a random value between 0 and 500 (width) 
  y2 = random(height);   // y2 has a random value between 0 and 500 (height)
  
  randomStrokeWeight = random(1,8);  // the variable myStrokeWeight has a random value between 1 and 8
  strokeWeight(randomStrokeWeight);  // strokeWeight is set to the value of variable myStrokeWeight
  
  rValue = random(0,255);     // random value between 0 and 255 
  gValue = random(0,255);     // random value between 0 and 200 
  bValue = random(0,255);     // random value between 0 and 100 
  alphaValue = random(0,255); // random value between 0 and 255 
  
  stroke(rValue, gValue, bValue, alphaValue);  // set stroke Color 
  line(x1, y1, x2, y2);                        // draw line 
}

void mousePressed() {
  saveFrame("thumbnail.png");
}

