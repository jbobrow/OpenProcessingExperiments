
Ball[] balls = new Ball[400];
void setup() {
  size(640, 480);
  smooth();
  for (int i=0; i<balls.length; i++) {
    balls[i] = new Ball(random(width), random(height));
  }
  noStroke();
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height); 

  for (int i=0; i<balls.length; i++) {
    balls[i].run();
  }
}

class Ball {
  float xpos, ypos;
  float xspeed, yspeed;

  Ball(float x, float y) {
    xpos = x;
    ypos = y;
    xspeed = random(-4, 4);
    yspeed = random(-4, 4);
  } 
  void run() {
    display();
    update();
    checkWalls();
  }

  void display() {
    fill(255);
    ellipse(xpos, ypos, 10, 10);
  }
  void update() {
    xpos += xspeed;
    ypos += yspeed;
  }
  void checkWalls() {
    if (xpos >= width-5 || xpos <= 5) {
      xspeed *= -1;
    }
    else if (ypos >=height-5 || ypos <=5) {
      yspeed *= -1;
    }
  }
}


