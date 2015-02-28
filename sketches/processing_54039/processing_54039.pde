
class Snowflake {
  int w;
  int h;
  float x;
  float y;
  float spdY;

  // Constructor
  // Little Snowflakes
  Snowflake() {
    w = h = 5;
    x = random (width);
    y = random (height);
    spdY = 0.5;
  }

//Bigger Snowflakes
  Snowflake (int x, int y) {
    w = h = 10;
    spdY=0.5;
    this.x=x;
    this.y=y;
  }
  //Methods
  void draw() {
    y += spdY;
    if (y>height) {
      y-=spdY;
    }
    else {
    }
  }
  void display() {
    ellipse(x, y, w, h);
  }
}




