
/*@pjs preload="field.png,mole1.png,mole2.png";*/

PImage moleUp;
PImage moleDown;
PImage field;

int buffer = 0;
int level = 0;
int wins = -1;
int intro = 0;
int totalScore = 0;

int border = 50;
boolean clicked;

int radius = 30;
int score;

int w = 800;
int h = 480;

int numBalls = level;
Game myGame = new Game(numBalls);



void setup() {
  size(800, 480);
  smooth();

  field = loadImage("field.png");  
  moleUp = loadImage("mole1.png");
  moleUp.resize(60, 60);  
  moleDown = loadImage("mole2.png");
  moleDown.resize(60, 60);
}

void draw() {
  mainScreen();
  if(intro>0){
  if (myGame.highScore == level) {
    level+=3;
    int numBalls = level;
    myGame = new Game(numBalls);
    wins +=1;
  }
  if (myGame.lowScore == -level) {
    int numBalls = level;
    myGame = new Game(numBalls);
  }
  
  image(field, 0, 0);
  myGame.display();
  score();
  }
}


class Game {
  int numMoles;
  int highScore =0;
  int lowScore;
  Ball[] myBall;

  Game(int myNumMoles) {
    numMoles = myNumMoles;
    myBall = new Ball[numMoles];

//make the moles
if(buffer<200){
    for (int i = 0; i<numMoles; i++) {
      myBall[i] = new Ball(border+(int(random(10))*((width-(border*2))/10)), border+(170+int(map(i,0,numMoles,0,10))*22), radius, int (random(300, 700)));
    }
    
    //compare the positions and rebuild any that are overlapping
    for (int i = 0; i<numMoles; i++) {
      for(int j = 0; j<numMoles-1;j++) {
        if(j==i)
        j++;
        if (dist(myBall[i].tx,myBall[i].ty,myBall[j].tx,myBall[j].ty)<10){
           myBall[j] = new Ball(border+(int(random(10))*((width-(border*2))/10)), border+(170+int(map(i,0,numMoles,0,10))*22), radius, int (random(300, 700)));
           j=numMoles;
           i=0;
           buffer+=1;
           if(buffer>200){
             i=numMoles;j=numMoles;}
        }
      }
    }
}
  }

  void display() {
    for (int i = 0; i<numMoles; i++) {
      highScore += myBall[i].whacker();
     
      lowScore -= myBall[i].badWhack();
      if (myBall[i].whack)
        myBall[i].display();
    }
  }


  void addHigh() {
    highScore+=1;
  }

  void addLow() {
    lowScore+=1;
  }
}

class Ball {

  float tx, ty, rad;
  boolean whack = true;
  int timer, thisTimer, q;
  boolean bMoleUp, bMoleDown;


  Ball(float mytx, float myty, float myrad, int myTimer) {

    tx = mytx;
    ty = myty;
    rad = myrad;
    thisTimer = myTimer;
  }

  void display() {
    if (timer>thisTimer)
      timer = 0;
    timer++;
    if (timer>thisTimer/5) {
      image(moleDown, tx-30, ty-30);
      ellipse(tx-5, ty+15, 5, 5);
      ellipse(tx+5, ty+15, 3, 3);
      bMoleDown=true;
      bMoleUp=false;
    }
    else {
      image(moleUp, tx-30, ty-30);
      fill(0);
      int mover = int(sin(thisTimer+(q/10))*3);
      ellipse(tx-5+mover, ty-15, 5, 5);
      ellipse(tx+5+mover, ty-15, 3, 3);
      bMoleDown=false;
      bMoleUp=true;
      q+=1;
    }
  }

  int whacker() {
    int score = 0;
    if (clicked && dist(mouseX, mouseY, tx, ty)<rad&&bMoleUp) {
      whack = false;
      clicked = false;
      bMoleUp = false;
      score = 1;
       totalScore += 1;
    }
    return score;
  }

  int badWhack() {
    int score = 0;
    if (clicked && dist(mouseX, mouseY, tx, ty)<rad&&bMoleDown) {
      score = 1;
    }
    return score;
  }
}

void score(){
  fill(0);
  pushMatrix();
  translate(10, 30);
  scale(2, 2);
  if(buffer<200){
  text("score: " + totalScore, 0, 0);
  text("misses: " + abs(myGame.lowScore), 0, 10);
  text("level: " + (wins+1), 0, 20);
  }
  else
  text("Mole buffer overflow! You win! ", 0, 0);
  popMatrix();
  clicked = false;
  
  
}

void mainScreen(){
  if (intro ==0&&clicked==false){
  fill(0,128,255);
  rect(0,0,width,height);
  fill(255);
   pushMatrix();
   pushStyle();
  translate(width/2,height/2);
  scale(7, 7);
  textAlign(CENTER);
  text("Whack A Mole!",0,0);
  scale(.2, .2);
  text("copyright 2012 Idle Hands studio",0,20);
  popMatrix();
  popStyle();
  }
  if(intro==0&&clicked)
  intro++;
}

void mouseClicked() {
  clicked = true;
}


