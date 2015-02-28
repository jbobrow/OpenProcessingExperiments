
Circle ball;

boolean animate = true;

void setup() {
  size(400, 500);
  smooth();
  ball = new Circle();
}


void draw () {
  background(64);
  ball.move();
  ball.display(); 
  if (animate == true) {
    fill(200, 40, 20);
  }
  else { 
    fill(50, 20, 200);
  }
  rect(260, 50, 80, 80);
}


void mousePressed() { 
  if ( mouseX > 260 && mouseX < (260+80) && mouseY > 50 && mouseY < (50+80)) {
    // toggle the value of on
    // in other words, if on == true, then on becomes not true (false) and
    // vice versa
    animate = !animate; // on = (not)on
  }
}

class Circle {

  float speed;
  float gravity;
  float xpos;
  float ypos ;
  float dimensions;

  Circle () {
    speed = 0;
    gravity = 0.1;
    xpos = width/4;
    ypos = -100;
    dimensions = 50;
  }

  void display () {
    ellipse (xpos, ypos, dimensions, dimensions);
  }
  void move() {
    if (animate == true) {
      ypos = ypos + speed;
      speed = speed + gravity;
      if (ypos >= height-120) {
        // reduce the speed on every bounce to make it more
        // realistic.. try -1 and see what happens
        speed *= -0.9;
      }
    }
  }
}


