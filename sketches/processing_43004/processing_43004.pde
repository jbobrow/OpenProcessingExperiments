

int x;

void setup()
{
  size(300, 300);
  smooth();
  x = 0;
}

void draw()
{ 
  background(0);
  drawBar();
  drawBar2();
  reset1();
}

void drawBar()
{ 
  stroke(255);
  noFill();
  rect(50, height/2, 200, 20);
}

void drawBar2()
{ 
  x = x+1;
  fill(255);
  rect(50, height/2, x, 20);
}

void reset1()
{
  if (x >= 200)
  { 
    background(0);
    frameRate(0);
    text("DONE! CLICK TO RESET", 75, height/2);
  }

}

