
int x = 0;
int speed = 1;


void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(230);

  x = x + speed;

  
  if ((x > width) || (x < 0)) {
    
    speed = speed * -1;
  }
  
  if ((x > height/2)) {
    
    fill(0,255,0);
  }

  stroke(0);
  fill(255,0,0);
  ellipse(100,x,32,32);
}

