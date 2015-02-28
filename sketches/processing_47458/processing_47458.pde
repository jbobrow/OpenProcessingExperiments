
Spot[] sp = new Spot[300];

void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new Spot(
      random(width/2-10, width/2+10), 
      random(height/2-10, height/2+10 ) , 
      random(5, height/2), 
      random(0.5, 5)
    );
  }
}

void draw() {
  background(0);
  for (int i = 0; i < sp.length; i++) {
    sp[i].move();
    sp[i].display();
  }
}


class Spot {
  float x, y, diameter, speed;
  float h = random(256);
  float b_diameter;
  
  Spot(float _x, float _y, float _diameter, float _speed) {
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
    b_diameter = diameter;
  }
  
  void move() {
    diameter = b_diameter*sin(frameCount*speed*PI/600);
  }
  
  void display() {
    colorMode(HSB);
    fill(h, 255, 255, 51);
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
 
}
