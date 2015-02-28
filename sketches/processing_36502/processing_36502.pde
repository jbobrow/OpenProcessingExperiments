
String theText = "vergiss nicht durch dauerhaftes nachdenken alles anders zu machen als du es intuitiv für richtig gehalten hast. behalte was du fühlst. mach einfach.";
PFont myFont;
void setup () {
  smooth();
  size (500, 800);
  println(PFont.list());
  myFont = createFont("Times", 72);
  textFont(myFont);
}
void draw() {
  background(255, 255, 0);
  float wordPositionX = 10;
  float wordPositionY = 00;
  for (int i = 0;  i < theText.length(); i = i + 1) {
    char letter = theText.charAt(i);
    float letterWidth = textWidth(letter);
    if (theText.charAt(i) == 'e' ) {
       if (keyPressed) {
        if (key == 'e' )
          background(255, 22, 0);
       }
    }
    else {
      fill(0, 0, 0);
    }
    text(letter, wordPositionX, 20 + wordPositionY);
    wordPositionX = wordPositionX + letterWidth;
    if (wordPositionX > width-5) {
      wordPositionX = 30;
      wordPositionY = wordPositionY + 105;
    }
  }
}


