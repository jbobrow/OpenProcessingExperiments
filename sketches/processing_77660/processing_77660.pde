
/*Steven Ko
 suyunk@andrew.cmu.edu
 copyright ©  Steven Ko || OCT 2012 Pittsburgh PA 15213 All Rights Reserved
 */


ArrayList<FieldVectors> vectors;
Ball invisiBall;
Ball distractBall1;
Ball distractBall2;
Ball distractBall3;

avoidRect avoidR;
avoidRect avoidR1;
avoidRect avoidR2;

float x, y, centerx, centery, prox;
int clockx, clocky;
int score;
int screenPhase, titleScreen;




void setup() {
  size (600, 600);
  background (255);
  noCursor();
  smooth();
  prox = 35;


  screenPhase = 1;

  invisiBall = new Ball ();
  distractBall1 = new Ball ();
  distractBall2 = new Ball ();
  distractBall3 = new Ball ();
  
  avoidR = new avoidRect ();
  avoidR1 = new avoidRect ();
  avoidR2 = new avoidRect ();

  vectors = new ArrayList<FieldVectors>();
  for ( int i = 0; i < width; i +=25 ) {
    for ( int j = 0; j < height; j += 25) {
      vectors.add (new FieldVectors (new PVector (i, j)));
    }
  }
}

void draw() {
  background (255);

  if (screenPhase == 1) {
    titleScreen();
  }
  if (screenPhase ==2) {

    invisiBall.drive();
    distractBall1.drive();
    distractBall2.drive();
    distractBall3.drive();

    invisiBall.display();
    distractBall1.display();
    distractBall2.display();
    distractBall3.display();
    
    avoidR.display();
    avoidR1.display();
    avoidR2.display();
    
    avoidR.collision();
    avoidR1.collision();
    avoidR2.collision();

    collisionInvisiball();

    for (FieldVectors vp : vectors) {
      vp.display();

      clockScore();
      mouse();
    }
  }
  if (screenPhase == 3) {
    endScreen();
  }
  if (screenPhase == 4) {
    loseScreen();
  }
}

//////////////////////////////////////////////////////////////

void mouse() {
  fill (0, 255, 255);
  ellipse(mouseX, mouseY, 15, 15);
}

//////////////////////////////////////////////////////////////

void titleScreen () {
  noStroke();
  fill (0, 50);
  textAlign (CENTER);
  textSize (60);
  text("Invisi-ball", width/2, height/2);

  fill (255);
  textAlign (CENTER);
  textSize (60);
  text("Invisi-ball", width/2-2, height/2-3);    

  fill (50);
  textSize (15);
  text("\n\n catch 10 invisible balls to win!", width/2, height/2);

  fill (255, 0, 0);
  textSize (15);
  text ("\n\n\n avoid the red obstacles!", width/2, height/2);

  fill (255, 255, 0);
  rectMode (CENTER);
  rect (width/2, height/2+246, 250, 15);
  fill (0, 150);
  textSize (15);
  text("press 'space' to start", width/2, height/2+250);
}
//////////////////////////////////////////////////////////////

void endScreen() {
  fill(255);
  noStroke();
  rect(width/2, height/2, width, height);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
  textSize(20);
  text("\n You Win!" + "\n press 'space' to restart" , width/2, height/2+20);
  
}


//////////////////////////////////////////////////////////////

void loseScreen() {
  fill(255);
  noStroke();
  rect(width/2, height/2, width, height);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
  textSize(20);
  text("\n You Lose!" + "\n press 'space' to restart" , width/2, height/2+20);
}


//////////////////////////////////////////////////////////////

