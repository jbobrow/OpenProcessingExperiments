
class Food {
  
  int s = 10;
  float xPos = random(width);
  float yPos = random(height);
  
  color colour;
  
  Food(color colour) {
    this.colour = colour;
  }
  
  void drawFood() {
    fill(colour);
    ellipse(xPos, yPos, s, s);
  }
  
  boolean isTouching(int x, int y) {
    return dist(x, y, xPos, yPos) <= s;
  }
  
}

