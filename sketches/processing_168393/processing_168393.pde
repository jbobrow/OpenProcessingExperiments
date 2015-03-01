
String word = "SQUISH";
char[] letters;
float totalOffset = 0;
PFont font;

void setup() {
  size(300,300);
  font = loadFont("Serif-48.vlw");
  textFont(font);
  letters = word.toCharArray();
  textAlign(CENTER);
  fill(0);
}

void draw(){
  background(204);
  translate((width-totalOffset)/2,0);
  totalOffset = 0;
  float firstWidth = (width/letters.length) /5.0;
  translate(firstWidth, 0);
  for (int i = 0; i <letters.length; i++) {
    float distance = abs(totalOffset - mouseX);
    distance = constrain(distance, 14,10);
    textSize(84 - distance);
    text(letters[i], 0, height -40);
    float letterWidth = textWidth(letters[i]);
    if (i !=letters.length-1) {
      totalOffset = totalOffset + letterWidth;
      translate(letterWidth, 0);
    }
  }
}



