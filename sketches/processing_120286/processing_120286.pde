
void setup()
{
  size(500, 500);
  frameRate(10);
}
void draw()
{
  background(random(255),random(255),random(255));
  translate(width/2, height/2);
 
  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0, 60, 0, 360);
  float h = map(hour(), 0, 12, 0, 360);

  rotate(radians(-90));

  pushMatrix();
  fill(255);
  strokeWeight(1);
  ellipse(0, 0, 400, 400); 
  popMatrix();

  pushMatrix();
  rotate(radians(sec)); 
  strokeWeight(1);
  line(0, 0, 120, 5);
  popMatrix();

  pushMatrix();
  rotate(radians(min));  
  strokeWeight(4);  
  line(0, 0, 160, 5);
  popMatrix();

  pushMatrix();
  rotate(radians(h)); 
  strokeWeight(4);   
  line(0, 0, 80, 5);
  popMatrix();
  
  for (int i=0; i<360; i+=360/12)
  { 
    pushMatrix();
    rotate(radians(i)); 
    translate(0, 180);
    strokeWeight(1);
    ellipse(0, 0, 15, 15);
    popMatrix();
  }
}

