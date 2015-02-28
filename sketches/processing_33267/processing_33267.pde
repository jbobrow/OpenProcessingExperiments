
PImage b;

float x;
float y;
float speedX = 4;
float speedY = 3;
float radius = 15;

void setup() {  
  size (730, 400);
  b = loadImage("table.jpg");
}

//the movement of the ball
void draw() {

  image(b, 0, 0);

  //for (int i = 0; i < 2; i++) {

  noStroke();
  ellipse (x, y, radius*2, radius*2);
  smooth();
  x+=speedX;
  y+=speedY;

  if (x > 700 - radius) {
    x = 700 - radius;
    speedX = speedX * -1;
    fill(255, 255, 0);
    ellipse (x, y, radius*2, radius*2);
  }
  else if (x < 30 + radius) {
    x = 30 + radius;
    speedX = speedX * -1;
    fill(255, 0, 0);
    ellipse (x, y, radius*2, radius*2);
  }

  if (y > 370 - radius) {
    y = 370 - radius;
    speedY = speedY * -1;
    fill(0, 0, 255);
    ellipse (x, y, radius*2, radius*2);
  }
  else if (y < 30 + radius) {
    y = 30 + radius;
    speedY = speedY * -1;
    fill(0, 255, 0);
    ellipse (x, y, radius*2, radius*2);
  }
  //}
}

//makes the ball change direction
void mouseClicked() {
  speedX = speedX * -1;
}

//increases the size of the ball
void mouseDragged() {
  radius++;
}

//brings ball back to original size
void mouseReleased() {
  radius = 15;
}


