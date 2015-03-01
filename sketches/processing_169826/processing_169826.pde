
  void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{  

  pushMatrix();
  fill(75);
  stroke(255);
  strokeWeight(2);
  float sec_angle = map(second(), 0, 59, 0, 2*PI);
  translate(width/2, height/2);
  rotate(sec_angle);
  rect(0, 0, 100, 100);
  popMatrix();
  
  pushMatrix();
  fill(75);
  stroke(255);
  strokeWeight(2);
  float minute_angle = map(minute(), 0, 59, 0, 2*PI);
  translate(width/2, height/2);
  rotate(minute_angle);
  rect(0, 0, 75, 75);
  popMatrix();
  
  pushMatrix();
  fill(75);
  stroke(255);
  strokeWeight(2);
  float hour_angle = map(hour(), 0, 23, 0, 2*PI);
  translate(width/2, height/2);
  rotate(hour_angle);
  rect(0, 0, 50, 50);
  popMatrix();
  
  
  
}
  
  
