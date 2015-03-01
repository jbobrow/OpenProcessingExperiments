
boolean alive;
float canX, canY;
float tankX, tankY;
int angle;
float hX, hY;
float bX, bY;

float gravity = 0;
float gravitySpeed = 0.006;
float playerX = 150;
float playerY = 500;
float power = 0;
float bulletSpeedX = 0;
float bulletSpeedY = 0;
float bulletX;
float bulletY;
Boolean Bullet = false;
Boolean charging = false;

class target {
  float aVX;
  float aVY;
  float aX, aY;
  boolean alive;

  target(float tarX, float tarY) {

    aX= tarX;
    aY=tarY;
    aVX=0;
    aVY=0;
    alive= true;
  }

  void drawTarget() {
    pushMatrix();


    stroke(0);
    fill(255);
    rect(aX-5, aY, 10, 100);
    fill(33, 179, 255);
    ellipse(aX, aY, 60, 60);
    fill(252, 0, 0);
    ellipse(aX, aY, 35, 35);
    fill(250, 230, 10);
    ellipse(aX, aY, 15, 15);

    popMatrix();
  }
  void update(float time) {
    aX+= time*aVX;
    aY+= time*aVY;
  }
}

target[] Target;
target[] Target2;
target[] Target3;
target[] Target4;
target[] Target5;

int numTar;

class cannonball {
  float cbX, cbY;
  float bVX, bVY;
  boolean ball;

  cannonball(float ballX, float ballY) {

    bX=ballX;
    bY= ballY;
    bVX= 4;
    bVY = -2;
    ball = true;
  }

  void drawCannonball() {
    pushMatrix();
    translate(bX, bY);
    rotate(radians(45));
    stroke(232, 43, 26);
    fill(232, 43, 26);
    strokeWeight(5);
    rect(bX, bY-25, 1, 20);
    fill(0);
    stroke(0);
    ellipse(bX, bY, 27, 27);
    strokeJoin(ROUND);
    stroke(0);
    strokeWeight(2);
    ellipse(bX, bY-12, 12, 12);
    strokeWeight(5);

    popMatrix();
  }

  void update(float time) {


    bX+= time*bVX;
    bY+= time*bVY;
  }
}



class cannon {

  float canVX, canVY;
  boolean cannon;

  cannon(float cX, float cY) {

    canX=cX;
    canY=cY;
    canVX=0;
    canVY=0;
    cannon=false;
  }

  void drawCannon() {
    pushMatrix();
    translate(canX, canY);
    rotate(radians(angle));
    fill(22, 139, 41);
    strokeJoin(ROUND);
    strokeWeight(3);
    stroke(0);
    //turret
    rect(120, 355, 180, 20);
    rect(300, 340, 52, 52);
    popMatrix();
  }

  void update(float time) {

    canX+= time*canVX;
    canY+= time*canVY;
  }
}


void keyPressed() {

  if (keyCode==DOWN) {
    if (canY<=300 && tankY<=300) {
      canY+=10;
      tankY+=10;
    }
  }

  if (keyCode==UP) {
    if (canY>=0 && tankY>=0) {
      canY-=10;
      tankY-=10;
    }
  }

  if (key=='d') {
    if ( canX<=400 && tankX<=400 ) {
      canX+=10;
      tankX+=10;
      bulletX+=30;
    }
  }
  if (key=='a') {
    canX-=10;
    tankX-=10;
    bulletX-=30;
  }
  if (key=='w' && angle>=-10) {
    angle-=1;

    bulletY+=20;
  }

  if (key=='s' && angle<=2) {

    angle+=1;
    bulletY-=20;
  }
}

class tank {
  float tankVX, tankVY;
  boolean roll;

  /* constructor */
  tank(float tX, float tY) {
    tankX=tX;
    tankY=tY;
    tankVX = 0;
    tankVY = 0;
    roll=false;
  }

  /*Draw method */
  void drawTank() {
    pushMatrix();
    pushMatrix();
    translate(tankX, tankY);
    fill(22, 139, 41);

    strokeJoin(ROUND);
    strokeWeight(3);
    stroke(0);
    //body
    rect(135, 310, 35, 15);
    strokeWeight(2);
    rect(100, 325, 100, 75);
    strokeWeight(15);
    stroke(22, 139, 41);
    rect(75, 395, 200, 40);
    //tire
    noFill();
    stroke(0);
    strokeWeight(0);
    fill(102, 102, 102);
    ellipse(170, 440, 220, 75);
    fill(24, 49, 16);
    ellipse(170, 440, 200, 60);
    //actual tires
    fill(102, 102, 102);
    ellipse(100, 440, 40, 40);
    fill(192, 192, 192);
    ellipse(100, 440, 30, 30);
    fill(102, 102, 102);
    ellipse(145, 440, 50, 50);
    fill(192, 192, 192);
    ellipse(145, 440, 40, 40);
    fill(102, 102, 102);
    ellipse(195, 440, 50, 50);
    fill(192, 192, 192);
    ellipse(195, 440, 40, 40);
    fill(102, 102, 102);
    ellipse(240, 440, 40, 40);
    fill(192, 192, 192);
    ellipse(240, 440, 30, 30);


    popMatrix();

    popMatrix();
  }

