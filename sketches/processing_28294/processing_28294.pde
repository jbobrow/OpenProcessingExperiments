
PImage [] yoshiWalk;
PImage [] yoshiSpit;
int walkFrame = 0;
int spitFrame = 0;
int backx = 0;
int yoshX = 150;
int yoshY = 375;
PImage backg;
PImage backg2;
PImage fBall;
PImage fBall2;
int fRate = 20;
int fBallX = 150;
boolean walking = true;
boolean fireball = false;
boolean fireball2 = false;
int counter = 0;

void setup() {
  size(500, 500);

  yoshiWalk = new PImage[8];
  for (int i = 0; i < yoshiWalk.length; i++) {
    yoshiWalk[i] = loadImage("YoshiWalk"+ (i+1) + ".png");
  }
  yoshiSpit = new PImage[4];
  for (int i = 0; i < yoshiSpit.length; i++) {
    yoshiSpit[i] = loadImage("YoshiTongue"+ (i+1) + ".png");
  }
  backg = loadImage("MarioTheme.png");
  backg2 = loadImage("MarioTheme.png");
  fBall = loadImage("Fireball.png");
  fBall2 = loadImage("Fireball.png");
  frameRate(fRate);
}

void draw() {
  if (walkFrame > 7) walkFrame = 0;
  if (spitFrame >3) spitFrame = 0;
  if (counter >= 3) counter = 0;

  image(backg, backx, 0, 800, 500);
  image(backg2, backx + 800, 0, 800, 500);

  if (walking == true) { //Walk and Tongue actions
    pushMatrix();
    translate(yoshX, yoshY);
    image(yoshiWalk[walkFrame], -40, -20, 60, 70);
    popMatrix();
  }
  else if (walking == false) {
    pushMatrix();
    translate(yoshX, yoshY);
    image(yoshiSpit[spitFrame], -40, -20, 60, 70);
    popMatrix();
    spitFrame++;
    counter++;
  }

  walkFrame++;
  backx-=2.5;
  if (backx ==-800) {
    backx = 0;
  }
  //println(counter);
  if (counter == 3) {
    walking = true;
  }

  if (fireball == true) { //Fireball action
    //fBallX = 150;
    image(fBall, fBallX, 375 + 5, 15, 15);
    fBallX += 10;
    if (fBallX >= width) {
      fireball = false;
      fBallX += 0;
    }
  }
}


void mousePressed() {
  walking = false;
  if (fireball == false) fireball = true;
  //if(fireball == true) fireball2 = true;
  fBallX = 150;
}


