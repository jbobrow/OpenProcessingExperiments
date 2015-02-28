
//fields

int sizeX = 500; //width of screen
int sizeY = 500; //height of screen

PImage JOHNfront;
PImage JOHNback;
PImage JOHNleft;
PImage JOHNright;

PImage pantsFront;
PImage pantsBack;
PImage pantsLeft;
PImage pantsRight;

PImage JAM;
PImage bg;
PImage startGraphic;
PImage endGraphic;

boolean gameBegun = false;
boolean gameOver = false;
boolean redPants = false;
int jamCount = 0;

jamJar jam [] = new jamJar[10]; //an array of jam jars


playCharacter subject;

void setup() {
  JOHNfront = loadImage("JOHNfront.png");
  JOHNback = loadImage("JOHNback.png");
  JOHNleft = loadImage("JOHNleft.png");
  JOHNright = loadImage("JOHNright.png");

  pantsFront = loadImage("JOHNfrontred.png");
  pantsBack = loadImage("JOHNbackred.png");
  pantsLeft = loadImage("JOHNleftred.png");
  pantsRight = loadImage("JOHNrightred.png");

  JAM = loadImage("jam.png");
  bg = loadImage("bg.jpg");
  startGraphic = loadImage("start.jpg");
  endGraphic = loadImage("end.jpg");

  for (int i =0; i<10; i++) {
    jam[i] = new jamJar(int(random(0, 10)), int(random(0, 10)));
  }
  size(500, 500);
  background(bg);
  subject = new playCharacter();
}

void draw() {
  if (gameOver) {
    background(endGraphic);
  }
  else if (gameBegun) {
    background(bg);
    for (jamJar check: jam) {
      check.drawJam();
    }
    subject.drawChar();
  }
  else if (gameBegun==false) {
    image(startGraphic, 0, 0);
  }
  if (jamCount>9)gameOver=true;
}

void newGame() {
  gameOver = false;
  gameBegun = true;
  redPants = false;
  jamCount = 0;
  subject = new playCharacter();
  for (int i =0; i<10; i++) {
    jam[i] = new jamJar(int(random(0, 10)), int(random(0, 10)));
  }
}
void mouseReleased() {
  if (gameBegun==false) {
    gameBegun=true;
  }
  else if (gameOver) {
    newGame();
  }
}
void keyPressed() {
  if (key== ' '&&redPants==false) {
    redPants = true;
    subject.currentImage=pantsFront;
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      subject.charStep(0);
    }
    else if (keyCode == RIGHT) {
      subject.charStep(1);
    }
    if (keyCode == UP) {
      subject.charStep(2);
    }
    else if (keyCode == DOWN) {
      subject.charStep(3);
    }
  }
}

//-------------------------
class jamJar {
  int xPos;
  int yPos;
  PImage thisJam;
  boolean here = true;

  jamJar(int x, int y) {
    xPos = x*50;
    yPos = y*50;
    thisJam = JAM;
  }
  void drawJam() {
    if (here)image(thisJam, xPos, yPos);
  }
}
//-------------------------
class playCharacter {
  int xPos; //current xPos of character
  int yPos; //current yPos of character
  int step = 50;
  //int Mode = 1; //1 is normal mode 2 is sheet/redpants mode 3 is purpleshirt/hedgehog mode
  PImage currentImage;
  //constuctor
  playCharacter() {
    currentImage = JOHNfront;
    xPos=0;
    yPos=0;
  }
  void drawChar() {
    image(currentImage, xPos, yPos);
  }

  void charStep(int direction) {
    if (direction==0) { //step left
      if (!(xPos-step<0))xPos -= step;
      if(redPants){currentImage = pantsLeft;}
      else{currentImage = JOHNleft;}
    }
    else if (direction==1) { //step right
      if (!(xPos+step>450))xPos += step;
      if(redPants){currentImage = pantsRight;}
      else{currentImage = JOHNright;}
    }
    else if (direction==2) { //step up
      if (!(yPos-step<0))yPos -= step;
      if(redPants){currentImage = pantsBack;}
      else{currentImage = JOHNback;}
    }
    else if (direction==3) { //step down
      if (!(yPos+step>400))yPos += step;
      if(redPants){currentImage = pantsFront;}
      else{currentImage = JOHNfront;}
    }
    for (jamJar check: jam) {
      if (check.here&&xPos==check.xPos &&(yPos==check.yPos||yPos==check.yPos-50)) {
        check.here=false;
        jamCount++;
      }
    }
  }
}


