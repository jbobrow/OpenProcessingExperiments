
color c = color(0);
float x = 0;
float y = 100;
float speed = 1;



void draw() {
  background(255,255,255,0);
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > width) {
    x = -200;
  }
}




void setup(){
  size(400,400);
  background(100);
  colorMode(RGB);
  noStroke();
}

void display() {
  
  fill(255,0,0,127);
  rect(x,100,100,200);
  fill(0,255,0,100);
  rect(x,100,200,100);
  fill(56,0,40,50);
  rect(x,100,200,200);
}


