
int numSpots = 90;
Spot[] spots = new Spot[numSpots];

void setup() {
  size(600,300);
  smooth();
  noStroke();
  for (int i = 0; i < spots.length; i++) {
    float x=10 + i*16;
    float rate = 0.5 + i*0.05;
    spots[i] = new Spot(x, 50, 16, rate);
  }
}

void draw() {
  fill(0,12);
  rect(0,0,width,height);
  fill(255);
  for (int i = 0; i < spots.length; i++) {
    spots[i].move();
    spots[i].display();
  }
}
class Spot {
  float x, y;
  float diameter;
  float speed;
  int direction = 1;
  
  // Constructor
  Spot(float xpos, float ypos, float dia, float sp1) {
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = sp1;
  }
  
  void move() {
    y += (speed *direction);
    if ((y> (height - diameter/2)) || (y<diameter/2)) {
      direction *= -1;
    }
  }
  
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}
    


