
class Enemy {
  
  int mySize = 4;
  public float x;
  public float y;
  public float speed;
  
  public Enemy(float xPos, float yPos, float sp) {
    x = xPos;
    y = yPos;
    speed = sp;
  }
  
  public void draw() {
    ellipse(x, y, mySize, mySize);
  }
  
  public void moveTowards(float xPos, float yPos)
  {
  }
}

