
float px = 200;
float py = 150;
float vx = random(-4, 4);
float vy = 0;
int sz  = 50;
float gravity = 0.8;
float friction = 0.8;


void setup() {
  size(400, 300);
  rectMode(CENTER);
}

void draw() {
  background(0);

  if(dist(mouseX,mouseY,px,py)<sz/2 && !mousePressed){
    px=mouseX;
    py=mouseY;
         vx=random(-4,4);
         fill(255,0,0);
      rect(px, py, sz, sz);

  } else {

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
         fill(0,255,0);
  ellipse(px, py, sz, sz);
  }
}
