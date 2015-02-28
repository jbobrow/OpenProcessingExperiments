
int bg;
int fade_dir;
float theta;

void setup() {
  size(200, 200);
  rectMode(CENTER);
  noStroke();
  fill(0, 127, 127, 127);
  bg = 0;
  fade_dir = 1;
  theta = 0f;
}

void draw() {
  background(0, bg, bg);
  float x = cos(theta) * 30 + width / 2;
  float y = sin(theta) * 30 + height / 2;
  rect(width - x, height - y, 75, 75);
  rect(x, y, 75, 75);
  change_theta();
  fade_bg();
}

void change_theta() {
  theta += 0.1;
}

void fade_bg() {
  if (bg >= 255) {
    fade_dir = -1;
  }
  else if (bg <= 0) {
    fade_dir = 1;
  }
  bg += fade_dir;
}

