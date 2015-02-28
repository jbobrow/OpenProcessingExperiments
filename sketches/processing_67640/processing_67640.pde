
float square_x = 30;
float square_y = 110;
float move_x = -2;
float move_y = 2;
PImage img;

void setup() {
  frameRate(24);
  size(251, 200);
  img = loadImage("nyan cat.jpg");
  rectMode(CENTER);
  image(img, 0, 0);
}
void draw () {
  rect(square_x, square_y, 50, 50);
  square_x = square_x + move_x;
  square_y = square_y + move_y;

  if (square_x > width) {
    square_x = width;
    move_x = -move_x;
    fill(random(256),random(256),random(256));
  }
  if (square_y > height) {
    square_y = height;
    move_y = -move_y;
    fill(random(256),random(256),random(256));
  }
  if (square_x < 0) {
    square_x = 0;
    move_x = -move_x;
    fill(random(256),random(256),random(256));
  }
  if (square_y < 0) {
    square_y = 0;
    move_y = -move_y;
    fill(random(256),random(256),random(256));
  }
}


