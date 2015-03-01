
/* @pjs font = "GillSans-BoldItalic-48.vlw"; */

String word = "chaotic";
PFont f;
char[] letters;
float x = 0.0;
float y = 50.0;
float angle = 0.0;

float speed = 0.5;
void setup() {
  size(600, 400);
  f = loadFont("GillSans-BoldItalic-48.vlw"); 
  textFont(f);
  letters = word.toCharArray(); 
  fill(0);
}

void draw() {
  background(204);
  angle += random(-0.3, 0.3);
  pushMatrix();
  for (int i = 0; i < letters.length; i++) {
    translate(mouseX, y);
    rotate(angle);
    text(letters[i], 0, 50);
  }
  popMatrix();
}




