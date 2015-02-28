
/* @pjs font="FuturaStd-Light.otf"; */

PImage img;
PFont futura = createFont("FuturaStd-Light.otf",12);

final static int COLS = 30;
final static int SIZE = 15;
final static int RATE = 60;
final static int TIME = RATE * 10;
 
int ROWS;
byte[] message;
 
void setup()
{
   size(500,375);
 smooth();
 img = loadImage("1gather.jpg");
  frameRate(RATE);
  textFont(createFont("FuturaStd-Light.otf", SIZE));
  message = loadBytes("ingredients.txt");
  ROWS = message.length / COLS + 1;
}
 
void draw()
{
    image(img,0,0);
  translate(width / 2, height / 2);
  for(int i = 0; i < message.length; i++)
  {
   int x = (i % COLS - COLS / 2) * SIZE;
    int y = (i / COLS - ROWS / 2) * SIZE;
    pushMatrix();
    rotate((frameCount) * (noise(x * 0.1, y * 0.1) - 0.5) * 0.01);
    text(char(message[i]), x, y);
    popMatrix();
  }
}

//Original sketch by Gendou, openprocessing.org/sketch/2588

