
void setup()
{
  size(500, 500);
}

void draw()
{
  background(100);
  translate(width/2, height/2);
  noStroke();
  fill(0);
   ellipse(0, 0, 430, 430);
   fill(100);
   
  fill(173, 158, 19);
  ellipse(0, 0, 400, 400);
  fill(0);
  ellipse(0, 0, 7, 7);
  
  stroke(0);
  
pushMatrix();
  float sec = map(second(),0, 60, 0, 360);
  println(sec);
  rotate(radians(sec));
  rect(0,-140, 1, 140);
  popMatrix();
  
  pushMatrix();
  float min = map(minute(),0, 60, 0, 360);
  rotate(radians(min));
  rect(0, -180, 2, 180);
  popMatrix();
  
    pushMatrix();
  float h = map(hour(),0, 12, 0, 360);
  rotate(radians(h));
  rect(0, -90, 2, 90);
  popMatrix();
  
  
   for (int x=0; x<360; x+=30)
   {
  pushMatrix();
  rotate(radians(x));
  translate(0, -230);
  fill(250);
  noStroke();
  ellipse(0, 21, 5, 5);
  popMatrix();
    }
   
}
