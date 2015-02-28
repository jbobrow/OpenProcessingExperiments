
int gameState;
PImage levelMap;

int p1Width, p2Width;
int p1Height, p2Height;

int xPos1, xPos2;
int yPos1, yPos2;

int xScore1, xScore2;
int yScore1, yScore2;

float playerSpeed;

int fieldBuffer;

boolean upPressed1;
boolean downPressed1;
boolean leftPressed1;
boolean rightPressed1;

boolean upPressed2;
boolean downPressed2;
boolean leftPressed2;
boolean rightPressed2;

float s1get;
float s2get;

boolean score1get=false;
boolean score2get=false;

void setup() {
  imageMode(CENTER);
  size (700, 700);

  playerSpeed=3;

  fieldBuffer=5;

  gameState=1;
}

void draw() {

  //Gamestates

  if (gameState==1) {
    setup1();
    gameState++;
  }
if(gameState==3){
setup2();
  gameState++;
 }
 if(gameState==5){
   setup3();
   gameState++;
 }
  if (dist(xPos1, yPos1, xScore1, yScore1) < 15) {
    score1get=true;
//    s1get=millis();
  }

  if (dist(xPos2, yPos2, xScore2, yScore2) < 15) {
    score2get=true;
//    s2get=millis();
  }

    if (score1get==true && score2get==true) {
      gameState++;
    }

  background(255);
  image(levelMap, width/2, height/2);

  stroke(0);
  fill(255, 0, 0);
  rect(xPos1, yPos1, p1Width, p1Height);
  noStroke();
  ellipse(xScore1, yScore1, p1Width, p1Height);

  stroke(0);
  fill(0, 0, 255);
  rect(xPos2, yPos2, p2Width, p2Height);
  noStroke();
  ellipse(xScore2, yScore2, p1Width, p1Height);


  //THE  PLAYER COLLISION FIELDS-----------

  for (int l=yPos1;l<(yPos1+p1Height);l++) {
    color colorL=get(xPos1-fieldBuffer, l);

    if ( colorL==#000000) {
      leftPressed1=false;
    }
  }

  for (int r=yPos1;r<(yPos1+p1Height);r++) {
    color colorR=get(xPos1+p1Width+fieldBuffer, r);

    if ( colorR==#000000) {
      rightPressed1=false;
    }
  }

  for (int u=xPos1;u<(xPos1+p1Width);u++) {
    color colorU=get(u, yPos1-fieldBuffer);

    if ( colorU==#000000) {
      upPressed1=false;
    }
  }

  for (int d=xPos1;d<(xPos1+p1Width);d++) {
    color colorD=get(d, yPos1+p1Height+fieldBuffer);

    if ( colorD==#000000) {
      downPressed1=false;
    }
  }

  //MIRROR FIELD CONTROLS

  for (int l2=yPos2;l2<(yPos2+p2Height);l2++) {
    color colorL2=get(xPos2-fieldBuffer, l2);

    if ( colorL2==#000000) {
      leftPressed2=false;
    }
  }

  for (int r2=yPos2;r2<(yPos2+p2Height);r2++) {
    color colorR2=get(xPos2+p2Width+fieldBuffer, r2);

    if ( colorR2==#000000) {
      rightPressed2=false;
    }
  }

  for (int u2=xPos2;u2<(xPos2+p2Width);u2++) {
    color colorU2=get(u2, yPos2-fieldBuffer);

    if ( colorU2==#000000) {
      //upPressed2=false;
      downPressed2=false;
    }
  }

  for (int d2=xPos2;d2<(xPos2+p2Width);d2++) {
    color colorD2=get(d2, yPos2+p2Height+fieldBuffer);

    if ( colorD2==#000000) {
      //downPressed2=false;
      upPressed2=false;
    }
  }




  //--------------------


  // DEBUG 

 
    println(mouseX);
    println(mouseY);


  //Player controls

  if (upPressed1==true) {
    yPos1-=playerSpeed;
  }
  if (downPressed1==true) {
    yPos1+=playerSpeed;
  }

  if (leftPressed1==true) {
    xPos1-=playerSpeed;
  }
  if (rightPressed1==true) {
    xPos1+=playerSpeed;
  }


  //Mirror controls


  if (upPressed2==true) {
    yPos2+=playerSpeed;
  }
  if (downPressed2==true) {
    yPos2-=playerSpeed;
  }

  if (leftPressed2==true) {
    xPos2-=playerSpeed;
  }
  if (rightPressed2==true) {
    xPos2+=playerSpeed;
  }
}

void keyPressed() {
  if (keyCode == UP) {
    upPressed1=true;
    upPressed2=true;
  }

  if (keyCode== DOWN) {
    downPressed1=true;
    downPressed2=true;
  }
  if (keyCode == LEFT) {
    leftPressed1=true;
    leftPressed2=true;
  }

  if (keyCode== RIGHT) {
    rightPressed1=true;
    rightPressed2=true;
  }

  if (keyCode=='R') {
    gameState--;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed1=false;
    upPressed2=false;
  }

  if (keyCode== DOWN) {
    downPressed1=false;
    downPressed2=false;
  }
  if (keyCode == LEFT) {
    leftPressed1=false;
    leftPressed2=false;
  }

  if (keyCode== RIGHT) {
    rightPressed1=false;
    rightPressed2=false;
  }
}

void setup1() {

  levelMap=loadImage("Untitled-1.png");

  score1get=false;
  score2get=false;

  p1Width=p2Width=20;
  p1Height=p2Height=20;

  xPos1=127;
  yPos1=357;

  xPos2=127;
  yPos2=320;

  xScore2=582;
  yScore2=330;

  xScore1=582;
  yScore1=367;
}

void setup2() {
    
  levelMap=loadImage("Level2.5.png");

  score1get=false;
  score2get=false;

  p1Width=p2Width=20;
  p1Height=p2Height=20;

  xPos1=143;
  yPos1=216;

  xPos2=143;
  yPos2=396;

  xScore2=557;
  yScore2=509;

  xScore1=540;
  yScore1=330;
}

void setup3() {
    
  levelMap=loadImage("Level3.png");

  score1get=false;
  score2get=false;

  p1Width=p2Width=20;
  p1Height=p2Height=20;

  xPos1=143;
  yPos1=216;

  xPos2=143;
  yPos2=396;

  xScore1=510;
  yScore1=440;

  xScore2=547;
  yScore2=439;
}


