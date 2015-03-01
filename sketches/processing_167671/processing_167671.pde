
/* @pjs font="UniversLTStd-Cn.ttf"; */

String word = "HOVER";
char[] letters;
float totalOffset = 0;
PFont font;

void setup() {
  size(400, 400);
//  font = loadFont("UniversLTStd-Cn-48.vlw");
  font = createFont("UniversLTStd-Cn",48);
  textFont(font);
  letters = word.toCharArray();
  textAlign(CENTER);
  fill(100,200,100,200);
}

void draw() {
  background(2100);
  translate((width - totalOffset) / 2, 0);
  totalOffset = 0;
  float firstWidth = (width / letters.length) / 4.0;
  translate(firstWidth, 0);
  for (int i = 0; i < letters.length; i++) {
    float distance = abs(totalOffset - mouseX/2);
    distance = constrain(distance, 24, 60);
    textSize(114-distance);
    text(letters[i], random(-30,-27), distance+180);
    float letterWidth = textWidth(letters[i]);
     if (i != letters.length-1) {
      totalOffset = totalOffset + letterWidth;
      translate(letterWidth, 0);
    }
  }
}



