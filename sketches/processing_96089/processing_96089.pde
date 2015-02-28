
JitterCircle jit;
JitterCircle cir;

void setup() {
  size(400, 600);
  background(#B20933);
  smooth();
  jit = new JitterCircle(200, 300, 200);
  cir = new JitterCircle(200, 100, 50);
}

void draw() {
  jit.move();
  jit.display();
  cir.move();
  cir.display();
} 

class JitterCircle {

  float x;
  float y;
  int diameter;
  float speed = 7;

  JitterCircle(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }

  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }

  void display() {
    strokeWeight(4);
    stroke(#19C4FF);
    arc(x, y, diameter, diameter, PI*0.0, PI*1);
    fill(#FFEF00);
    
    
  } 
}



