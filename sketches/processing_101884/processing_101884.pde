
float time = 0;
float speed = 0;

void setup() {
  size (500, 500);
  translate(250, 250);
}

void draw() {
  translate(250, 250);
  background(250);
  for (int i = 0; i < 20; i++) {
    rotate(time);
    noFill();
    rect(i, i, i*5, i*5);
    
  }
  time = time + speed;
  speed = map(mouseX, 0, width, -0.01, 0.01);
  
}