  /*animation method*/
  void update(float time) {
    tankX+= time*tankVX;
    tankY+= time*tankVY;
  }
  /*end of class */
}

tank[] Tank;
int numT;
cannon[] Cannon;
int numC;
cannonball[] Cannonball;
int numB;




void drawClouds(float cx, float cy) {
  pushMatrix();

  translate(cx, cy);
  fill(255);
  stroke(255);
  ellipse(205, 150, 65, 65);
  ellipse(225, 130, 65, 65);
  ellipse(245, 110, 65, 65);
  ellipse(265, 130, 65, 65);
  ellipse(285, 150, 65, 65);
  ellipse(245, 110, 65, 65);
  ellipse(245, 150, 65, 65);
  popMatrix();
}


void drawTrench(float hX, float hY) {


  fill(0);
  stroke(0);
  strokeWeight(2);
  rect(hX+10, hY+50, 190, 400);
  fill(124, 79, 6);
  rect(hX, hY, 200, 50);
  rect(hX, hY, 10, 500);
  rect(hX+200, hY, 10, 500);
  rect(hX+10, hY+30, 190, 50);
  fill(88, 41, 37);
  rect(hX+10, hY+50, 190, 400);
}



void setup() {
  size(1200, 800);
  angle=0;
  numT=1;
  numC=1;
  numB=1;
  numTar=5;


  Cannon = new cannon[numC];

  Target = new target[numTar];
  Target2 = new target[numTar];
  Target3 = new target[numTar];
  Target4 = new target[numTar];
  Target5 = new target[numTar];

  Tank= new tank[numT];

  Cannonball= new cannonball[numB];

  for (int i=0; i<numTar; i++) {

    Target[i] = new target((900), (500));
    Target2[i] = new target((920), (340));
    Target3[i] = new target((940), (670));
    Target4[i] = new target((800), (400));
    Target5[i] = new target((790), (640));
  }

  for (int i=0; i<numB; i++) {
    Cannonball[i] = new cannonball(277, 220);
  }

  for (int i=0; i<numT; i++) {
    Tank[i] = new tank(0, 200);
  }

  for (int i=0; i<numC; i++) {
    Cannon[i] = new cannon(0, 200);
  }
}



void draw() {
  int cx=0;
  int cy=-65;
  background(15, 156, 183);

  drawTrench(750, 350);

  for (int j=0; j<2; j++) {
    cx=0;

    for (int h=0; h<5; h++) {
      drawClouds(cx, cy);
      cx+= 205;
    }

    cy+=120;


    for (int i=0; i<numTar; i++) {
      Target[i].drawTarget();
      Target[i].update(.5);

      Target2[i].drawTarget();
      Target2[i].update(.5);

      Target3[i].drawTarget();
      Target3[i].update(.5);

      Target4[i].drawTarget();
      Target4[i].update(.5);

      Target5[i].drawTarget();
      Target5[i].update(.5);
    }


    for (int i=0; i<numC; i++) {
      Cannon[i].drawCannon();
      Cannon[i].update(0.5);
    }
    for (int i=0; i<numT; i++) {
      Tank[i].drawTank();
      Tank[i].update(0.5);


      float dx = mouseX - playerX;
      float dy = mouseY - playerY;

      float angle = atan2(dy, dx);


      if (mousePressed) {
        charging = true;

        power+=.75;
      } else {
        if (charging) {

          
          bulletSpeedX = cos(angle) * power;
          bulletSpeedY = sin(angle) *power;

          
          bulletX = 160;
          bulletY = 280;

          Bullet = true;

          charging = false;
          power =0;
        }
      }

      if (Bullet) {

        gravity += .2;
        bulletSpeedY += 1; 

        bulletX += bulletSpeedX;
        bulletY += bulletSpeedY;


        pushMatrix();
        translate(bulletX, bulletY);
        stroke(232, 43, 26);
        fill(232, 43, 26);
        strokeWeight(5);
        rect(bulletX, bulletY-25, 1, 20);
        fill(0);
        stroke(0);
        ellipse(bulletX, bulletY, 27, 27);
        strokeJoin(ROUND);
        stroke(0);
        strokeWeight(2);
        ellipse(bulletX, bulletY-12, 12, 12);
        strokeWeight(5);

        popMatrix();
      }
    }
  }
}




