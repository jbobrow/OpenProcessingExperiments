
void setup(){
  size(100, 100);
  background(0);
}

void draw(){
  float s = map(second(), 0, 59, 0, TWO_PI)-HALF_PI;
  float m = map(minute(), 0, 59, 0, TWO_PI)-HALF_PI;
  float h = map(hour()%12, 0, 12, 0, TWO_PI)-HALF_PI;
  fill(80);
  noStroke();
  ellipse(50, 50, 80, 80);
  stroke(180);
  line(50, 50, 50+cos(s)*40, 50+sin(s)*40);
  stroke(220);
  line(50, 50, 50+cos(m)*40, 50+sin(m)*40);
  stroke(255);
  line(50, 50, 50+cos(h)*35, 50+sin(h)*35);
}
