
class Circle extends Soldier {
  // --------------------------------------------------------------------
  // CONSTRUCTOR
  // --------------------------------------------------------------------
  Circle() {
    super();
  }
  
  Circle(float x, float y) {
    super(x, y);
  } 

  // --------------------------------------------------------------------
  // METHODS
  // --------------------------------------------------------------------
  /* draws the soldier */
  void draw() {
    // draw the shape first
    int diameter = min(width-MIN_SIZE, strength+MIN_SIZE);
    fill(colour);
    ellipse(xPos, yPos, diameter, diameter);
    
    // draw the number over it
    fill(0);
    text(strength, xPos, yPos);
  }
  
  /* if the other Soldier is not of the same type, makes them collide */
  boolean collidesWith(Soldier other) {
    if (!(other instanceof Circle)) {
      return super.collidesWith(other);
    }
    return false; 
  }
}

