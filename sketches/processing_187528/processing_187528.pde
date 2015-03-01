
/* @pjs preload="a2.jpg"; */

PImage pim;
PVector[] p, speed;
int nb = 3, imageW, imageH;
float c1 = 4, c2 = 2;//noise coefficients, the higher the more strata// 40, 2

void setup() {
  size(266, 400);
  pim = loadImage("a2.jpg");
  imageW = pim.width;
  imageH = pim.height;
  p = new PVector[nb];
  speed = new PVector[nb];
  initNoise();
}

void initNoise()
{
  for (int i = 0; i < nb; i ++)
  {
    p[i] = new PVector(random(123), random(123)); 
    speed[i] = new PVector(random(-.02*(i+1), .02*(i+1)), random(-.02*(i+1), .02*(i+1)));//0, 0);//
  }
}

void draw() {
  //alter the noise coeeficients
  //c1 += .1 * sin(float(frameCount)/37) * cos(float(frameCount)/122);
  //c2 += .1 * sin(float(frameCount)/51) * cos(float(frameCount)/96);//map(mouseX, 0, width, -100, 100);//40 // map(px, 0, width, -100, 100)

  pim.loadPixels();
  loadPixels();
  for (float x = 0; x < width; x++) {
    for (float y = 50; y < height; y++) {
      pixels[int(x)+int(y)*width] = pattern(x, y);
    }
  }
  updatePixels();
  pim.updatePixels();

  for (int i = 0; i < nb; i ++)
  {
    p[i].add(speed[i]);
  }
}

int pattern(float px, float py)
{
  float qx, qy, rx, ry, w, r, g, b;
  int myColor = 0;
  int x = int(px), y = int(py);

  px /= 100;
  py /= 100;

  qx = noise(px + p[0].x, py + p[0].y);//regular noise
  qy = noise(px + p[0].x + .52, py + p[0].y + .13);
  rx = noise(px + p[1].x + c1*qx + .17, py + p[1].y + c1*qy + .92);
  ry = noise(px + p[1].x + c1*qx + .83, py + p[1].y + c1*qy + .28);
  w = noise(px + p[2].x + c2*rx, py + p[2].y + c2*ry);

  x = constrain(int(x + map(mouseX, 0, width, 0, 50) * ((new PVector(rx, ry)).mag()-1)), 0, imageW-1);
  y = constrain(int(y + map(mouseY, 0, height, 0, 50) * ((new PVector(qx, qy)).mag()-1)), 0, imageH-1);
  myColor = pim.pixels[x + y * imageW];
  return myColor;
}

void mousePressed()
{
  initNoise();
}



