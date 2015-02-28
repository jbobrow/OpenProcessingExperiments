

Ball[] balls = new Ball[25];

boolean animate = true;


int btnX = 260;
int btnY = 50;
int btnW = 80;
int btnH = 80;





void setup() {
  size(400, 500);
  smooth();

  for (int i=0; i<25; i++)
    balls[i]= new Ball(2*i, .01*i, width/28*i);
}


void draw () {
  background(64);
  for (int i=0; i<25; i++) {
    balls[i].move();
    balls[i].display();
  }
  if (animate == true) {
    fill(200, 100, 20);
  }
  else { 
    fill(100, 20, 20);
  }
  rect(btnX, btnY, btnW, btnH);
}


void mousePressed() {
  if ( mouseX > btnX && mouseX < (btnX+btnW) && mouseY > btnY && mouseY < (btnY+btnH)) {
    
    animate = !animate;   // on = (not)on
  }
}

class Ball {

  float speed;
  float gravity;
  float xpos;
  float ypos ;
  float dimensions; 

  Ball (float dimensions2, float speed2, float xpos2) {
    speed = 1;
    gravity = speed2;
    xpos = xpos2;
    ypos = -100;
    dimensions = dimensions2;
  }

  void display () {
    ellipse (xpos, ypos, dimensions, dimensions);
  }
  
  void move() {
    if (animate == true) {
      ypos = ypos + speed;
      speed = speed + gravity;
      if (ypos > height-130) {
        speed *= -0.6; 
        ypos = height-130; // resets ball position so it doesnt get stuck
      }
    }
  }
}









