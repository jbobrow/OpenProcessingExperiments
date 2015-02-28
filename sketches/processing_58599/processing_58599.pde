
Ball[] balls = new Ball[100];

void setup() {
  size(800,800);
  smooth();
  for(int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(width/2,height/2);
    balls[i] = new Ball(width/2 + 20,height/2 + 30);
  }
}


void draw() {
  background(255);
  for(int i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].go();
  }
}


class Ball{
  
  float x, y, vx, vy, gravity;
  
  Ball(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    vx = 3;
    vy = 3;
  }
  
  void display() {
    noStroke();
    fill(0,0,255, 50);
    ellipse(x,y,50,50);
  }
  
  void go() {
    x += vx;
    y += vy;
    
    if (vx==width){
    vx = x*y/width;
    
    if (vy==height){
      vy = y*x/height;
  }
  }
}
}

