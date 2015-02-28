
Wall[] walls = new Wall[300];
Cloud[] clouds = new Cloud[200];


float personY = 200;
float fallspeed = 0;
float n = 9;
int gState;
PFont fontA;


void setup() {
  background(20, 5, 40);
  size(600, 400);
   fontA = loadFont("LetterGothicStd-Bold-46.vlw");

  noStroke();
  gState =1;
  fill(250, 192, 227);
  for (int i = 0; i < 200; i++) {
    if (clouds[i] == null) {
      clouds[i] = new Cloud();
      //clouds[i].x = 100*i;
    }
  }
  for (int i = 0;i <300; i++ ) {
    walls[i]= new Wall();
    walls[i].x = 600 + 120*i;
  }
}

void draw() {
  background(20, 5, 40);  
  for (int i = 0; i < 5; i++) {
    clouds[i].move();
    clouds[i].display();
  }
  if (gState ==1) {
    fill(255);
    text("click to start", 250, 190);
    
    if (mousePressed) {
      gState=2;
    }
  }

  if (gState==2) {
    runGame();
  }
}

void runGame() {
  displayPlayer();


  for (int i = 0;i < 300; i++ ) {
    walls[i].display();
    walls[i].move();
    if (walls[i].checkHit(65, personY)) {
      //println("HIT A WALL!");

      setup();
      gState = 1;
    }
  }
  fallspeed = fallspeed + .02;
  if ( fallspeed > 1.5) {
    fallspeed = 1.5;
  }

  personY = personY+fallspeed;

  //    if (personY<-30 || personY> 650) {
  //      gState = 1;
  //    }
}

void displayPlayer() {
  rectMode(CENTER);
  fill(300-personY, personY/5, personY);
  stroke(0);
  rect(60, personY+10, n, n);
  rect(70, personY+10, n, n);
  rect(60, personY, n, n);
  rect(70, personY, n, n);
}

void mouseClicked() {

  fallspeed = fallspeed - 1.1;
  if ( fallspeed < -2.1) {
    fallspeed = -2.1;
  }
}
void mouseReleased() {
  fallspeed = fallspeed + .001;
}


