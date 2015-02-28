
float k = 1.33;

color a = #00C90B;
color b = #01939A;
color c = #FF7600;
color d = #FF0700;

color[] palette = {a,b,c,d};
color cirColor;

void setup() {
  size(400,400);
  smooth();
  background(255);
}

void draw() {
  translate(width/2, height/2);
  scale(200, 200);
  strokeWeight(0.001);
  float t = frameCount / 20.0;
  float x = cos(k * t) * sin(t);
  float y = cos(k * t) * cos(t);
  int ranNum = floor(random(0, 4));
  cirColor = palette[ranNum];
  stroke(cirColor);
  point(y, x);
  point(x, y);
}
