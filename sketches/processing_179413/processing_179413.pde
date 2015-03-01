
int value=-25;
float x;
int running=1;


void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  rectMode(CENTER);
  fill(255, mouseY, mouseX);
  rect(x, mouseY, 25, 25);
  x+=3;
  if (x > width+25) {
    x=-25;
  }
}

void mousePressed() 
{
  if (running == 1) {
    stopLooping();
  } else {
    startLooping();
  }
}

void stopLooping()
{
  noLoop();
  running=0;
  println("stop at "+mouseX+","+mouseY);
}

void startLooping()
{
  loop();
  running=1;
}