void clockScore() {
  //clock

  clockx = 60;
  clocky = height/32;
  noStroke();
  rectMode(CENTER);         //background rectangle
  fill(255, 255, 0);
  rect(clockx, clocky -4, 120, 18); 
  textAlign(CENTER);
  textSize(12);
  fill(0);
  text("time played : " + millis()/1000, clockx, clocky);


  //score
  fill (255, 255, 0);
  rect(clockx, clocky +21, 120, 18);     //background rectangle
  textAlign (CENTER);
  fill(0);
  text("score : " +score, clockx, clocky +25);
  if (score == 100) {
    screenPhase = 3;
    score = 0;
  }
}

//////////////////////////////////////////////////////////////

void collisionInvisiball() {
  float c = dist(mouseX, mouseY, x, y);
  if (c < prox) {
    score += 1;
  }
}
//////////////////////////////////////////////////////////////

class avoidRect {
  color b;
  float centerx, centery, ease;

  avoidRect() {
    centerx = random(width);
    centery = random(height);
    ease = random (.05);
  }

  void display() {
    centerx = centerx + (mouseX - centerx)* ease;
    centery = centery + (mouseY - centery)* ease;
    fill (255, 0, 0);
    rect(centerx, centery, 12, 12);
  }
  void collision() {
    if (dist(mouseX, mouseY, centerx, centery)< 15) {
      screenPhase = 4;
      score = 0;
    }
  }
}

//////////////////////////////////////////////////////////////

class Ball {
  color c;

  float xvelocity;
  float yvelocity;
  float radiusBall;

  Ball () {

    c = (255);
    x = 15;
    y = 30;

    xvelocity = random (5, 8);
    yvelocity = random (5, 8);
  }

  void display () {
    ellipseMode (CENTER);
    noStroke();
    fill (c);
    ellipse (x, y, 10, 10);
  }

  void drive () {

    x += xvelocity;
    y += yvelocity;


    float r = radiusBall/2;

    if (x <= r || x >= width - r) {
      xvelocity = -xvelocity;
    }

    if (y <= r || y >= height - r) {
      yvelocity = -yvelocity;
    }
  }
}


//////////////////////////////////////////////////////


class FieldVectors {

  PVector pos;
  PVector loc1;
  PVector loc2;

  int _degrees;

  FieldVectors (PVector pos) {
    this.pos = pos;
  }

  void display() {
    configArrow();
    drawArrow();
  }


  void configArrow() {
    initDegrees();
    setCoordinates();
  }

  void drawArrow() {
    drawArrowLine();
  }

  void drawArrowLine() {
    stroke (0);
    strokeWeight(2);
    line (loc1.x, loc1.y, loc2.x, loc2.y);
  }

  void setCoordinates() {
    loc1 = getPosFromDegrees (_degrees, 10);
    loc2 = getPosFromDegrees (_degrees+180, 10);
  }

  void initDegrees() {
    getAngle ();
    adjustDegrees();
  }

  void getAngle() {
    float opposite = (pos.y + 10 -y);
    float adjacent = (pos.x + 10 - x);
    float hypotenuse = sqrt ((opposite*opposite) + (adjacent *adjacent));
    float radianValue = acos (adjacent/hypotenuse);
    _degrees = int (abs (degrees(radianValue)));
  }

  PVector getPosFromDegrees(int _degrees, int _radius) {
    float coordinate_x = ((pos.x + 10) + cos(radians(_degrees))*_radius);
    float coordinate_y = ((pos.y + 10) + sin(radians(_degrees))*_radius);
    return new PVector(coordinate_x, coordinate_y);
  }

  void adjustDegrees() {
    if (pos.x+40 <= x && pos.y+40 <= y) {
      _degrees = 180 - _degrees;
    }
    if (pos.x+40 <= x && pos.y+40 > y) {
      _degrees = 180 + _degrees;
    }   
    if (pos.x+40 > x && pos.y+40 <= y) {
      _degrees = - _degrees + 180;
    }   
    if (pos.x+40 > x && pos.y+40 > y) {
      _degrees = _degrees - 180;
    }
  }
}

void keyPressed () {
  if (key == ' ') {
    screenPhase = 2;
  }
}



