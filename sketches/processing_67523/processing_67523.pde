
void setup() {
  size(300, 500);
  colorMode(HSB, 360, 100, 100);
  background(300);
  smooth();
  stroke(360, 80);
  strokeWeight(3);
}

float t;

void draw() {
  background(300);

  translate(width/2, 0);
  for (int i = 35; i > 0; i--) {
    fill(i*10, 100, 100, 80);
    if (i != 1) {
      line((70+(i-1)*1.5)*sin(t+(i-1)), (470-(i-1)*10)+(30+(i-1)*1.5)*cos(t+(i-1)), (70+i*1.5)*sin(t+i), (470-i*10)+(30+i*1.5)*cos(t+i));
    }
    if (i > 6) {
      line((70+(i-6)*1.5)*sin(t+(i-6)), (470-(i-6)*10)+(30+(i-6)*1.5)*cos(t+(i-6)), (70+i*1.5)*sin(t+i), (470-i*10)+(30+i*1.5)*cos(t+i));
    }
    ellipse((70+i*1.5)*sin(t+i), (470-i*10)+(30+i*1.5)*cos(t+i), i*1.5, i*1.5);
  }
  t += 0.03;
}


