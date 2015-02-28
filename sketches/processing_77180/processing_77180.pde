
PFont f;

String message = "KENNY ROSE DESIGN";

Letter[] letters;

void setup () {
  size (800, 600);
  f = createFont ("Verdana Bold", 36, true);
  textFont (f);
  letters = new Letter [message.length ()];
  int x = 16;
  for (int i = 0; i < message.length (); i++) {
    letters [i] = new Letter (x, 100, message.charAt (i));
    x += textWidth (message.charAt (i));
  }
}

void draw () {
  background (50);
  textFont (f,16);
  fill (255, 235, 215);
  text ("created with Processing and Processing.js", 200, 20);
  for (int i = 0; i < letters.length; i++) {
    letters [i].display();
    if (mousePressed) {
      letters[i].shake();
    } else {
      letters[i].home();
    }
  }
}

class Letter {
  char letter;
  float homex, homey;
  float x,y;
  
  Letter (float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_;
  }
  
  void display() {
    fill (255, 120, 120);
    textAlign (CENTER);
    textFont (f, 42);
    text (letter, x, y);
  }
  
  void shake() {
    x += random (-5, 5);
    y += random (-5, 5);
  }
  
  void home () {
    x = homex + 175;
    y =homey + 200;
  }
}


