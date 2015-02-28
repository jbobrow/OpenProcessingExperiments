

//creating variable for a
int a = 0;

void setup()

{
  size(600, 600);
  stroke(255);
  frameRate(15);
  smooth();
}

void draw()
{
  background(15);
  
  //create stroke color here
  color c1= color(255,0,0);
  stroke(c1);
  strokeWeight(mouseY);  
  //create movement. when sketch starts the line moves +one pixel.
  //When it reaches maximum starts over
  a = a + 1;
  line(0, a, height, a);
  if (a > width) {
    a = 0;
  }
}
