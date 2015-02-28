
PImage img;

void setup()
{
  img = loadImage("MonaLisa.jpg");
  size(img.width,img.height);
  strokeWeight(3);
}

void draw()
{
  for(int i=0; i<15; i++)
  {
    drawStroke();
  }
}

void drawStroke()
{
  float dx = random(-2,2);
  float dy = random(-2,2);
  float length = 5;
  int initialX = (int)random(width);
  int initialY = (int)random(height);
  color[] col = new color[8];
  col[0] = img.get(initialX-1,initialY-1);
  col[1] = img.get(initialX,initialY-1);
  col[2] = img.get(initialX+1,initialY-1);
  col[3] = img.get(initialX-1,initialY);
  col[4] = img.get(initialX+1,initialY);
  col[5] = img.get(initialX-1,initialY+1);
  col[6] = img.get(initialX,initialY+1);
  col[7] = img.get(initialX+1,initialY+1);
  int minChange = img.get(initialX,initialY)-col[0];
  int minPos = 0;
  for(int i=0; i<8; i++)
  {
    if(minChange>img.get(initialX,initialY)-col[i])
    minPos = i;
  }
  stroke(img.get(initialX,initialY));
  switch(minPos)
  {
  case 0: dx=-1; dy=-1; break;
  case 1: dx=0; dy=-1; break;
  case 2: dx=+1; dy=-1; break;
  case 3: dx=-1; dy=0; break;
  case 4: dx=+1; dy=0; break;
  case 5: dx=-1; dy=+1; break;
  case 6: dx=0; dy=+1; break;
  case 7: dx=+1; dy=+1; break;
  }
  line(initialX,initialY,initialX+length*dx,initialY+length*dy);
}


