
float msc=0;
void setup() {
  size(300, 300);
  smooth();
  
}

void draw() {
  background(190);
  translate(width / 2, height / 2);
  
  // clock circle
  strokeWeight(8);
  fill (190);
  stroke(0);
  ellipse(0, 0, 200, 200);
  
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  int s = second();
 
  
  //seconds
  
  
  stroke(190);
  strokeWeight(8);
  float sy=map(millis(),0,1000,0,10);
  
  
  float radSec = (360 / 60000 *second())+0.6*sy;
  
  pushMatrix();
  rotate(radians(radSec));
  line(0, 0, 0, -120);
  popMatrix();
 
 
  
  // minutes
  
  stroke(190);
  strokeWeight(8);
  float radMin = 360 / 60 * minute();
  pushMatrix();
  rotate(radians(radMin));
  line(0, 0, 0, -120);
  popMatrix();
  
  // hours
  strokeWeight(24);
  float radHour = 360 / 12 * hour();
  pushMatrix();
  rotate(radians(radHour));
  line(0, 0, 0, -120);
  popMatrix();
  

  
  
}



