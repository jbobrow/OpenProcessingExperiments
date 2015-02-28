
// Homework #4
// Hyunjook, 51-257 A
// Copyright 2012 Hyunjoo Kim

void setup(){
size(400,400);
smooth();
stroke(227,94,214);
background(244,245,225);
}

void draw(){
strokeWeight(abs((pmouseX-mouseY)/10));
line(pmouseX,mouseY,mouseX,mouseY);
}

void keyPressed() // Change the color of the stroke
{
 stroke(random(255),random(255),random(255));
{
  if (key == ' ') // reset the background 
  background(244,245,225);
}
}

//saveFrame ("hw4.jpg");




