
class Food {
  
  int s = 10;
  float xPos = random(width);
  float yPos = random(height);
  
  FoodType type;
  
  Food(FoodType type) {
    this.type = type;
  }
  
  void drawFood() {
    fill(type.colour);
    ellipse(xPos, yPos, s, s);
  }
  
  boolean isTouching(int x, int y) {
    return dist(x, y, xPos, yPos) <= s;
  }
  
}

