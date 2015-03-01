
void setup()
{
  size(470,470);
  background(0);
  noStroke();
}

void draw()
{
  fill(255);
  pushMatrix();
  background(0);
  float my_angle = map(mouseX,0,width,0,2*PI);
  translate(70,70);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(180,70);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(290,70);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(400,70);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(70,180);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(180,180);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(290,180);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(400,180);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(70,290);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(180,290);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(290,290);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(400,290);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(70,400);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(180,400);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(290,400);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();
  
  pushMatrix();
  translate(400,400);
  rotate(my_angle);
  rectMode(CENTER);
  rect(0,0,80,80);
  popMatrix();

  pushMatrix();
  //float my_angle = map(mouseX,0,width,-0,2*PI);
  fill(0);
  translate(70,70);
  rotate(-my_angle);
  rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  translate(180,70);
  rotate(-my_angle);
  rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  translate(290,70);
  rotate(-my_angle);
  rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  translate(400,70);
  rotate(-my_angle);
  rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
 
 pushMatrix();
 translate(70,180);
 rotate(-my_angle);
 rectMode(CENTER);
 rect(0,0,40,40);
 popMatrix();
 
 pushMatrix();
 translate(180,180);
 rotate(-my_angle);
 rectMode(CENTER);
 rect(0,0,40,40);
 popMatrix();
 
 pushMatrix();
 translate(290,180);
 rotate(-my_angle);
 rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  translate(400,180);
  rotate(-my_angle);
  rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  translate(70,290);
  rotate(-my_angle);
  rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  translate(180,290);
  rotate(-my_angle);
  rectMode(CENTER);
 rect(0,0,40,40);
 popMatrix();
 
 pushMatrix();
 translate(290,290);
 rotate(-my_angle);
 rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  translate(400,290);
  rotate(-my_angle);
  rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  translate(70,400);
  rotate(-my_angle);
  rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  translate(180,400);
  rotate(-my_angle);
  rectMode(CENTER);
 rect(0,0,40,40);
 popMatrix();
 
 pushMatrix();
 translate(290,400);
 rotate(-my_angle);
 rectMode(CENTER);
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  translate(400,400);
  rotate(-my_angle);
  rectMode(CENTER);
  rect(0,0,40,40);
popMatrix();
}
