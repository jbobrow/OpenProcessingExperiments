
// © Laura Tjho
// 60-257 Hw Assignment 6

int x= 0;
int y= 0;
int speed= 3;

float tx, ty, td, txSpeed;
float r, g, b;

void setup(){
  size(400, 400);
  smooth();
  background(54, 255, 220);
  
  tx=0;
  ty=random(height);
  td= 60;
  txSpeed= 2;
  
}

void draw(){
  prepWindow();
  drawBox(tx, ty, td);
  moveBox();
  drawImage();
  moveImage();
}

void prepWindow()
{
  noStroke();
  fill(255, 10);
  //ellipse(200, 200, width, height);
}


void moveBox()
{
  tx=tx+txSpeed;
  if (tx>width)
  {
    txSpeed=-txSpeed;
  }
  else if (tx<0)
  {
    txSpeed=-txSpeed;
  }
}

void drawBox( float tx, float ty, float td)
{
  fill(54, 59, 255, 10);
  rect(tx, ty, td*.5, td*.5);
}

void moveImage()
{
  x=x+speed;
  
  if (x>width)
  {
    speed= speed*-1;
  }
  else if (x<0)
  {
    speed=-speed;
  }
}

void drawImage()
{
  stroke(0);
  fill(255, 218, 5);
  ellipse(x, 300, 40, 40);
}


void keyPressed()
{
  td = random(255);
  tx= random(255);
  ty= random(255);
  
  if (key == ' ')
  {
    txSpeed = txSpeed*2;
  }

}

