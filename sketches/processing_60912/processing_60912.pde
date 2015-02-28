
int x;
int y;
int maxSpeed=5;
int minSpeed=0;
int fieldSize = 500;
boolean trails = true;

Trail field[] = new Trail[fieldSize];

void setup() {
  size(500, 500);
  background(0);
  x = width/2;
  y = height/2;
  for(int i = 0; i<fieldSize; i++) {
    field[i] = new Trail(color(int(random(255)), int(random(255)), int(random(255)), 63), x, y);
  }
  smooth();
  stroke(0);
}
void draw() {
  if (!trails) {
    background(255);
  }
  for(int j = 0; j<fieldSize; j++) {
    field[j].go();
    field[j].display();
  }
}

class Trail {
  color c;
  float xpos;
  float ypos;
  
  Trail(color tempC, float tempXpos, float tempYpos) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
  }
  void display() {
    stroke(c);
    fill(c);
    ellipse(xpos, ypos, 10, 10);
  }
  
  void go() {
    if (xpos > width || ypos > height || xpos < 0 || ypos < 0) {
      xpos = width/2;
      ypos = height/2;
    }
    if(random(1) > .5) {
      xpos = xpos+random(minSpeed, maxSpeed);
    } else {
      xpos = xpos-random(minSpeed, maxSpeed);
    }
    if(random(1) > .5) {
      ypos = ypos+random(minSpeed, maxSpeed);
    } else {
      ypos = ypos-random(minSpeed, maxSpeed);
    }
  }
}
  

  


