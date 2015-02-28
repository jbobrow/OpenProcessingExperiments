
int aaa = 100;
int h = 400;//screen.height;
int w = 900;//screen.width;

void setup() {
  size(w, h);
  rectMode(CENTER);
  smooth();
}

void draw() {
  fill(random(255));
  rect(random(aaa,w-aaa), (random(aaa,h-aaa)), random(aaa), random(aaa));
}

