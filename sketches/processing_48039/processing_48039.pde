
void setup() {
  size(500, 400);
  background(255);
  smooth();
}

int x_speed = 12;
int y_speed = 6;
int rad = 25;
int e_x = rad;
int e_y = rad;

float bg_count = 0;

void draw() {
  float rad =random(50);

  strokeWeight(7);
  stroke(random(255), random(255), random(255));
  fill(random(100), random(255), 255, 50);
  ellipse(e_x, e_y, rad*2, rad*2);
  e_x += x_speed;
  e_y += y_speed;
  bg_count++;

  if (bg_count > 20) {
    background(255);
    bg_count = 0;
  }

  if (e_x > width - rad || e_x < rad) {
    x_speed *= -1;
  }
  if (e_y > height - rad || e_y < rad) {
    y_speed *= -1;
  }
}


