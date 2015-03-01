
PFont font;
String s = "YO-YO";
float angle = 0.0;


void setup() {
  size(400,400);
  font = loadFont("Serif-48.vlw");
  textFont(font);
  fill(30, 90, 200);
}

void draw() {
  background(190, 100, 100, 50);
  angle += 0.1;
  for (int i =0; i<s.length(); i++) {
    float c = sin(angle + i/HALF_PI);
    textSize((c + 3.0) * 32 + 10);
    text(s.charAt(i), i*80, 160);
  }
}



