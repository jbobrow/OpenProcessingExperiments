
float angle;
 
void setup()
{
  size(640,360);
  background(#325A7D);
}
 
void draw()
{
  noStroke();
  fill(#325A7D,50);
  rect(0,0,width,height);
  
  // rotation angle
  angle += 0.01;
 
  strokeWeight(15);
 
  stroke(255);
   
  pushMatrix();
  translate(0,0);
  rotate(angle);
  line(0,0,width,height);
  popMatrix();
   
  pushMatrix();
  translate(width,0);
  rotate(angle);
  line(0,0,width,height);
  popMatrix();
   
  pushMatrix();
  translate(0,height);
  rotate(angle);
  line(0,0,width,height);
  popMatrix();
   
  pushMatrix();
  translate(width,height);
  rotate(angle);
  line(0,0,width,height);
  popMatrix();
}

