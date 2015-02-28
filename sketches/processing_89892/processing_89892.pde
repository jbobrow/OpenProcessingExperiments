
PFont f;
String message = "Stares so empty, screams so silent...";
Letter[] letters;
PImage img;

void setup() {
  size(650,650);
  img = loadImage("sm1.png");
  f = createFont("Georgia",36,true);
  textFont(f);
    letters = new Letter[message.length()];
  int x = 30;
  for (int i = 0; i < message.length(); i++) {
    letters[i] = new Letter(x,70,message.charAt(i)); 
    x += textWidth(message.charAt(i));
  }
}

void draw() { 
  image(img,0,0);
  for (int i = 0; i < letters.length; i++) {
    letters[i].display();
    if (mousePressed) {
      letters[i].home();
    } else {
      letters[i].shake();
    }
  }
}
class Letter {
  char letter;
  float homex,homey;
  float x,y;

  Letter (float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_; 
  }
  void display() {
    fill(210,0,0);
    textAlign(LEFT);
    text(letter,x,y);
  }
  void shake() {
    x += random(-3,3);
    y += random(-3,3);
  }
  void home() {
    x = homex;
    y = homey; 
  }
}


