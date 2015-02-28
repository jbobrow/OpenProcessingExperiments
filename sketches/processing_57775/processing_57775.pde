
class Circles {
  float x;
  float y;
  float speed;
  color c;
  float r;
  float shakex;
  float shakey;
  
  Circles(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    c = color(random(255), 0, random(100), random(100));
    r = random(50);
    shakex = random(5);

    
  }
  
  void move1() {
    
    fill(c);
    x-=random(-speed*3, speed*3) *shakex;
    y+=random(-speed*3, speed*3);
    ellipse(x, y, r, r);
  }
  
  void move2() {
    fill(c);
    x+=random(-speed*5, speed*5) *shakex;
    y-=random(-speed*6, speed*6);
    ellipse(x, y, r, r);
  }
}

