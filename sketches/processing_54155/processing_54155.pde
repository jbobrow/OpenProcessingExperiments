
//Homework 8
//copyright 2012 Alex Fischer ajfische
//Use the UP and DOWN arrows to change the speed of color change
//CLICK the mouse to change the background color;
color bg, purp, gre, blu, darkgre;
int count = 0;
int offsetCount = 0;
int speed = 10;
color [] colors;
int c;

void setup()
{
  size(400,400);
  bg = color(239, 230, 114);
  purp = color(76, 27, 51);
  gre = color(152, 169, 66);
  blu = color(45, 105, 96);
  darkgre = color(20, 29, 20);
  colors = new color [4];
  colors [0] = bg;
  colors [1] = purp;
  colors [2] = gre;
  colors [3] = blu;
//  colors [4] = darkgre;
}

void draw()
{
  setBGcolor();
  stuff();
}

void mouseClicked()
{
  c++;
  if (c >= 4) c = 0;
}

void setBGcolor()
{
    background(colors[c]);
}

void keyPressed()
{
  if (keyCode == DOWN)
  {
    speed++;
  }
  if (keyCode == UP)
  {
    speed--;
    if (speed < 1) speed = 1;
    
  }
}

void stuff()
{
  float x, y;
  x=6;
  y=6;

  while(x < width){
     while(y < height){
       fill(colors[count%colors.length]);
      rect(x, y, width/15, height/25);
      y+= height/10;
      count++;
    }
    x+= width/10;
    y= 6;
  }
  offsetCount++;
  if (offsetCount % speed == 0) count--;
}



