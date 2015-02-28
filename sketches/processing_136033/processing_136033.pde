
void setup() {
  size (1000, 100);
  background(0);
}

float t = 0.;
int x = 0;

void draw() {
    strokeWeight(2);
    stroke(255,0,0);
    point(x % width, map(noise(t), 0., 1., 0., height));
    t = t+0.01;
    x++;
}

