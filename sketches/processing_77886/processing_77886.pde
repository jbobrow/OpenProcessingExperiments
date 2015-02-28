
//Summer Myung
//Midterm
//October 26, 2012

int MAXBALLS = 1000;

Ball[] balls = new Ball[MAXBALLS];

int numballs = 0;

boolean produce = false;

int bg = 212 ;

PFont f;

int background_chooser = 0;



void setup() {

  background(bg);
  size(1000, 600);
  smooth();
  noStroke();
  frameRate(40);
  f = createFont ("Gill Sans Light", 20, false) ;
  smooth();
  noFill();
}

void draw() {

  background(bg); 


  if (background_chooser == 1) {
    background (255);
  }

  if (background_chooser == 2) {
    background (237, 245, 245);
  }

  if (background_chooser == 3) {
    background (220, 234, 234);
  }

  if (background_chooser == 4) {
    background (199, 219, 219);
  }

  if (background_chooser == 5) {
    background (168, 191, 190);
  }

  if (background_chooser == 6) {
    background (157, 183, 183);
  }

  if (background_chooser == 7) {
    background (157, 183, 183);
  }
  if (background_chooser == 8) {
    background (140, 167, 167);
  }
  if (background_chooser == 9) {
    background (112, 149, 149);
  }

  //instruction text

  fill(230);
  rect(0, 550, 1000, 100);
  textFont (f);
  fill(120);
  text  ("Hit Spacebar to clear", 342, 582);
  textFont (f);
  fill(255);
  text  ("Hit Spacebar to clear", 340, 580);
  textFont (f);
  fill(120);
  text  ("Click Mouse to create balls", 52, 582);
  textFont (f);
  fill(255);
  text  ("Click Mouse to create balls", 50, 580);
  textFont (f);
  fill(120);
  text  ("Hit numbers to change the Background", 582, 582);
  textFont (f);
  fill(255);
  text  ("Hit numbers to change the Background", 580, 580);



  if (produce) {

    boolean done = makeNewBall();
  }


  for (int i = 0; i< numballs; i++) {
    balls[i].moveBall();
    balls[i].bounceBall();
    balls[i].colorBall();
  }


  for (int i = 0; i< numballs; i++) {
    balls[i].drawBall();
  }
}



void mousePressed() {
  produce = true;
}

void mouseReleased() {
  produce = false;
}

boolean makeNewBall() {



  if (numballs == MAXBALLS - 1) return false;


  float xspeed = random(1, 5);
  float yspeed = random(1, 5);


  if (random(10) > 5) {
    xspeed *= -1;
  }
  if (random(10) > 5) {
    yspeed *= -1;
  }

  float w = 15 + random(25);
  float h = w;


  balls[numballs] = new Ball(mouseX, mouseY, xspeed, yspeed, w, h);
  numballs++;

  return true;
}

class Ball {
  float x;
  float y;
  color c;
  float xspeed;
  float yspeed;
  boolean hitedge = false;
  float w, h;


  Ball(float x_, float y_, float xspeed_, float yspeed_, float w_, float h_) {
    x = x_;
    y = y_;
    c = color(random(245), random(219), random (116), 85);

    xspeed = xspeed_;
    yspeed = yspeed_;
    w = w_;
    h = h_;
  }


  void drawBall() {
    fill(c);
    noStroke();
    ellipse(x, y, w, h);
  }

  void colorBall() {
    float ballR, ballG, ballB;
      if (hitedge) {
        hitedge = false;
        if (random(10) > 8) {
          ballR = random(180);
          ballG = random(120);
          ballB = random(112);

          c = color(ballR, ballG, ballB);
        }
        else {
          c = color(random(180), random(120), random(112));
      }
    }
  }

  void bounceBall() {
    if (x > width || x < 0) {
      xspeed = xspeed * -1;
      hitedge = true;
    }
    if (y > height || y < 0) {
      yspeed = yspeed * -1;
      hitedge = true;
    }
  }

  void moveBall() {
    x = x + xspeed;
    y = y + yspeed;
  }
}

void keyPressed() {

  if (key == ' ') {
    background(bg);
    numballs = 0;
  }
  if (key == '1') {
    background_chooser = 1;
  }
  if (key == '2') {
    background_chooser = 2;
  }

  if (key == '3') {
    background_chooser = 3;
  }

  if (key == '4') {
    background_chooser = 4;
  }

  if (key == '5') {
    background_chooser = 5;
  }

  if (key == '6') {
    background_chooser = 6;
  }

  if (key == '7') {
    background_chooser = 7;
  }

  if (key == '8') {
    background_chooser = 8;
  }

  if (key == '9') {
    background_chooser = 9;
  }
}
