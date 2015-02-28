
//Yeti by Sean Song

PImage yeti, snow;

float x = 487;
float y = 221; //right arm
float x2 = 324;
float y2 = 221; //left arm
float angle1 = 0.0;
float angle2 = 0.0;
float angle3 = 0.0;
float angle4 = 0.0;
float segLength = 140;
float offset;


void setup() {
  size(800, 600);
  yeti = loadImage("everest_yeti.png");
  snow = loadImage("snow.png");
  smooth(); 
  strokeWeight(50.0);
  stroke(255, 300); //second number is opacity
  
}


void draw() {
  background(yeti);
  
  float offsetTarget = map(mouseX, 0, width, -snow.height/2 - height/2, 0);
  offset += (offsetTarget-offset)*0.05; 
  //tint(255, 153);
  image(snow, offset, 0);
  
  
  
  //press the mouse to hide the cursor
  if(mousePressed == true) {
    noCursor();
  } else {
    cursor(HAND);
  }
  
  
  
  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;
  angle3 = (mouseX/float(width) + 0.5) * PI;
  angle4 = (mouseY/float(width) + 0.5) * PI;
  
  pushMatrix();
  segment(x, y, angle1); 
  segment(segLength, 0, angle2);
  popMatrix();
  
  pushMatrix();
  segment(x2, y2, angle3);
  segment(segLength, 0, angle4);
  popMatrix();
  
 } //void draw end


void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}


