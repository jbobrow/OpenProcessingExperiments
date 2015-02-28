
float r_w = random(20,40);
float r_h = r_w * 3;

float c = random(360);

float r_x = random(400);
float r_y = random(400);

int n_w;
int n_h;

float t;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
}

void draw() {
  fill(360, 10);
  noStroke();
  rect(0, 0, width, height);

  fill(c*10, 80, 100);

  flower(r_x, r_y);
}

void flower(float x, float y) {

  pushMatrix();
  translate(x, y);
  rotate(radians(t));
  for (int i = 0; i < 4;i++) {
    pushMatrix();
    rotate(radians(i * 45 + t));
    ellipse(0, 0, n_w, n_h);
    popMatrix();
  }
  popMatrix();
  n_w++;
  n_h+= 3;

  if (n_w > r_w) {
    n_w = 0;
    n_h = 0;

    r_x = random(400);
    r_y = random(400);  
    
    c = random(36);
    r_w = random(20,40);
  }
  t+=3;
}

