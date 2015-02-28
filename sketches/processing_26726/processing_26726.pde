
class Ball {
  float x;
  float y;
  float speed;
  float w;
  color c;
  
  Ball (float tempX,float tempY, float tempW, color tempC) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    c = tempC;
  }
  
  void gravity (){
    speed = speed + gravity;
  }
  
  void move () {
    y = y + speed;
    if (y > height) {
      speed = speed * - 0.95;
      y = height;
    }
  }
  
  void display () {
    fill(c,random(30,130));
    noStroke();
    ellipse (x,y,w,w);
  }
}

