
float x = random(0, width);
float y = random(0, height);
float radi = 40;
float speedx = random(-5, 5);
float speedy = random(-5, 5);
float ksk = 0;

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
}

void draw() {


  feedToWhite();

  if (ksk < 5) {
    ksk = ksk + 0.008;
  }

  if (ksk > 5) {
    ksk = - ksk + 0.008;
  }

  x = x + speedx * ksk;
  y = y + speedy * ksk;

  println(ksk);

  if (x + radi > width) {

    speedx = -speedx;

    x = width - radi;
  }
  if (x - radi < 0) {

    speedx = -speedx;

    x = radi;
  }
  if (y + radi > height) {

    speedy = -speedy;

    y = height - radi;
  }
  if (y - radi < 0) {

    speedy = -speedy;

    y = radi;
  }

  fill(0);
  ellipse(x, y, radi*2, radi*2);
}

void feedToWhite() {
  fill(255, 30);
  rect(0, 0, width, height);
}


