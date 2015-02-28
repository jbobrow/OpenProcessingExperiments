
// © Julia Shen
// yuans @ andrew.cmu.edu

float y, z, deltaX, deltaY;
int phase;

void setup()
{
  size(400, 400);
  background(255, 186, 186);
  y = 0;
  z = 10;
  deltaX = 10;
  deltaY = 10;
  
  
}

void draw()
{
  if (phase == 1) {
    drawFor();
  } else if (phase == 0) {
    drawWhile();
    y = y + deltaY;
  }
  
}


void drawWhile()
{
  int x = 10;
  
  while (x < width)
  {
    noFill();
    stroke(255);
    ellipse(x, y, z, z);
    x = x + 10;
   
  }
}


void drawFor()
{
  
  for (int x = 10; x<width; x = x + 10){
    for(int h = 0; h<height; h = h + 1){
    fill(255);
    stroke(255);
    rect(x, h, 1, 1);
  }
  }
}

void keyPressed()
{ if (key == ' ') {
  phase = 1;
  background(255, 186, 186);
}
  else if (phase == 1) {
    phase = 0;
  }
}



