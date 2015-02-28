
// Two ball variables
int numBalls = 20;
Ball[] balls = new Ball[numBalls];

void setup() {
  size(800, 600);
  smooth();

  //int balls
  for (int i = 0; i< numBalls; i++)
    balls[i] = new Ball((int)random(6, 32));
}

void draw() {
  background(220);
  for (int i = 0; i< numBalls; i++) {
    balls[i].move();
    balls[i].display();

    for ( int j = 0; j<numBalls; j++) { //start of collision detection
      if( balls[i].ball_A()<60 || balls[j].ball_A()<60)
      if ( collision(i, j) ) {
        //println("boom");
        balls[i].set_r(balls[i].get_r() + (int)sqrt(balls[j].get_r()) ); 
        balls[j] = new Ball((int)random(6, 32));
      }
    }

    if (balls[i].ball_A() <= 15)
      balls[i] = new Ball((int)random(6, 32));
  }
}

boolean collision(int ballA, int ballB) {
  if ( ballA == ballB)
    return false;

  float yA = balls[ballA].get_y();
  float xA = balls[ballA].get_x();
  float yB = balls[ballB].get_y();
  float xB = balls[ballB].get_x(); 
  float d = sqrt((yA-yB) * (yA-yB) + (xA-xB) * (xA-xB));
  //println(d);
  if (d < (balls[ballA].get_r() + balls[ballB].get_r()) ) 
    return true;
  else
    return false;
}

//This class is based of learningprocessing.com/examples/chapter-10/example-10-2/ and has been heavily modified
class Ball {
  int r;  
  float x, y; 
  float dx, dy;
  int R, G, B, A;


  Ball(int temp) {
    r = temp;
    dx = random(60)/(r+10) + 0.5; //speed
    dy = random(60)/(r+10) + 0.5;
    x = random(width - 2*r) + r;
    y = random(height - 2*r) + r;
    R = (int)random(255); 
    G = (int)random(255); 
    B = (int)random(255); 
    A = (int)random(60, 180);
  }

void set_r(int tempR) {
  r = tempR;
}
  float get_x() { 
    return x;
  }

  float get_y() {
    return y;
  }

  int get_r() {
    return r;
  }

  int ball_A() {
    return A;
  }

  void move() {
    x += dx;
    y += dy;

    //check bounds
    if ( (x + r) > width || (x - r) < 0) {
      dx *= - 1;
      if (A>15)
        A -= 15;
    }

    if ( (y + r) > height || (y - r) < 0) {
      dy *= - 1;
      if (A>15)
        A -= 15;
    }
  }

  void display() {
    stroke(0, 60);
    fill(R, G, B, A);

    ellipse(x, y, r*2, r*2);
  }
}


