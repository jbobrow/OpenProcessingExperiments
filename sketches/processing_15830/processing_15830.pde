
JitterBug[] bugs = new JitterBug[100]; 

void setup() {
  size(600, 600);
  background (0);
  smooth();
  for (int i = 0; i< bugs.length; i++){ 
    float x = random(width);
    float y = random(height);
    int r = int(random(100));
    bugs[i] = new JitterBug(x,y,r);
  }
}

void draw() {
  for (int i = 0; i < bugs.length; i++) {
  bugs[i].move();
  bugs[i].display();
  fill(0,0,0,1);
  rect(0,0,width, height);
  }
}

class JitterBug {
  float x;
  float y;
  int diameter;
  float speed = 10;
  
  JitterBug(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
  
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
  
  void display() {
    noStroke();
    fill(random(255), random(255), random(255), 25); 
    ellipse(x, y, mouseX/4, mouseY/4);
  }
}

