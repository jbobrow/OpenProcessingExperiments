
//Beauty Haiku Setup
String[] oneSyllable = {
  "hair", "she", "her", "he", "eyes", "face", "skin", "paint", "lips"
};

String[] twoSyllable = {
  "body", "makeup", "apply", "layer", "remove", "polish", "color", "beauty", "enhance", "transform"
};

String[] threeSyllable = {
  "mascara", "foundation", "haircolor", "ritual", "becoming", "artistic", "cosmetic", "collection", "acrylics", "eyelashes"
};

PFont font;


void setup() {
  size(600, 400);
  smooth();
}

void draw() {
  background(241, 219, 252);
  noStroke();
  colorMode(RGB, 255);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      stroke(220, j, 230);
      point(i, j);
    }
  }
  font = loadFont("BodoniMTCondensed-BoldItalic-48.vlw");
  textFont (font, 48);

  String firstLine = twoSyllable[(int)random(twoSyllable.length)] + " " + threeSyllable[(int)random(threeSyllable.length)];
  String secondLine = oneSyllable[(int)random(oneSyllable.length)] + " " + threeSyllable[(int)random(threeSyllable.length)] 
    + " " + twoSyllable[(int)random(twoSyllable.length)] + " " + oneSyllable[(int)random(oneSyllable.length)];
  String thirdLine = twoSyllable[(int)random(twoSyllable.length)] + " " + threeSyllable[(int)random(threeSyllable.length)];

  println(firstLine);
  println(secondLine);
  println(thirdLine);

  text (firstLine + "\n" + secondLine + "\n" + thirdLine, 25, 50);

  noLoop();
}



