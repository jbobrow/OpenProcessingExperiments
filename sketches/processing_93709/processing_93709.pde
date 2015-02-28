
PImage picture;


float x = 0;
float y = 0;
float w = 259;
float h = 321;

float speedX = 2;
float speedY = 1;

void setup() {
  size(450, 550);
  picture = loadImage("face.png");
}

void draw() {
  background(100);
  //  rect(x,y,w,h);
  image(picture, x, y, w, h);

  x = x + speedX;
  y = y + speedY;

  if (x>width - w) {
    speedX = speedX * -1;
  }
  if (x<0) {
    speedX = speedX * -1;
  }
  if (y>height - h) {
    speedY = speedY * -1;
  }

  if (y<0) {
    speedY = speedY * -1;
  }
}



