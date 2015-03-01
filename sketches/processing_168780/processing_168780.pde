
void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
  background(255);
  
  pushMatrix();
  fill(0);
  translate(250,250);
  rotate(radians(millis())*0.1);
  rect(0,0,250,250);
  popMatrix();
  
  pushMatrix();
  fill(255);
  noStroke();
  translate(250,250);
  rotate(radians(90));
  rotate(radians(millis())*-0.1);
  rect(0,0,250,250);
  popMatrix();
  
  pushMatrix();
  fill(0);
  translate(250,250);
  rotate(radians(180));
  rotate(radians(millis())*0.1);
  rect(0,0,250,250);
  popMatrix();
  
  pushMatrix();
  fill(255);
  noStroke();
  translate(250,250);
  rotate(radians(270));
  rotate(radians(millis())*-0.1);
  rect(0,0,250,250);
  popMatrix();
  
  pushMatrix();
  fill(0);
  translate(250,250);
  rotate(radians(millis())*0.1);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  fill(255);
  noStroke();
  translate(250,250);
  rotate(radians(90));
  rotate(radians(millis())*-0.1);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  fill(0);
  translate(250,250);
  rotate(radians(180));
  rotate(radians(millis())*0.1);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  fill(255);
  noStroke();
  translate(250,250);
  rotate(radians(270));
  rotate(radians(millis())*-0.1);
  rect(0,0,100,100);
  popMatrix();
  
  pushMatrix();
  fill(0);
  translate(250,250);
  rotate(radians(millis())*0.1);
  rect(0,0,150,150);
  popMatrix();
  
  pushMatrix();
  fill(255);
  noStroke();
  translate(250,250);
  rotate(radians(90));
  rotate(radians(millis())*-0.1);
  rect(0,0,150,150);
  popMatrix();
  
  pushMatrix();
  fill(0);
  translate(250,250);
  rotate(radians(180));
  rotate(radians(millis())*0.1);
  rect(0,0,150,150);
  popMatrix();
  
  pushMatrix();
  fill(255);
  noStroke();
  translate(250,250);
  rotate(radians(270));
  rotate(radians(millis())*-0.1);
  rect(0,0,150,150);
  popMatrix();
}

