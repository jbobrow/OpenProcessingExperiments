
//tweaked from http://yoppa.org/proga10/1419.html

void setup() {
  size(320,480);
  stroke(255);
  smooth();
  frameRate(3);
}
 
void draw() {
  background(0);
  float s = second();
  float m = minute();
  float h = hour() % 12;
 
 
  translate(320/2, 480/2);
  ellipse(0,0,300,300);
 
  noFill();
  stroke(random(255),random(255),random(255));
 
  //秒針
  pushMatrix();
  rotate(radians(s*(360/60)));
  strokeWeight(1);
//   ellipse(0,150,20,20);
 line(0,0,0,-300/2);
  popMatrix();
 
  //分針
  pushMatrix();
  rotate(radians(m*(360/60)));
  strokeWeight(3);
  line(0,0,0,-300/2);
  popMatrix();
 
  //時針
  pushMatrix();
  rotate(radians(h*(360/12)));
  strokeWeight(5);
  line(0,0,0,-300/3);
  popMatrix();
}
