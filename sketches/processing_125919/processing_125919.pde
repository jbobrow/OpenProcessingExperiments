
PImage petal1;
PImage petal2;
boolean onOff;
PImage background;
PImage torii;
PImage cherry;
float y;
float x;


void setup()
{
  y = 150;
  x = -100;
  cherry = loadImage("cherry.png");
  torii = loadImage("torii.png");
  background = loadImage("backgr.png");
  petal1 = loadImage("petal1.png");
  petal2 = loadImage("petal2.png");
  size(600, 600);
  frameRate(1);
}

void draw()
{
    background(176, 238, 240);
    drawFuji();
    fill(247, 7, 7);
    ellipse(500, 100, 100, 100);
    image(background, 0, 0, 600, 600);
    image(torii, 350, 450, 100, 100);
    image(cherry, 0, 150, 500, 300);
    drawPetals();
}

void drawFuji()
{

fill(0, 119, 255);
noStroke();
triangle(200, 550, 700, 550, 450, 350);
fill(255);
noStroke();
triangle(350, 430, 550, 430, 450, 350);
}

void drawPetals()
{
  for(int i = 0; i <= 10; i++)
  {
    image(petal1, random(0, 400), random(20, 600), 7, 7);
    image(petal2, random(0, 400), random(200, 600), 8, 8);
  }
}



