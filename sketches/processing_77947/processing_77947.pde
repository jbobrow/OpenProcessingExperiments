
Spot sp1,sp2,sp3;
void setup () {
  size(100,100);
  smooth();
  noStroke();
  sp1 = new Spot(33,50,30,0.5);
  sp2 = new Spot(50,50,10,1.0);
  sp3 = new Spot(80,50,15,2.0);
}
void draw() {
  fill(120,15,50);
  rect(0,0,width,height);
  fill(255);
  sp1.move();
  sp2.move();
  sp3.move();
  sp1.display();
  sp2.display();
  sp3.display();
  
}

class Spot {
  float x,y, diameter,speed;
  int direction = 1;
  Spot(float xpos, float ypos, float dia, float sp){
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = sp;
  }
  void move() {
    y += (speed * direction);
    if ((y>(height - diameter/2)) || (y<diameter/2)) {
      direction *= -1;
    }
  }
  void display() {
    ellipse(x,y,diameter, diameter);
  }
}
