
/*

Pinak Saha  (0408908)
Visual Foundation Studio 
Homework #2
09/11/2013

Task:

andomize values of 3 different properties at the same 
time. Possible properties (but not limited to) are: scale, 
size, position, color, etc.

*/


void setup()
{
  size(400,400);
  background(#ffffff);
}

void draw()
{
    //Generates a random color
    fill( random(255), random(255), random(255), random(255));
    
    //draws a rectangle based on your current cursor position
    rect(mouseX,mouseY,mouseX,mouseY);
}


