
class Drop {

  float x,y;   
  float speed; 
  color c;
  float r;     

  Drop() {
    r = 8;                 
    x = random(width);     
    y = -r*4;              
    speed = random(1,2);   
    c = color(155,255,254);
  }


  void move() {
    y += speed;
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x,y,r*2,r*2);
  }
}


