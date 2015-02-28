
PImage pict1, pict2;
int c;
int r1 = 50;
int r2 = 10;

int flg = 1;

void setup() {
  size(550, 250);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  pict1 = loadImage("heart01.png");
  pict2 = loadImage("heart02.png");
  imageMode(CENTER);

  frameRate(8);
}

void draw() {
  for (int i = 0; i < 10;i++) {
    noStroke();
    fill(random(290, 360), random(100), 100, 80);
    ellipse(random(width/2), random(height), r1, r1);
  }

  if (flg == 1) {
    image(pict2, width/4, height/2);
    image(pict1, width*3/4, height/2);
  }

  for (int i = 0; i < 2500;i++) {
    int rx = (int)random(width/2,width);
    int ry = (int)random(height);
    c = get(rx, ry);

    if (flg == 0) {
      c = -1118482;
    }

    if (c == -1118482) {
      noStroke();
      fill(random(160, 260), 100, 100, 80);
      ellipse(rx, ry, r2, r2);
    }
  }
}

public void mousePressed() { save("pict" + hour() + minute() + second() + ".png");  }

