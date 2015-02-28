
// A Polar coordinate
float r = 40;         //radius
float theta = 0;      //angle
float h = 0;
float s = 200;
float b = 200;
int d = 1;

void setup() {
  size(200, 500);
  background(255);
  noSmooth();
  frameRate(200);
}
void draw() {
  // change from Polar to Cartesian...
  float x = r * cos(theta);    //x loc
  float y = r * sin(theta);    //y loc 
  
  r-=-.01;    //radius changes, makes spiral

  // Draw an ellipse at x,y
  noStroke();
  colorMode(HSB);
  fill(h, s, b);
  ellipse(x + width/2, y + height/2, 16, 16); // Adjust for center of window
  
  //draw a rectangle
  if (mousePressed) { //if mouse pressed, trail shows
    background(mouseX,s,b);    //BG changes if you press & hold mouse!
  }
  
  //making rectangles in corners
  rectMode(CORNERS);
  rect(0,0,20,20);
  rect(width, 0, width-20, 20);
  rect(width, height, width-20, height-20);
  rect(0, height, 20, height-20);
  
  //setting hue to change color overtime
  //sat. and brightness change according to mouse position
  h += 1*d;
  s = mouseX;
  b = mouseY;
  
  //only prints hsb when mouse moves
  if(mouseX != pmouseX || mouseY != pmouseY) {
    println("hsb: " + h + ", " + s + ", " + b); 
  }
  
  //makes hue reverse when it hits 360, so gradual color change
  if (h>=360 || h <=0) {    
    d *= -1;
  }
  
  // change angle overtime
  theta += 0.01;
}



