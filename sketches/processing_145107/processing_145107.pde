
//copyright Irene Joung 2014
//Homework #10

PImage pic;

String [] dataStrings1, dataStrings2, dataStrings3, dataStrings4, dataStrings5;

float x,y;
float dx,dy;

void setup()
{ 
  size(600,400,P3D);
  pic = loadImage("the-little-prince.jpg");
  textSize(18);
  textAlign(LEFT);
  
  dataStrings1 = loadStrings("text1.txt");
  dataStrings2 = loadStrings("text2.txt");
  dataStrings3 = loadStrings("text3.txt");
  dataStrings4 = loadStrings("text4.txt");
  dataStrings5 = loadStrings("text5.txt");
  
  x=20;
  y=120;
  dx=1;
  dy=1;
}

void draw()
{
  image(pic, 0, 0);
  printQuotes();
  moveQuotes();
}

void printQuotes()
{
  for(int i = 0; i < dataStrings1.length; i++)
  {
    fill(0);
    text(dataStrings1 [i], x, y-120);
  }
  
  for(int i = 0; i < dataStrings2.length; i++)
  {
    fill(0);
    text(dataStrings2 [i], x, y-90);
  }
  
  for(int i = 0; i < dataStrings3.length; i++)
  {
    fill(0);
    text(dataStrings3 [i], x, y-60);
  }
  
  for(int i = 0; i < dataStrings4.length; i++)
  {
    fill(0);
    text(dataStrings4 [i], x, y-30);
  }
  
  for(int i = 0; i < dataStrings5.length; i++)
  {
    fill(0);
    text(dataStrings5 [i], x, y);
  }
}

void moveQuotes()
{
  y += dy;
  if(y > height)
  {
    dy -= 1;
  }
  else if(y < 120)
  {
    dy += 1;
  }
}
  
void keyPressed()
{
  exit();
}


