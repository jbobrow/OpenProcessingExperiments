

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
  
  void display() {
    fill(0);
    textAlign(LEFT);
    text(letter,x,y);
  }
  
  // Move the letter randomly
  void shake() {
     frameRate(30);
    x += random(-2,2);
    y += random(-2,2);
  }
  
  // At any point, the current location can be set back to the home location by calling the home() function.
  void home() { 
     frameRate(30);
    x = homex;
    y = homey;
  }
}



