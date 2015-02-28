
PImage Muttmatt;
float M = 0;
void setup()
{
  size(100, 100);
  frameRate(80);

  Muttmatt = loadImage("MM.PNG");
}

void draw()
{
  background(0);
  M = M+.07;
  translate(50, 50);
  smooth();
  rotate(M);
  image(Muttmatt, -55, -55);
  
  //OPTIONS
  if((keyPressed = true) && (key == '='))
  {
    M = M +.1;
  }
  
  if((keyPressed = true) && (key == '-'))
  {
    M = M -.01;
  }
}


