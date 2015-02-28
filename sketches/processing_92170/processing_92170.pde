
float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float[100];
PImage ship;
int shipY = 85;
int shipX = 110;

void setup() {
  size(1000, 800);
  background(0);
  ship = loadImage("rocketShip.png");
  stroke(255);
  strokeWeight(5);
  noCursor();
  drawStars();
}

void draw() {
  background(7, 39, 64);
  imageMode(CENTER);
  noFill();
  noStroke();

  moveStars();
  spaceShip();
  moveShip();
}

//draw stars

void drawStars() {
  for (int i = 0;i < 100; i++) {  
    x[i] = random(0, width);
    y[i] = random(0, height);
    speed[i] = random(1, 5);
  }
}

//move stars
void moveStars() {
  for (int i = 0;i < 100; i++) {
    float co = map(speed[i], 1, 5, 100, 255);
    stroke(co);
    strokeWeight(speed[i]);
    point(x[i], y[i]);

    x[i] = x[i] - speed[i];
    if (x[i] < 0) {
      x[i] = width;
    }
  }
}

//draws spaceship
void spaceShip() {
  image(ship, shipX, shipY, 134, 100);
}

//move spaceship w/ mouse
void moveShip() {
  shipY = constrain(mouseY, 60, 710);
  shipX = constrain(mouseX, 67, 400);
}

//draw bullet
void bullet() {
  float bulletX = shipX;
  float bulletY = shipY;
  fill(255);
  rect(bulletX+46, bulletY, 15, 3);
}

/*
//move bullet *** NEED HELP WITH THIS ***
 void moveBullet() {
 float bulletX = shipX;
 float bulletY = shipY;
 new bullet();
 }
 //(call display bullet, and feed it x and y and incriment x to move it) {
/*
 void score(){
 if (bullet hits obect, increase score by 10)
 if score is over 50, increase speed and rate of objects
 */


void mousePressed() {
  bullet();
  //moveBullet();
}



