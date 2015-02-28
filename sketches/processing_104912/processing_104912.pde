

float y = 0;
float speed = 1;
float g=0.1;

void setup() {
  size(400,400);
  smooth();
}

void draw() {
  background(255);
  y = y + speed;
  speed=speed+g;
  

  if ((y > height) || (y < 0)) {
    speed = speed * -0.96;
  }

 
  fill(150);
  ellipse(200,y,50,50);
}






