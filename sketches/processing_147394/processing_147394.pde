
//Beauty Haiku Setup


String[] oneSyllableNouns = {
  "hair", "she", "her", "eyes", "face", "skin", "lips"
};

String[] oneSyllableVerbs = {
  "paint", "draw", "work"
};

String[] twoSyllableNouns = {
  "body", "makeup",  "beauty"
};

String[] twoSyllableVerbs = {
  "apply", "layer", "remove", "polish", "color", "enhance", "transform"
};

String[] threeSyllableAdjectives = {
  "artistic", "cosmetic"
};

String[] threeSyllableNouns = {
  "mascara", "foundation", "haircolor", "collection", "acrylics", "eyelashes"
};

String[] threeSyllableVerbs = {
  "creating", "becoming", "removing", "enjoying", "despising", "ritual"
};

PFont font;

void setup() {
  
  size(600, 400);
  smooth();
}

void draw() {
  frameRate(4);
  background(241, 219, 252);
  noStroke();
  colorMode(RGB, 255);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      float theValue = map(j, 0, height, 0, 255);
      stroke(220, theValue, 230);
      point(i, j);
    }
  }
  font = loadFont("BodoniMTCondensed-BoldItalic-48.vlw");
  textFont (font, 48);
  
  


  String firstLine = twoSyllableVerbs[(int)random(twoSyllableVerbs.length)] + " " + threeSyllableNouns[(int)random(threeSyllableNouns.length)];
  String secondLine = oneSyllableNouns[(int)random(oneSyllableNouns.length)] + " " + threeSyllableNouns[(int)random(threeSyllableNouns.length)] 
    + " " + twoSyllableVerbs[(int)random(twoSyllableVerbs.length)] + " " + oneSyllableVerbs[(int)random(oneSyllableVerbs.length)];
  String thirdLine = threeSyllableAdjectives[(int)random(threeSyllableAdjectives.length)] + " " + twoSyllableNouns[(int)random(twoSyllableNouns.length)];



  println(firstLine);
  println(secondLine);
  println(thirdLine);

  text (firstLine + "\n" + secondLine + "\n" + thirdLine, 25, 50);


  //noLoop();

}




