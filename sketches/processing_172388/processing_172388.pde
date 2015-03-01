
/* @pjs font="AltoPro-SemiBold.ttf"; */

PFont font;
String s = "WAVING";
float angle = 0.0;
float y=0.0;

void setup() {
  size(600, 400);
  font = createFont("AltoPro-SemiBold",60); 
  textFont(font);
  fill(0);
}
void draw() {
  background(255);
  angle += 0.1;
  for (int i = 0; i < s.length (); i++) {
    float c = sin(angle + i/PI);
    float y=((c + 1.0) * 70 + 10);
    text(s.charAt(i), i*80+80, y+150);
  }
}



