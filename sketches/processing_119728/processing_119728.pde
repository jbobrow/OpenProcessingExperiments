
float swing_angle=6;
void setup() {
  size(300,300);
}
void draw() {
  background(0);
  float secondMap=map(second(),0,59,0,width);
  float secondAngle=secondMap+swing_angle;
  translate(width/2,height/2);
  rotate(radians(secondAngle));
  noStroke();
  fill(255, 255, 102);
  ellipse(0, 130, 20, 20);
  
  resetMatrix();
  float minuteMap=map(minute(),0,59,0,width);
  float minuteAngle=minuteMap+swing_angle;
  translate(width/2,height/2);
  rotate(radians(minuteAngle));
  noStroke();
  fill(0, 153, 76);
  ellipse(0, 80, 30, 30);
  printMatrix();
  
  resetMatrix();
  float hourMap=map(hour(),0,59,0,width);
  float hourAngle=hourMap+swing_angle;
  translate(width/2,height/2);
  rotate(radians(hourAngle));
  noStroke();
  fill(255-255/24*hour(), 0, 0);
  ellipse(0, 0, 40, 40);
  printMatrix();

}
