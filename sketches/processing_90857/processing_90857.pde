
PFont f;
String message = "WHAT EDDINGTON SAYS ABOUT THE DIRECTION OF TIME AND THE LAW OF ENTROPY COMES TO THIS: TIME WOULD CHANGE ITS DIRECTION I MEN SHOULD START WALKING BACKWARDS ONE DAY. OF COURSE YOU CAN CALL IT THAT IF YOU LIKE; BUT THEN YOU SHOULD BE CLEAR IN YOUR MIND THAT YOU HAVE SAID NO MORE THAN THAT PEOPLE HAVE CHANGED THE DIRECTION THEY WALK IN.";
// An array of Letter objects
Letter[] letters;
int[] lenOfWords;
int charSize = 20; 
int onLetter = 0;
int x, y;
int mLength;

void setup() {
  background(255);
  size(800, 800);
  // Load the font
  f = createFont("Times",charSize,true);
  textFont(f);
  x = width - 16;
  y = height/2;
 
  mLength = message.length();
  // Create the array the same size as the String
  letters = new Letter[mLength];
  lenOfWords = new int[mLength];
  // Initialize Letters at the correct x location
  int i;
  int len = 0;
  int posInArray = 0;
  for (i = 0; i < mLength; i++) {
    char c = message.charAt(i);
    if( c == ' ') {
      lenOfWords[posInArray] = len;
      println("length: " + len);
      len = 0; 
      posInArray++;
    }
    else 
      len++;
    
    letters[i] = new Letter(x,y,c); 
  }
} 

void draw() { 
  //background(255);
    // Display all letters
    if(onLetter >= mLength)
      return;
    Letter l = letters[onLetter];
    if(x < 16) {
      x = width - 16;
      y = y - charSize - 5;
    }
    println("x " + x + " y " + y);
    l.x = x;
    l.y = y;
    l.display();
    x -= textWidth(l.letter);
    
    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    if (mousePressed) {
      letters[onLetter].shake();
    } else {
      letters[onLetter].home();
    }
    onLetter++;
  
}

// A class to describe a single Letter
class Letter {
  char letter;
  // The object knows its original "home" location
  float homex,homey;
  // As well as its current location
  float x,y;

  Letter (float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_; 
  }

  // Display the letter
  void display() {
    fill(0);
    textAlign(CENTER);
    text(letter,x,y);
  }

  // Move the letter randomly
  void shake() {
    x += random(-2,2);
    y += random(-2,2);
  }

  // Return the letter home
  void home() {
    x = homex;
    y = homey; 
  }
}

