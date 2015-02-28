
class Player {
  
  float x;
  float y;
  float diameter; 
  color c; // color 
  
  Player() {  // Constructor 
    diameter = 50;
    c = color(0); // color is irrelevant anyway because player has been replaced with an image    
  }
  
  void display() {
    image(star,30,mouseY,diameter,diameter);   
  }
  
  void move() {
    x = 30;
    y = mouseY;   
  }
  
}

