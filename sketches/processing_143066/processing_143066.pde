
float angle;
 
void setup()
{
  size(640,360);
  background(0);
}
 
void draw()
{
  noStroke();
  fill(255,10);
  rectMode(LEFT);
  rect(0,0,width,height);
   
  // rotation angle
  angle += 0.01;
 
  strokeWeight(5);
    
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  stroke(0);
  line(-width,-height,width,height);
  popMatrix();
}

