
PImage[] images = new PImage[4];

int pata;
int patasection;
int pataflg;

float x;
float y;
float easing = 0.03;

int f_w = 230;
int f_h = 324;

color bg = color(255, 216, 243);

void setup() {
  size(700, 200);
  background(bg);

  for (int i = 0; i < 4; i++) {
    images[i] = loadImage("f0" + (i+1) + ".png");
  }

  //imageMode(CENTER);
}

void draw() {
  float targetX = mouseX;

  x += (targetX - x) * easing;

  background(bg);
  patapata();

  if (mouseX > x) {
    if (pataflg == 1) {
      image(images[2], x - f_w, y);
    }
    else {
      image(images[3], x - f_w, y);
    }
  }
  else {
    if (pataflg == 1) {
      image(images[0], x, y);
    }
    else {
      image(images[1], x, y);
    }
  }

  y = height/2 + 10*sin(pata/10) - f_h/2;
  pata++;
}

void patapata() {
  patasection = pata / 10;

  if (patasection % 2 == 0) {
    pataflg = 1;
  }
  else {
    pataflg = 0;
  }
}

