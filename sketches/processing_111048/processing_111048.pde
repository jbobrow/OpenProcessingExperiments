
PImage matrix;
PImage matrixA;
PImage matrixB;

void setup()
{
  size(960, 540);
  matrix = requestImage("amatrix11.jpg");
  matrixA = requestImage("TheMatrixWallpaper800.jpg");
  matrixB = requestImage("matrix07.jpg");
  frameRate(15);
}

void draw()
{
  if (matrix.width > 0 && matrixA.width > 0 && matrixB.width > 0)
  {
    image(matrix, 0, 0, matrix.width * 0.5, matrix.height * 0.5);
    image(matrixA, 0, 0, 400, 200);
    image(matrixB, 560, 340, 400, 200);
  }
  filter(OPAQUE);
  stroke(50, 100);
  float q = 0;
  float p = 0;
  float prevQ = q;
  while(q <= 960)
  {
    q += random(20);
    line(q, p, prevQ, p);
    line(q, p + 50, prevQ, p +50);
    line(q, p + 100, prevQ, p +100);
    line(q, p + 150, prevQ, p +150);
    line(q, p + 200, prevQ, p +200);
    line(q, p + 250, prevQ, p +250);
    line(q, p + 300, prevQ, p +300);
    line(q, p + 350, prevQ, p +350);
    line(q, p + 400, prevQ, p +400);
    line(q, p + 450, prevQ, p +450);
  }
  float i = 50;
  float l = 0;
  float prevL = l;
  while(l <= 540)
  {
    l += random(20);
    line(i + 50, l, i +50, prevL);
    line(i + 100, l, i +100, prevL);
    line(i + 150, l, i +150, prevL);
    line(i + 200, l, i +200, prevL);
    line(i + 250, l, i +250, prevL);
    line(i + 300, l, i +300, prevL);
    line(i + 350, l, i +350, prevL);
    line(i + 400, l, i +400, prevL);
    line(i + 450, l, i +450, prevL);
    line(i + 500, l, i +500, prevL);
    line(i + 550, l, i +550, prevL);
    line(i + 600, l, i +600, prevL);
    line(i + 650, l, i +650, prevL);
    line(i + 700, l, i +700, prevL);
    line(i + 750, l, i +750, prevL);
    line(i + 800, l, i +800, prevL);
    line(i + 850, l, i +850, prevL);
  } 
  float x = 0;
  float y = 0;
  float prevX = x;
  float prevY = y;
  strokeWeight(2);
  stroke(#055A09,150);
  while (x < 960)
  {
    x += random(-1, 30);
    y += random(-10, 30);
    line(prevX, prevY, x, y);
    prevX = x;
    prevY = y;
  }
  float a = 960;
  float b = 0;
  float prevA = a;
  float prevB = b;
  while ( a > -20)
  {
    a += random(-30, 10);
    b += random(5, -10);
    line(prevA, prevB, a, b);
    prevA = a;
    prevB = b;
  }
}


