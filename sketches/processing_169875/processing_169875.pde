
void setup()
{
 size(500,500);
}

void draw()
{
  background(0);
    rectMode(CENTER);
      translate(width/2,height/2);
    
  float min_angle = map(minute(),0,59,0,2*PI);
  pushMatrix();
 fill(173,171,171);
  rotate(min_angle);
  rect(100,70,70,70);
  popMatrix();

  
  float sec_angle = map(second(),0, 59, 0, 2*PI);
  pushMatrix();
  noFill();
  strokeWeight(5);
  stroke(255,183,0);
  rotate(sec_angle);
  rect(100,70,50,50);
  popMatrix();
  
  float millis_angle = map(millis(),0,1000,0,2*PI);
  pushMatrix();
  fill(10,158,201);
  noStroke();
  rotate(millis_angle);
  rect(100,70,40,40);
  popMatrix();
}
