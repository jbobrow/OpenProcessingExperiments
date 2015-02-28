
//CLOCK
//Xuan Li

int h;
int m;
int s;

//LISSAJOUS
float spin = 0;
float x = 0;
float y = 0;
float spinM = 0;
float xM = 0;
float yM = 0;
float spinH = 0;
float xH = 0;
float yH = 0;

color secColor;
color mColor;
color hColor;

void setup() {

  size(1024, 768, JAVA2D);
  background(255);
  noStroke();
}

void draw() {

  //background(255);
  fill(250, 5);
  rect(0, 0, width, height);

  s = second();  // Values from 0 - 59
  m = minute();  // Values from 0 - 59
  h = hour() % 12;    // Values from 0 - 23
  //println(h % 12);
  float secMap = map(s, 0, 59, 0, 200);
  secColor = color(secMap, secMap*0.01, secMap*0.5);
  mColor = color(25);
  hColor = color(25);

  createSeconds();
  createMinutes();
  createHours();
}

void createSeconds() {
  //LISSAJOUS SECONDS
  pushStyle();
  fill(secColor);
  for(int i = 0; i < 1000; i++) {

    float xPct = (float)(i * 150) * 0.0001;
    float yPct = (float)(i * 200) * 0.0001;

    xPct += spin * 0.002;
    yPct += spin * 0.003;

    x =  480  * sin(xPct);
    y =  160.0  * cos(yPct);

    rect(510 + x, 190+y, 2, 2);
  }

  popStyle();
  spin += s;
}

void createMinutes() {

  float mScale = map(m, 0, 59, 0, 100);
  pushStyle();
  fill(mColor); //25
  for(int i = 0; i < 1000; i++) {

    float xPct = (float)(i * 1) * 0.01;
    float yPct = (float)(i * mScale) * 0.002;

    xPct += spinM * 0.002;
    yPct += spinM * 0.003;

    x =  480  * sin(xPct);
    y =  140.0  * cos(yPct);

    rect(510 + x, 460+y, 2, 2);
  }
  popStyle();
  spinM += (s/3);
}

void createHours() {

  float hScale = map(h, 0, 12, 0, 120);

  pushStyle();
  fill(hColor);
  for(int i = 0; i < 1000; i++) {

    float xPct = (float)(i * hScale) * 0.002;
    float yPct = (float)(i * 1) * 0.002;

    xPct += spinH * 0.002;
    yPct += spinH * 0.003;

    x =  480  * sin(xPct);
    y =  80.0  * cos(yPct);

    rect(510 + x, 660+y, 2, 2);
  }
  popStyle();

  spinH += (s/12);
}


