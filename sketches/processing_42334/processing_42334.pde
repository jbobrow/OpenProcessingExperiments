
/*
 * LEFT CLICK FOR MINI SNOWMAN
 * RIGHT CLICK TO REMOVE MINI SNOWMAN
 * CLICK TO FREEZE
 *
 * BY RYAN ANCHETA
 */

Star[] b;

void setup()
{
  size(500, 500);
  smooth();
  stroke(240);
  fill(255, 230);

  b = new Star[2000];
  for (int i=0; i<2000; i++)
  {
    b[i] = new Star();
    b[i].x = random(-width, width*2);
    b[i].y = random(-height, height*2);
    b[i].d = (int)random(1, 10);
    b[i].v = (int)random(5, 50);
  }
}

void draw()
{
  background (0);

  for (int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
    b[i].bound();
  }
  if (mouseButton == LEFT)
  {
    ellipse (mouseX, mouseY, 10, 10);
    ellipse (mouseX, mouseY+10, 20,20);
  }
}

class Star
{
  float x, y;
  int d, v;

  void show()
  {
    ellipse(x, y, d, d);
  }

  void move()
  {
    y +=.11* v;
  }

  void bound() {
    if (x>width) {
      x = 0;
    }
    if (x<0) {
      x = width;
    }
    if (y>height) {
      y=0;
    }
    if (y<0) {
      y=height;
    }
  }
}
void mousePressed() {
  noLoop();
}
 
void mouseReleased() {
  loop();
}


