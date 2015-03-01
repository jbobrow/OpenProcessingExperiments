
PImage img;

float x = 0;
float y = 0;

Bubble[] bubbles = new Bubble[100];

float t = 0;

void setup() {
  size(450, 300);
  background(0, 0, 50);

   img = loadImage("https://dl.dropboxusercontent.com/u/68719965/lisp01.png");
  //img = loadImage("lisp01.png");

  x = width/2;
  y = height/2;

  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble(x, y);
  }
}

void draw() {
  background(0, 0, 50);

  noStroke();
  fill(0, 30, 100, 80);
  rect(0, height/2+img.height, width, height- (height/2+img.height));

  fill(0, 0, 150, 100);
  wave(0.0);

  image(img, x, y);

  fill(0, 100, 200, 100);
  wave(100);

  y = height/2 + random(-2, 2)+5;

  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].move();
    bubbles[i].display();
  }
}

void wave(float num) {
  float xoff = t;

  beginShape();
  for (int i = 0; i < width; i++) {
    vertex(i, noise(xoff+num)*150+height/2);
    xoff += 0.001;
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  t += 0.01;
}

class Bubble {
  float x;
  float y;
  float imgX;
  float imgY;
  float spdX = random(3, 5);
  float spdY = random(3);
  float r = random(3, 10);
  color c = color(0, random(255), 255);

  Bubble(float tmpImgX, float tmpImgY) {
    imgX = tmpImgX;
    imgY = tmpImgY;
    x = random(imgX);//imgX;
    y = random(imgY + img.height);//imgY + img.height;
  }

  void display() {
    noStroke();
    fill(c, 80);
    ellipse(x, y, r, r);
  }

  void move() {
    x -= spdX;
    y -= spdY;

    if (x < -r) {
      x = imgX;
      y = imgY + img.height;
    }
  }
}
