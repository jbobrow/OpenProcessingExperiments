
//Samantha Chiu 2014
//hw 9 
//text shaking credit to learning processing
//hold mouse down to release mosquitos

PFont f;
String message = "mosquitos mosquitos";
int maxImages = 3; 
int imageIndex = 0;
PImage [] images = new PImage [maxImages];

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
    fill(0);
    textAlign(LEFT);
    text(letter,x,y);
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
// An array of Letter objects
Letter[] letters;

void setup() {
  size(400,400);
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "plant" + i + ".jpg" ); 
  }
  frameRate(3);
  
  // Load the font
f = createFont("Arial", 40, true);
  textFont(f);
  
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
  background(255);
   
  image(images[imageIndex],0,0);
  imageIndex = (imageIndex + 1) % images.length;
  // increment image index by one each cycle
  // use modulo " % "to return to 0 once the end of the array is reached
  imageIndex = (imageIndex + 1) % images.length;
  for (int i = 0; i < letters.length; i ++ ) {
    

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
