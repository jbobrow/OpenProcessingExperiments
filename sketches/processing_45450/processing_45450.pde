
class Snowflake
{
  float timer = 0;
  float x=0, y=0, sz = random(2,8);
  float speedY = 0;
  float accelY = GRAVITY;
  float col = random(220, 255);
  
  void updateSn() {
     speedY += accelY;
     y += speedY;
     timer = timer - 1.2;
  }
  void drawSn() {
    noStroke();
    fill(col, timer);
    ellipse(x, y, sz, sz);
  }
  
  void createNewSn() {
    x = random(-10, width);
    y = random(-10, height/3);
    timer = 200;
  }
}

