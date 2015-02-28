
class Bike {
  //puntos actuales x,y
  float x;
  float y;
  //puntos anteriores px,py
  float px; 
  float py;
  float acc = .03;
  int weight = 2;
  color c= #05afbc;

  Bike() {
    this.x=0;
    this.y=0;
    this.px=0;
    this.py=0;
  }
  void draw() {
    //valor x en mouse x
    float targetX = mouseX;
    x+=(targetX - x) * acc;
    if (x>=192)
      x=192;
    float targetY = mouseY;
    y+=(targetY - y) * acc;
    if (y>=157)
      y=157;
    stroke(c);
    strokeWeight(weight);
    line(x,y,px,py);
    py=y;
    px=x;
  }
}


