
float px = 200;
float py = 150;
float vx = random(-4, 4);
float vy = 2;
int sz  = 20;
float gravity = 0.8;
float friction = 0.9;


void setup() {
  size(400, 300);
}

void draw() {
  background(0);

  //if(vy>0.1){
  px = px + vx;
  // }
  vy = vy + gravity;
  py = py + vy;


  if (py > height) {
    vy = vy * -1; 
    py = height;
    vy = vy * friction;
    vx = vx * friction;
  }

  if (px<0 || px>width) {
    vx = -vx;
  }

  ellipse(px, py, sz, sz);
}
