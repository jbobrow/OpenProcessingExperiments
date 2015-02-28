
int x=0;
int y =0;
float v = 10.0;
float inc = 2;

void setup() {
  size(800, 400);

  fill(100);
  frameRate(20);
  smooth();
  noStroke();
  noiseSeed(0);
}

void draw() {
  background(0);
  translate(x, 50);
  for (int i = 0; i < width; i = i+10) {

    float n = noise(v) * 200.0;
    rect(x+i, random(120), 5, 160);
    fill(54, 252,214,random(255));
    v = v + inc;
  }
}
