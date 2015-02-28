
int xpos;
int ypos;


void setup()
{
  size(600,600);
  background(255);
}

void draw()
{
  xpos = width/2;
  ypos = height/2;
  drawChair(xpos-200, ypos-200, 28, 250, 248, 20);
  drawChair(xpos, ypos-200, 100, 15, 0, 30);
  drawChair(xpos+200, ypos-200, 200, 200, 0, 40);
  
  drawChair(xpos-200, ypos-40, 250, 25, 200, 50);
  drawChair(xpos, ypos-40, 20, 120, 80, 60);
  drawChair(xpos+200, ypos-40, 200, 20, 32, 70);
  
  drawChair(xpos-200, ypos+150, 120, 30, 76, 80);
  drawChair(xpos, ypos+150, 20, 80, 120, 90);
  drawChair(xpos+200, ypos+150, 200, 70, 0, 100);

}

void mousePressed()
{
  drawChair(mouseX, mouseY, 0, 0, 0, 40);
}

void drawChair(int xpos, int ypos, int r, int g, int b, int yoff)
{
  stroke(r, g, b);
  // chair top
  line(xpos-20, ypos-30, xpos+20, ypos-30);
  line(xpos-20, ypos-30, xpos-20, ypos);
  line(xpos+20, ypos-30, xpos+20, ypos);
  // chair seat
  line(xpos-20, ypos, xpos+20, ypos);
  line(xpos-20, ypos, xpos-30, ypos+20);
  line(xpos+30, ypos+20, xpos-30, ypos+20);
  line(xpos+20, ypos, xpos+30, ypos+20);
  // chair leg
  line(xpos-30, ypos+20, xpos-30, ypos+yoff+10);
  line(xpos+30, ypos+20, xpos+30, ypos+yoff+10);
  line(xpos-20, ypos+20, xpos-20, ypos+yoff);
  line(xpos+20, ypos+20, xpos+20, ypos+yoff);
}

