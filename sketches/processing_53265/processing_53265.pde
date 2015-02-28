
//claire gustavson, homework 8, 2012 copywrite

void setup () {
  size (400, 400);
  background (255);
  rectMode (CENTER);
}

void draw () {
  fill (255, 30);
  noStroke();
  rect (width/2, height/2, width, height);
  fill (255, random (200), random (200), 30);
  box (mouseX, mouseY, key);
}

void box (int x, int z, int y) {
  whileDemo( );
  rect (x, z, y, y);
}

void whileDemo( )
{
  int x =mouseX;
  int y = 15;
  while (x < width/2 )
  {
    stroke(0);  
    fill (0);
    x = x + 30;
  }
}


