
int y;
int x;
float z;
float t;
float a;
float c;
int speed=3;
void setup() {
  size(500, 500);
  background(color(255, 255, 255));
  
}

void draw() {
  z = random(255);
  t = random(255);
  a = random(255);
  c = random(20);
  x = y+0;
  y = x+speed;
  background(0);
  fill(z, t, a);
  ellipse(250, y, 10, 10);
  if(y>499) {
    y=speed;
    fill(255);
    ellipse(250, y, c, c);
   
  
  }
  {
  if(y>490){
     speed = -speed;
  
}
if(y<0){
  speed = -speed;
}

  }
}
