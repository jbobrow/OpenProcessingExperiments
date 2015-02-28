
String word = "INFLATE";
char[] letters;
float totalOffset = 0;
PFont font;

void setup() {
  size(200, 200);
  font = loadFont("GillSansStd-Bold-48.vlw");
  textFont(font);
  letters = word.toCharArray();
  textAlign(CENTER);
  fill(0);
}

void draw() {
  background(150, 190, 220);
  translate((width - totalOffset) / 6, 0);
  totalOffset = 0;
  float firstWidth = (width / letters.length)/ 6.0;
  translate (firstWidth, 0);
  for (int i = 0; i < letters.length; i++) {
    float distance = abs(totalOffset - mouseX);
   distance = constrain(distance, 24, 60);
  textSize(84-distance);
 text(letters[i], 0, height - 2);
float letterWidth = textWidth(letters[i]);
if (i !=letters.length-1) {
  totalOffset = totalOffset +letterWidth;
  translate(letterWidth, 0);
}
}
}

