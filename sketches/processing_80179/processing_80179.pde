
// Credit: Daniel Shiffman: http://www.learningprocessing.com
// Example 17-6: Text breaking up 

PImage img;
PFont font;
String message = "incoming call";

// An array of Letter objects
Letter[] letters;

void setup() {
  size(500,300);
  img = loadImage ("iphone.jpg");
  font = loadFont("ClaireHand-Regular-48.vlw");
  textFont(font);
  
  // Create the array the same size as the String
  letters = new Letter[message.length()];
  
  // Initialize Letters at the correct x location
  int x = 16;
  for (int i = 0; i < message.length(); i ++ ) {
    // Letter objects are initialized with their location within the String as well as what character they should display.
    letters[i] = new Letter(x,100,message.charAt(i)); 
    x += textWidth(message.charAt(i));
  }
}

void draw() {
  image(img,0,0);
  for (int i = 0; i < letters.length; i ++ ) {

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
  
  // The object knows its original " home " location
  float homex,homey;
  
  // As well as its current location
  float x,y;
  
  Letter(float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_;
  }
  
  // Display the letter
  void display() {
    fill(#FF6A6A);
    textAlign(LEFT);
    text(letter,x+100,y+50);
  }
  
  // Move the letter randomly
  void shake() {
    x += random(-2,2);
    y += random(-2,2);
  }
  
  // At any point, the current location can be set back to the home location by calling the home() function.
  void home() { 
    x = homex;
    y = homey;
  }
}

