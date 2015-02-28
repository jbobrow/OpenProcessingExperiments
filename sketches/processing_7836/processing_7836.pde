
/* Biological Clock
by Nicki France
CMSC 117
02/23/10
Press mouse for a message from your DNA*/

PFont font1; 
PFont font2;
float xlocation;

void setup()
{
  size (500, 300);
  background (33, 25, 58); 
  font1 = loadFont ("Ayuthaya-48.vlw");
  font2 = loadFont ("BankGothic-Light-48.vlw");
  smooth();


}

void draw()
{

  background (33, 25, 58); 
  loadImage ("DNAA.jpg");  //DNA strand image
  PImage img = loadImage ("DNAA.jpg");
  image (img, 200, 0);


  textFont (font1);           //clock
  textSize(15);


  for (int i = 338; i > 0; i = i-52)
  { 
    text  (int (map (i, 343, 43, second(), second() + 6)) %60, i, 223);
  }
  for (int n = 327; n > 0; n = n-52)
  {
    text (int (map (n, 327, 27, minute(), minute() + 6)) %60, n, 174);
  }
  for (int h = 334; h > 0; h = h-52)
  { 
    text (int (map (h, 334, 34, hour(), hour() + 6)) %24, h, 121);
  }

  float x;
  float y;

  if (mousePressed)   //"TICK TOCK"
  {
    frameRate (1);
    x = random (0, 500);
    y = random (0, 375);
    textSize (30);
    text ("TICK TOCK", x, y);
    textFont (font2);
    textSize (50);
    x = random (0, 300);
    y = random (0, 375);
    text ("TICK TOCK", x, y);
    textSize (70);
    x = random (0, 40);
    y = random (0, 375);
    text ("TICK TOCK", x, y);
    textSize (10);
    x = random (60, 400);
    y = random (0, 375);
    text ("TICK TOCK", x, y);
  }

}


