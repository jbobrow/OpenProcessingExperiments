
PShape logo;

void setup() {
  size(500, 500);
  stroke(255);
  smooth();
  frameRate(30);
  logo = loadShape("YCAM_10th_logo.svg");
}
 
void draw() {
  background(255);
  
  shape(logo, 0, 0, width, height);
  
  float s = second();
  float m = minute();
  float h = hour() % 12;
 
  translate(width/2, height/2);
  //ellipse(0,0,width,height);
 
  noFill();
  stroke(0);
 
  //秒針
  pushMatrix();
  rotate(radians(s*(360/60)));
  strokeWeight(16);
  line(0,0,0,-height/4);
  popMatrix();
 
  //分針
  pushMatrix();
  rotate(radians(m*(360/60)));
  strokeWeight(16);
  line(0,0,0,-height/4);
  popMatrix();
 
  //時針
  pushMatrix();
  rotate(radians(h*(360/12)));
  strokeWeight(16);
  line(0,0,0,-height/4);
  popMatrix();
}


