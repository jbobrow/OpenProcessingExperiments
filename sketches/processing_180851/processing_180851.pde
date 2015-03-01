
int num = 30;

void setup() {
  size(400, 400);
  stroke(255);
  strokeWeight(2);
  noFill();
  smooth(8);
  colorMode(HSB, 100);
}

float a, r;

void draw() {
  background(#171717);
  translate(width/2, height/2);
  
  //Rotates the entire canvas every frame
  rotate(r);
  
  //The main loop 
  for(int i = 0; i < num; i++) {
    //Calculates HSB color value based on sin function
    float colorValues = map(sin(a), -1, 1, 0, 70+i);
    stroke(colorValues, 100, 100);
    
    //Draws the arcs
    //Declares the angle to stop the arc depending on i index
    //Based on hidden dragon by Jerome Herr
    // -- http://p5art.tumblr.com/
    float maxArc = TWO_PI/num*i;
    
    //Maps the maximum angle to a sin function
    float mapArc = map(sin(a), -1, 1, 0, maxArc+TWO_PI);
    
    //Draws smaller arcs each loop, starting from 350
    float maxSize = 350 - i*11;
    
    //Draws the arc with all parameters
    arc(0, 0, maxSize, maxSize, mapArc, mapArc+PI);
  }
  
  a = a + 0.03;
  r = r + 0.2;
}
