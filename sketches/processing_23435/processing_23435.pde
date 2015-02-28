
// Char Class - defines the character object created when a key is pressed in the pseudo terminal...
// This class started life as the Dot class developed in first intensive.
  
class Char{

  // Variable declarations
  PVector pos; // the position of the character object 
  PVector vel; // velocity of the character object
  PVector acc = new PVector(0, 0.05); // acceleration applied to the character object
  char k; // the character represented by the character object
  color c; // color to print the text
  int age; // age of the character object
  
  // Constructor
  // takes three parameters: a PVector giving the initial position of the character to be printed, 
  // the color of the text and the character to print.
  Char(PVector _pos, color _c, char _k){
    pos = _pos; // set initial position
    c = _c; // set color
    k = _k; // set character
    vel = new PVector(0, 0.1); // set initial velocity... down.
  }

  // render(): draws the character to the screen. called by draw()
  void render(){
    fill(c); // text color
    text(k, pos.x, pos.y); // print character represented by the Char object at it's current position value.
  }
  
  // move(): increments the position of the Char object. called by draw()
  void move(){
    if(age > 120){ // wait a while before falling
      pos.add(vel); // increment position using current velocity
      vel.add(acc); // apply acceleration to velocity
    }
  }
  
  // age(): increments the age variable of the Char object. called by draw(). used to determine when to start the 
  // character falling, and when to remove it from the ArrayList...
  void age(){
    age++; // increment the age variable by one
  }
  
  // bounce(): inverts the direction of the velocity vector and reduces it's magnitude when the position of the character
  // reaches the bottom of the screen
  void bounce(){
    if(pos.y > height){ // if the position of the character reaches the bottom of the screen,
      vel.y = vel.y * -0.7; // invert the direction and reduce the magnitude of the Char object's velocity vector by 30%
    }
  }
}

