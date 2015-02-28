
import gifAnimation.*;
PImage[] animation;
PFont f;
String message = "SPIRIT SWORD GET LONGER";
Letter[] letters;
PImage img;

public void setup() {
  size(480,360);
  noStroke();
  animation = Gif.getPImages(this, "beavis.gif");
  f = createFont("Georgia",30,true);
  textFont(f);
    letters = new Letter[message.length()];
  int x = 30;
  for (int i = 0; i < message.length(); i++) {
    letters[i] = new Letter(x,327,message.charAt(i)); 
    x += textWidth(message.charAt(i));
  }
}
void draw() {
  imageMode(CORNERS);
  image(animation[(int) (animation.length / (float) (width) * mouseX)], width - animation[0].width, height / 2 - animation[0].height / 2);
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
    fill(255,253,130);
    textAlign(LEFT);
    text(letter,x,y);
  }
  void shake() {
    x += random(-2,2);
    y += random(-2,2);
  }
  void home() {
    x = homex;
    y = homey; 
  }
}


