
int s, m, h;

void setup() {
  size(600,600);
  colorMode(HSB, 86400);
  textSize(100);
}

void draw() {
  s = second();
  m = minute();
  h = hour();
  if (s == 0)
    s = 1;
  if (m == 0)
    m = 1;
  if (h == 0)
    h = 1;
  background(color(s*m*h, 86400, 86400));
  //fill(color(86400-(s*m*h), 86400, 86400));
  fill(255);
  text(hour() + ":" + minute() + ":" + second(),100,100);
}
