
class Dot {
  float x,y;
  float speed; 
  color c;
 
  Dot(float xpos, float ypos, float s, color randomcolor) {
    x= xpos;
    y=ypos;
    speed=s;
    c=randomcolor;
  }

  void fall() {
    y= y+speed;
    if(y>height) {
      y=0;
    }
  }

  void display() {
    noStroke(); 
    fill(c);
    ellipse(x,y,15,15);
  }
}


