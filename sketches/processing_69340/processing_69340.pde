
// Homework #3
// Hyunjoo Kim, hyunjook
// Copyright 2012 Hyunjoo Kim

float x, y, dia; // variables

void setup() 
{
    size(400,400); // window size
    background(66,69,80);
    smooth();
}

void draw() 
{
    x = random(width);
    y = random(height);
    dia = random(25);
    
  // ellipse
  noStroke();
  fill(random(mouseX,255),random(mouseY,255),random(pmouseX,255), random(pmouseY,25));
  ellipse(mouseX,mouseY,dia,dia);

  if (mousePressed) {
  ellipse (mouseX, mouseY, random(100), random(100));
  }
  
//saveFrame ("hw3.jpg");

}



