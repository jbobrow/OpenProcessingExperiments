
void setup()
{
  smooth();
  int mysize = 90;
  size(500, 500);
  background(140);
  fill(255, 215, 0);
  strokeWeight(10);
  ellipse(250,250,400,400);
  fill(1);
  ellipse(175,175,mysize,mysize);
  ellipse(330,175,mysize,mysize);
  
  noFill();
  bezier(100, 350,  100, 370,  400, 370,  400, 350);
}

void draw()
{
   //DO NOT PUT ANYTHING IN HERE YET
}

