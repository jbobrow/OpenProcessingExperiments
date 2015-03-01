
//With great help from Sanchez's youtube channel

//Declaring
ball [] bumchas = new ball[200];


void setup() {
  size(600, 600);
  smooth();

  //Initializing
  for (int i = 0; i < 200; i++) {
    bumchas[i] = new ball (random(0, width), random(0, height));
  }
}


void draw() {
  background(0);

  //function call
  for (int i = 0; i < 200; i++) {
    bumchas[i].run();
  }
}


class ball {
  //global variables
  float x = 0;
  float y = 0;
  float speedX = 4;
  float speedY = -0.5;


  ball(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void run() {
    update();
    move();
    bounce();
    gravity();
  }
  void gravity() {
    speedY += 0.1;
  }
  void bounce() {
    if (x > width) {
      speedX = speedX * -1;
    }
    if (x < 0) {
      speedX = speedX * -1;
    }
    if (y > height) {
      speedY = speedY * -1;
    }
    if (y < 0) {
      speedY = speedY * -1;
    }
  }
  void move() {
    x = x+speedX;
    y = y+speedY;
  }


  void update() {
    //The body on my lolo
    strokeWeight(6);
    stroke(0);
    fill(255);
    //fill(100, 170, 250);
    ellipse(x, y, 50, 50);

    
  }
}



