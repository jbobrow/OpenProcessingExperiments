
float angleHour,angleMinute,angleSecond;
void setup() {
  size(400,400);
  noStroke();
}

void draw() {
  angleHour = TWO_PI*hour()/12-HALF_PI;
  angleMinute = TWO_PI*minute()/60-HALF_PI;
  angleSecond = TWO_PI*second()/60-HALF_PI;
  
  background(0);
  fill(255);
  ellipse(width/2,height/2,360,360);
  
  translate(width/2,height/2);
fill(180);  
  pushMatrix();
  rotate(angleHour);
  rect(100,-6,80,12);
  popMatrix();
  
  pushMatrix();
  rotate(angleMinute);
  rect(60,-3,120,6);
  popMatrix();
  
  pushMatrix();
  fill(255,200,0);
  rotate(angleSecond);
  translate(165,0);
  ellipse(0,0,10,10);
  popMatrix();
  
}
