
float t;
int num = (int)random(1,20);
float c = random(360);
float amp = random(50,100);

void setup() {
  size(400, 300);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
}

void draw() {
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);

  strokeWeight(5);
  for (float i = 0; i < width; i+=0.8) {
    stroke(c, 50, 100);
    point(i, amp*sin(i*num+t)+height/2);
  }
  t += 0.02;
}

void mousePressed() {
  num+= (int)random(1,10);
  amp = random(50,100);
  c = random(360);
}


