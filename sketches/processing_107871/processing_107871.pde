
/* @pjs preload="spacebg.jpg"; */
PImage img;
boolean boundryTop, boundryBottom, keyleft, keyright, keyup, keydown, shoot;
int shipX, shipY, ufoX, ufoY;

void setup() {
  size(924, 650);
  img = loadImage("spacebg.jpg");
  shoot = false;
  shipX = 0;
  shipY = 0;
  ufoX = 0;
  ufoY = 0;
}

void draw() {
  if (keyleft && shipX > -550) {
    shipX -= 5;
  }
  if (keyright && shipX < 100) {
    shipX += 5;
  }
  if (keyup && shipY > -350) {
    shipY -= 5;
  }
  if (keydown && shipY < 200) {
    shipY += 5;
  }
  image(img, 0, 0);
  noStroke();
  ellipseMode(CORNER);
  spaceShip();
  UFO();
  if (shoot)
    laser();
}

void spaceShip() {
  rect(600+shipX, 400+shipY, 200, 50);
  arc(550+shipX, 400+shipY, 100, 100, radians(-180), radians(-90));
  fill(#505050);
  triangle(750+shipX, 400+shipY, 800+shipX, 350+shipY, 800+shipX, 400+shipY);
  arc(800+shipX, 400+shipY, 50, 50, radians(-270), radians(-90));
  if ( keyup || keydown || keyleft || keyright ) {
    fill(#ff5c23);
    triangle(825+shipX, 425+shipY, 875+shipX, 400+shipY, 875+shipX, 450+shipY);
    fill(#ff9a23);
    triangle(825+shipX, 425+shipY, 850+shipX, 410+shipY, 850+shipX, 440+shipY);
  }
}

void UFO() {
  fill(#b9b9b9);
  ellipse(100, 25+ufoY, 150, 50);
  fill(255);
  arc(135, ufoY, 80, 80, radians(-180), radians(0));
  if ( ufoY < 25 ) {
    boundryBottom = false;
    boundryTop = true;
  }
  else if ( ufoY > 550 ) {
    boundryBottom = true;
    boundryTop = false;
  }
  if (boundryTop) {
    ufoY += 5;
  }
  else if (boundryBottom) {
    ufoY -= 5;
  }
}

void laser() {
  stroke(#60fb23);
  line( 560+shipX, 420+shipY, 200, ufoY+30 );
}

void keyPressed() {
  if (key == ' ') {
    shoot = true;
  }
  if (key == CODED) {
    if (keyCode == UP) keyup = true; 
    if (keyCode == DOWN) keydown = true; 
    if (keyCode == LEFT) keyleft = true; 
    if (keyCode == RIGHT) keyright = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    shoot = false;
  }
  if (key == CODED) {
    if (keyCode == UP) keyup = false; 
    if (keyCode == DOWN) keydown = false; 
    if (keyCode == LEFT) keyleft = false; 
    if (keyCode == RIGHT) keyright = false;
  }
}

