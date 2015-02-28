
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
  fill(255, 0, 0);
  rect(youX, youY, 30, 30);
  fill(255, 255, 255);
  if (abs(partY-youY)<100)
  {
    fill(255, 0, 0);
  }
 
  rect(partX, partY, 30, 30);
 
  if (key=='s')
  {
    youY+=4;
  }
  if (key=='w')
  {
    youY-=4;
  }
  if (key=='a')
  {
    youX-=4;
  }
  if (key=='d')
  {
    youX+=4;
  }
  print(key);
}
 
void keyReleased()
{
  key=' ';
}
