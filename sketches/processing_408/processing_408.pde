
int height = 100;
int width = 100;
int iter = 10000;
int border = 500;

void setup() {
  size(width, height);
  smooth();
  background(0);
  for(int i = 0; i < iter; i++) {
    stroke(random(255), random(255), random(255), random(255));
    line(p(width), p(height), p(width), p(height));
  }

}

float p(int n) {
  return random(n + 2* border) -border;
}

void draw() {
 

}


