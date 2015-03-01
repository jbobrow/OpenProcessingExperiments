
void setup()
{
size(500,500);
background(190);
smooth();
}

void draw()
{
  background(84,194,164);
 
  
  pushMatrix();
  translate(width/2,height/2);
  noFill();
  stroke(255);
  ellipseMode(CENTER);
  fill(255);
  ellipse (0,0,500,500);
  fill(84,194,164);
  ellipse(0,0,400,400);
  
  popMatrix();
  
   pushMatrix();
  
  float sec_angle = map(second(),0,59,0,2*PI);
  translate(width/2,height/2);
  rotate(sec_angle);
  stroke(205,209,83);
  line(0,0,0,-200);
  
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  float min_angle = map(minute(),0,59,0,2*PI);
  rotate(min_angle);
  stroke(0);
  line(0,0,0,-200);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  float hour_angle = map(hour(),0,12,0,2*PI);
  rotate(hour_angle);
  stroke(0);
  line(0,0,0,-150);
  popMatrix();
}
