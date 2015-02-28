
PFont staticbold;
String message = "In a gentle way, you can shake the world.";
// An array of Letter objects
Letter[] letters;
 
void setup() {
  size(830, 180);
  staticbold = createFont("staticbold",48);
  textFont(staticbold);
   
  letters = new Letter[message.length()];
  int x = 16;
  for (int i = 0; i < message.length(); i++) {
    letters[i] = new Letter(x,100,message.charAt(i));
    x += textWidth(message.charAt(i));
  }
}
 
void draw() {
  background(255);
  for (int i = 0; i < letters.length; i++) {
    // Display all letters
    letters[i].display();
     
    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    if (mousePressed) {
      letters[i].shake();
    } else {
      letters[i].home();
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
    fill(0);
    textAlign(LEFT);
    text(letter,x,y);
  }
 
  // Move the letter randomly
  void shake() {
    x += random(-4,4);
    y += random(-4,4);
  }
 
  // Return the letter home
  void home() {
    x = homex;
    y = homey;
  }
}



