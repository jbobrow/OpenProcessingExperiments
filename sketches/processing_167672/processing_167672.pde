
/* @pjs font="UniversLTStd-Cn.ttf"; */
String word = "elastic tether";
PFont f;
char[] letters;

void setup() {
  size(600, 400);
//  f = loadFont("UniversLTStd-Cn-48.vlw");
  f = createFont("UniversLTStd-Cn",48);
  textFont(f);
  letters = word.toCharArray();
  fill(0,100,200,200);
}

void draw() {
  background(20);
  pushMatrix();
  translate(0, 352);
  for (int i = 0; i < letters.length; i++) {
    float angle = map(mouseX, 0, width, 0, PI/8);
//  translate(mouseX/30, -mouseY/20);
  translate(mouseY/20,-mouseX/30);
  text(letters[i], 0, 0);
  // Offset by the width of the current letter
  translate(textWidth(letters[i]), 0);
  }
  popMatrix();
}


