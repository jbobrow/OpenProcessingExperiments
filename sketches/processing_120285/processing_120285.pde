
void setup()
{
  size(500, 500);
  smooth();
}
void draw()
{
  background(255);
  translate(width/2, height/2);

  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0, 60, 0, 360);
  float h = map(hour(), 0, 12, 0, 360);

  rotate(radians(-90));

  stroke(0);
  pushMatrix();
  strokeWeight(20);
  stroke(#6AAEFF);
  ellipse(0, 0, 400, 400); 
  popMatrix();

  stroke(255);

  pushMatrix();
  rotate(radians(sec)); 
  strokeWeight(5);
  line(0, 0, 220, 5);
  popMatrix();



  pushMatrix();
  rotate(radians(min));  
  strokeWeight(10);  
  line(0, 0, 220, 5);
  popMatrix();

  pushMatrix();
  rotate(radians(h)); 
  strokeWeight(20);   
  line(0, 0, 220, 5);
  popMatrix();
}

