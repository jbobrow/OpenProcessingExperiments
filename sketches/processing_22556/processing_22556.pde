
// borrowed and changed code from background image tutorial in processing.org and "for" tutorial
//Robert Cortlandt
//Week 3 Homework 

PImage parksign;
int a;
void setup() 
{
  size(84,125);
  frameRate(50);
  parksign = loadImage("parksign.gif");
}

void draw() 
{
  background(parksign);

  a = (a + 1)%(width+32);
  stroke(255, 24, 0);
  line(0, a, width, a-26);
  line(0, a-6, width, a-32);
   line(0, a, width, a-45);
  line(0, a-6, width, a-42);
   line(0, a, width, a-56);
  line(0, a-6, width, a-53);
 
  for (int i = 10; i < 80; i = i+5) {
  for (int j = 0; j < 200; j = j+5) {
    point(i, j);
  }
}
  }

  



