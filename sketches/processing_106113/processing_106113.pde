
//Xiaofeng Lin Unconventional 3D Clock

float r;

void setup() {
  size(500, 500, P3D);
  r = width / 6;
  noStroke();
  smooth();
}

void draw() {  
  background(100);
  fill(255);
  textSize(36);
  text((hour() + ":" + minute() + ":" + second()), 20, 50);  
  
  translate(width/2, height/2);
  
  rotateX(map(hour(), 0, 23, 0, 2*PI)); // Circle of Hour
  fill(255,209,103);
  ellipse(-r, -r, r*2, r*2);
  
  rotateX(map(minute(), 0, 59, 0, 2*PI)); //Rectangle of Minute
  fill(232,153,145);
  rect(-r, -r, 3*r/2, r*2);
  
  rotateX(map(second(), 0, 59, 0, 2*PI)); //Triangle of Second
  fill(173,165,255);
  triangle(-r, -r, 30, -30, r, 2*r);


}
