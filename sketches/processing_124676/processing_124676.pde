
//Catherine Hong
//E101 /w Mary Sokolowski
//inspired by Girl With the Dragon Tattoo
// "behind the wall"
matrix a, b, c, d, e;
PImage pri;
void setup()
{
  size(800, 800);
  smooth();
  pri=loadImage("private.png");
//  imageMode(CENTER);
}

void draw()
{

  image(pri, 0, 0);
  tint(255, 255, 255, 5);
  fill(255, 10);
  rect(0, 0, displayWidth, displayHeight);


  a = new matrix();
  a.x = frameCount*5%(displayWidth*.25);
  a.y = random(0, displayWidth);
  a.o = random(50, 100);
  a.r = 255;
  a.g = 0;
  a.b = 0;
  b = new matrix();
  b.x = frameCount*5%(displayWidth*.25)+5;
  b.y = random(0, displayWidth);
  b.o = random(50, 100);
  b.r = 250;
  b.g = 0;
  b.b = 0;

  c = new matrix();
  c.x = frameCount*5%(displayWidth*.25)+10;
  c.y = random(0, displayWidth);
  c.o = random(50, 100);
  c.r = 255;
  c.g = 0;
  c.b = 0;

  d = new matrix();
  d.x = frameCount*5%(displayWidth*.25)+15;
  d.y = random(0, displayWidth);
  d.o = random(50, 100);
  d.r = 250;
  d.g = 0;
  d.b = 0;


  a.show();
  a.show();
  a.show();
  c.show();
  d.show();
  b.show();
  b.show();  
  a.show();
  a.show();
  a.show();
  c.show();
  d.show();
  b.show();
  b.show();
}

class matrix
{
  float x, y, r, g, b, o, text1;

  void show()
  {
    fill(r, g, b, 90);
    text("1", x, y);
    text("0", x+150, y);
    text("0", x-150, y);
    text("1", x+175, y);
    text("1", x+225, y);
    text("0", x+275, y);
    text("1", x+325, y);
    text("1", x+375, y);
    text("1", x+415, y);
    text("0", x+75, y);
    text("1", x-75, y);
    text("0", x-180, y);
    text("1", x-250, y);
    text("0", x-300, y);
    text("0", x-350, y);
    text("1", x-420, y);
    text("0", x+random(0, displayWidth), y);
    text("0", x-random(0, displayWidth), y);
    text("0", x+500, y);
    text("0", x-500, y);
    text("0", x+525, y);
    text("0", x-525, y);
//    for (int i=0;i<=displayWidth;i=i+25) {
      text("0", x+(500), y);
      text("1", x-(500), y);
      text("1", x+(520), y);
      text("1", x-(520), y);
      
//    }
  }
}



