
PImage sh1;
PImage sh2;
PImage sh3;
PImage sh4;
PImage sh5;
PImage sh6;
PImage sh7;
PImage sh8;


void setup()
{
  size(640,480);
  smooth();
  sh1 = loadImage("1.gif");
  sh2 = loadImage("2.gif");
  sh3 = loadImage("3.gif");
  sh4 = loadImage("4.gif");
  sh5 = loadImage("5.gif");
  sh6 = loadImage("6.gif");
  sh7 = loadImage("7.gif");
  sh8 = loadImage("8.gif");
  
}

void draw()
{
  background(255);
  
  //1st
  if((mouseX > 0) && (mouseX < 80))
  {
    image(sh1, 0,0);
  }
  //2nd
  if((mouseX > 81) && (mouseX < 160))
  {
    image(sh2, 0,0);
  }
  //3rd
  else if((mouseX > 161) && (mouseX < 240))
  {
    image(sh3, 0,0);
  }
  //4th
  else if((mouseX > 241) && (mouseX < 320))
  {
    image(sh4, 0,0);
  }
  //5th
  else if((mouseX > 321) && (mouseX < 400))
  {
    image(sh5, 0,0);
  }
  //6th
  else if((mouseX > 401) && (mouseX < 480))
  {
    image(sh6, 0,0);
  }
  //7th
  else if((mouseX > 481) && (mouseX < 560))
  {
    image(sh7, 0,0);
  }
  //8th
  else if((mouseX > 561) && (mouseX < 640))
  {
    image(sh8, 0,0);
  }
  
}



