
//homework 3, 51-257
//Suzanne Choi, suzanne1
//copy rights 2013 suzanne choi. all rights reserved.

//variables
float x, y, wd, ht, easingCoef;

void setup()
{
  size(400,400);
  smooth();
  background(0); 
 
}
  
void draw()
{
  easingCoef=0.1;
  x=width * .5;
  y=height * .5;
  wd= random(10,150);
  ht= random(10,150);
  noStroke();
  fill(255,random(255),random(255),20);
  rect(mouseX,mouseY,wd,ht);
  fill(255,95);
  ellipse(mouseX,mouseY,10,10);
  fill(250,199,217,90);

//if(keyPressed)saveFrame("hw3.jpg");
}





