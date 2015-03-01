
/* @pjs font="GothamThin-Italic.ttf"; */
String word = "collapse";
PFont f;
char[] letters;

void setup() {
  size(400,400);
//  f = loadFont("GothamThin-Italic-48.vlw");
 f = createFont("GothamThin-Italic",48);
  textFont(f);
  letters = word.toCharArray();
  fill(250,200,100,150);
}

void draw() {
  background(50);
  pushMatrix();
  translate(10,50);
  for (int i = 0; i < letters.length; i++) {
    float move = map(mouseX, 0, width, 0, 50);
    translate(move,pow(move,1.6));
    text(letters[i], 0, 0);
    translate(textWidth(letters[i]), 0);
  }
  popMatrix();
}


