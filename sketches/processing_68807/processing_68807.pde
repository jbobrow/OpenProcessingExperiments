
//Copyright © 2012 Dakotah Konicek
//HW3

float x,y,wd,ht, yIncrement;

void setup()
{
  size(400,400);
  smooth();
  background(random(255),random(255),random(255));
  x=x+10;
  y= 50;
  wd=width;
  ht=height;
 
}

void draw()
{
   fill(random(255),random(255),random(255));
  triangle(frameCount%(.6*wd+pmouseX),pmouseY, pmouseX-frameCount%wd, pmouseY-frameCount%(.4*ht), pmouseY+.2*pmouseX%(.3*wd), pmouseX-.1*pmouseY%(.3*ht));

}

//saveFrame ("hw3.jpg");

