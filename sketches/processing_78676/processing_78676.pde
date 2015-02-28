
int youX;
int youY;
int partX=300;
int partY=300;

void setup()
{
  size(600, 600);
  noStroke();
}

void draw()
{
  background(0);
  //player rect
  fill(255, 0, 0);
  rect(youX, youY, 30, 30);
  //your crush's shyness
  fill(255, 0, 0);
  if (abs(partY-youY)<100)
  {
    fill(255, 0, 0, abs(partX-youX));
  }
  if (abs(partX-youX)<100)
  {
    fill(255, 0, 0, abs(partY-youY));
  }
  //your crush
  rect(partX, partY, 30, 30);

  //player control
  if (key=='s')
  {
    youY+=6;
  }
  if (key=='w')
  {
    youY-=6;
  }
  if (key=='a')
  {
    youX-=6;
  }
  if (key=='d')
  {
    youX+=6;
  }
  print(key);
}

void keyReleased()
{
  //resets keys so that it stops when key is released
  key=' ';
}
