
float rad = 0.0;
float s = 1;
float timer = 0.0;


void setup()
{
  size(1080,720);
background(HSB, 100);


}

void draw()
{
  rad = rad + 1;
  s = s + .00000000001;
  fill(random(255), random(255), random(255), random(255));
  
  pushMatrix();
  
 stroke(3);
  translate(width/2, 100);
  rotate(rad);
  scale(s);
  if(timer >= 0.0 && timer < 5.0)
  {
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  rectMode(CORNER);
  rect(0, 0, 100, 100);
 
  popMatrix();
  
  pushMatrix();
  
  stroke(3);
  translate(270, 540);
  rotate(rad);
  scale(s);
  
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  rectMode(CORNER);
  rect(0, 0, 100, 100);
 
  popMatrix();
  
  pushMatrix();
  
  stroke(3);
  translate(810, 540);
  rotate(rad);
  scale(s);
  
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  rectMode(CORNER);
  rect(0, 0, 100, 100);
 
  popMatrix();
  
  pushMatrix();
  stroke(3);
  translate(0,720);
  rotate(rad);
  scale(s);
  fill(#AA182C);
  
  rect(0, 0, 100, 100);
  
  popMatrix();
  
   pushMatrix();
  stroke(3);
  translate(0,0);
  rotate(rad);
  scale(s);
  fill(#4342CB);
  
  rect(0, 0, 100, 100);
  
  popMatrix();
  
   pushMatrix();
  
  translate(1080,0);
  rotate(rad);
  scale(s);
  fill(#D31A1A);
  
  rect(0, 0, 100, 100);
  
  popMatrix();
  
   pushMatrix();
  
  translate(1080,720);
  rotate(rad);
  scale(s);
  fill(#0DFAA5);
  
  rect(0, 0, 100, 100);
  
  popMatrix();
  }
pushMatrix();
   fill(random(255),random(255),random(255),random(255));
    stroke(3);
    translate(width/2, height/2);
    rotate(rad);
    scale(s);
    triangle(25, 80, 63, 30, 91, 80);
 
    popMatrix();
    
    
    pushMatrix();
   fill(random(255),random(255),random(255),random(255));
    stroke(3);
    translate(270, 540);
    rotate(rad);
    scale(s);
    triangle(25, 80, 63, 30, 91, 80);
 
    popMatrix();
    
    
    pushMatrix();
   fill(random(255),random(255),random(255),random(255));
    stroke(3);
    translate(810, 540);
    rotate(rad);
    scale(s);
    triangle(25, 80, 63, 30, 91, 80);
 
    popMatrix();
  
}



