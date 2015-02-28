
class Ball {

  float x,y;
  float speed;
  color c;
  float r;
  
  
  Ball(float x,float y) {
    r=8;
    x=mouseX;
    y=-r*4;
    speed=random(1,5);
    c=color(50,100,150);
    this.x=x;
    this.y=y;
  }

  void fall() {
    y+=speed;
  }

  void draw() {
    fill(209,66,58);
    noStroke();
    ellipse(x,y,r*2,r*2);
  }
}


