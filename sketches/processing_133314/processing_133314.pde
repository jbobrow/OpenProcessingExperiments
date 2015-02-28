
PImage webImg;

void setup() {
  size(600, 600);
  String url = "http://peterok.dk/img/cylon.jpg";
  webImg = loadImage(url, "jpg");
}

float x =185;
int direction = 0;

void draw() {
  background(0);
  image(webImg, 0, 0);

  if (x>415 && direction == 0) {
    direction = 1;
  }

  if (x==185) {
    direction = 0;
  }

  if (direction == 0) {
    x= x+2;
  } 
  if (direction == 1) {
    x= x-2;
  }
  fill(255, 0, 0);
  ellipse(x, height/2, 15, 15);
}

