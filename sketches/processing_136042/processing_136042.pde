

void setup() {
  size(800, 600, P2D);
}

void draw() {
  background(255);
  stroke(120);

  translate(width/2, height/2);
  int num = 45;  //num of lines
  int spikes = mouseX / 10;

  float l1 = sin(frameCount * 0.1) * 5 + 40;
  for (int i = 0; i<num; i++) {
    float l2 = sin(frameCount * 0.1 + TWO_PI / num * i * spikes) * 20 + 200;
    line(l1, 0, l2, 0);
    ellipse(l2, 0, 15, 15);
    rotate(TWO_PI / num);
  }
}



