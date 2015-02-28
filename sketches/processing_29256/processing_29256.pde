
String theText = "Empty your mind. Be formless, shapeless, like water. Now, you put water into a cup - it becomes the cup. Putting it into a tea-pot - it becomes the teapot. Look, water can flow, or creep, or drip or crash. Be water, my friend.";
PFont myFont;
void setup () {
  smooth();
  size (800, 600);
  println(PFont.list());
  myFont = createFont("Helvetica", 43);
  textFont(myFont);
}
void draw() {
  background(255, 222, 0);
  float wordPositionX = 30;
  float wordPositionY = 00;
  for (int i = 0;  i < theText.length(); i = i + 1) {
    char letter = theText.charAt(i);
    float letterWidth = textWidth(letter);
    if (theText.charAt(i) == 'e' ) {
       if (keyPressed) {
        if (key == 'e' )
          background(255, 222, 0);
       }
    }
    else {
      fill(0, 0, 0);
    }
    text(letter, wordPositionX, 80 + wordPositionY);
    wordPositionX = wordPositionX + letterWidth;
    if (wordPositionX > width-65) {
      wordPositionX = 30;
      wordPositionY = wordPositionY + 60;
    }
  }
}


