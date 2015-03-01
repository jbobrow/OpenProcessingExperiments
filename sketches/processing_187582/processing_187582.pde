

PVector[] p, speed;
int nb = 3, mode = 2;
final colors c = new colors();
color col1 = c.BROWN;//BROWN  YELLOW
color col2 = c.RED;//RED  PINK
color col3 = c.BLACK;//BLACK RED
float c1 = 1, c2 = .5;//noise coefficients, the higher the more strata// 40, 2

void setup() {
  size(300, 260);
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

void initColors()
{
  int i = int(random(c.colors.length)), j = int(random(c.colors.length)), k = int(random(c.colors.length));
  col1 = c.colors[i];
  col2 = c.colors[j];
  col3 = c.colors[k];
  println("colors number: " + i + " -- " + j + " -- " + k);
}

void draw() {
  //alter the noise coeeficients
  c1 += .1 * sin(float(frameCount)/37) * cos(float(frameCount)/122);
  c2 += .1 * sin(float(frameCount)/51) * cos(float(frameCount)/96);//map(mouseX, 0, width, -100, 100);//40 // map(px, 0, width, -100, 100)

  loadPixels();
  for (float x = 0; x < width; x++) {
    for (float y = 0; y < height; y++) {
      pixels[int(x)+int(y)*width] = color(pattern(x, y));
    }
  }
  updatePixels();

  for (int i = 0; i < nb; i ++)
  {
    p[i].add(speed[i]);
  }

  //saveFrame();
}

int pattern(float px, float py)
{
  float qx, qy, rx, ry, w, r, g, b;
  int myColor = 0;

  px /= 100;
  py /= 100;

  qx = noise(px + p[0].x, py + p[0].y);//regular noise
  qy = noise(px + p[0].x + .52, py + p[0].y + .13);
  rx = noise(px + p[1].x + c1*qx + .17, py + p[1].y + c1*qy + .92);
  ry = noise(px + p[1].x + c1*qx + .83, py + p[1].y + c1*qy + .28);
  w = noise(px + p[2].x + c2*rx, py + p[2].y + c2*ry);

  /*//smoke effect
   qx = noise(px + p[0].x, py + p[0].y);//regular noise
   qy = noise(px + p[0].x + .52, py + p[0].y + .13);   
   rx = noise(px + p[1].x + sq(qx) + .17, py + p[1].y + sq(qy) + .92);
   ry = noise(px + p[1].x + sq(qx) + .83, py + p[1].y + sq(qy) + .28);   
   w = noise(px + p[2].x + sq(rx), py + p[2].y + sq(c2));
   */
  switch(mode)
  {
  case 0:
    r = map((sin(qx*PI) + sin(qy*PI)), -.5, 1.6, 0, 1)*255;
    g = map((cos(rx*PI) + cos(ry*PI)), -1.6, 1.6, 0, 1)*255;
    b = map(w, .2, .8, 0, 1) * 255;
    myColor = color(r, g, b);
    break;

  case 1:
    r = map((new PVector(rx, ry)).mag(), 0, 1, 0, 255);
    g = map((new PVector(qx, qy)).mag(), 0, 1, 0, 155);
    //b = map(px+py, 0, width+height, 0, 255) * 255;
    b = map(w, .1, .9, 0, 255);
    myColor = color(r, g, b);
    break;

  case 2:
    myColor = lerpColor(col2, col3, qx);
    myColor = lerpColor(col3, myColor, ry);
    myColor = lerpColor(myColor, col1, w);
    break;

  case 3:
    myColor = lerpColor(col2, col3, (new PVector(qx, qy)).mag());
    myColor = lerpColor(col3, myColor, (new PVector(rx, ry)).mag());
    myColor = lerpColor(myColor, col1, map(w, .15, .85, 0, 1));
    break;
  }

  return myColor;
}

void mousePressed()
{
  if (mouseButton == LEFT)
    initNoise();
  else {
    mode = (mode + 1) % 4;
    println("color mode: " + mode);
  }
}

void keyPressed()
{
  if (mode == 2 || mode == 3)
    initColors();
}

class colors
{
  final color BROWN = color(179, 108, 12);
  final color RED = color(196, 10, 0);
  final color BLACK = color(0);
  final color GREEN = color(11, 179, 39);
  final color YELLOW = color(253, 227, 53);
  final color PINK = color(253, 53, 213);
  final color WHITE = color(255);
  final color BLUE = color(53, 67, 253);
  final color GREY = color(166);
  final color ORANGE = color(255, 156, 58);

  final color[] colors = {
    //0    1    2      3      4        5    6      7      8    9
    BROWN, RED, BLACK, GREEN, YELLOW, PINK, WHITE, BLUE, GREY, ORANGE
  };
}



