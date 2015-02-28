
PImage[] images = new PImage[4];

int pata;
int patasection;
int pataflg;

int f_w = 230;
int f_h = 324;

float x = 700 + f_w / 2;
float y;

color bg = color(255, 216, 243);

void setup() {
  size(700, 200);
  background(bg);

  for (int i = 0; i < 4; i++) {
    images[i] = loadImage("f0" + (i+1) + ".png");
  }

  imageMode(CENTER);
}

void draw() {
  background(bg);
  patapata();

  if (pataflg == 1) {
    image(images[0], x, y);
  }
  else {
    image(images[1], x, y);
  }

  x--;
  y = height/2 + 10*sin(pata/10);
  pata++;
  
  if(x < - f_w){
    x = width + f_w / 2;
  }
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

