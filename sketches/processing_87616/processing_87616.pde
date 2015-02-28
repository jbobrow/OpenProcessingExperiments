

//Created by Sam Sandweiss For the USC SCA Interactive Media Application 
// January 2013


// diver timer and scoring objects
Diver diver1;
Timer timerShark;
Timer timerCanister;
Timer timerStart;
Timer timerFish;
Timer timerBubble;

//shark, fish and canister objects
Shark[] sharks;
Canister[] canisters; 
Fish[] fishes;
Bubble[] bubbles;

// Art
Sand[] sandy;
Coral[] corals;
PImage hurt;

//shark and canister variables for delayed deployment
int totalCanisters=0;
int totalSharks=0;
int totalFishes=0;
int totalBubbles=0;
public int pointsScore=0;

//shark counters
int numSharksOnTop = 0;
int numSharksOnBottom = 0;
boolean makeSharkOnTop = true;

//for background gradient
int Y_AXIS = 1;
color c1, c2, c3;
color cButton, cText, cStroke, cSand;

//Text
PFont scoreFont;
PFont openFont;


//Game state variables and loose booleans
int gameState = 0;
boolean loose;


///////////////////////////////////////////////////

void setup () {
  size(800, 600);
  smooth();

  diver1 = new Diver(20);

  //timers 
  timerStart = new Timer(2000);
  timerShark = new Timer(1500);
  timerCanister = new Timer(5000);
  timerFish = new Timer(2000);
  timerBubble= new Timer(50);

  //object arrays 
  canisters = new Canister[4];
  sharks = new Shark[100];
  fishes = new Fish[15];

  //art 
  bubbles= new Bubble[15];
  sandy = new Sand[30];
  corals = new Coral[5];
  hurt = loadImage("Hurt.png");

  timerStart.start();
  timerShark.start();
  timerCanister.start();
  timerFish.start();
  timerBubble.start();

  //define gradient colors
  c1 = color(0, 160, 176);
  c2 = color(105, 210, 231);
  c3 = color(234, 185, 136);

  //art contd
  for (int i=0; i< sandy.length; i++) {
    sandy[i] = new Sand();
  }

  for (int i=0; i< corals.length; i++) {
    corals[i] = new Coral();
  }

  //Text, stroke, and Button colors
  cText = color(235, 104, 65);
  cButton = color(237, 201, 81, 128);
  cStroke = color(106, 74, 60);
  cSand = color(224, 155, 96);

  //load fonts
  scoreFont = createFont("Serif", 12, true);
  openFont = createFont("Ocean", 36, true);
}

////////////////////////////////////////////////

void draw () {
  setGradient(0, 0, width, height*1/2, c2, c1);
  setGradient(0, height*1/2, width, height/2, c1, c3);
  fill(c3);
  rect(0, height*3/4, width, height/4);

  //Game art
  for (int i=0; i < sandy.length; i++) {
    sandy[i].display();
    sandy[i].move();
  }

  for (int i=0; i < corals.length; i++) {
    corals[i].display();
    corals[i].move();
  }




  if (gameState == 0) {

    cursor();
    strokeWeight(5);
    stroke(cStroke);
    fill(cButton);
    //play & help rectangles, respectively 
    rect(width/2-40, height/2+10, 80, 40);
    rect(width/2-40, height*2/3-30, 80, 40);
    fill(cText);
    textAlign(CENTER);
    textFont(openFont, 72);
    text("Scuba Steve", width/2, height/3);
    textFont(openFont, 36);
    text("Play", width/2, height/2+40);
    text("Help", width/2, height*2/3);
    textAlign(LEFT);
    pointsScore=0;
    diver1.health.scoreHealth=7500;
    diver1.oxygen.scoreOxygen=7500;
    totalCanisters=0;
    totalSharks=0;
    totalFishes=0;
    totalBubbles=0;
    strokeWeight(1);
    stroke(1);
  }



  if (gameState == 1) {


    noCursor();
    stroke(1);
    diver1.display();
    diver1.setLocation(mouseX-40, mouseY+30);
    diver1.displayHealthOxygen();

    if (timerBubble.isFinished() && totalBubbles < bubbles.length) {
      bubbles[totalBubbles] = new Bubble(mouseX, mouseY, int(random(10, 30)));
      totalBubbles++;
      timerBubble.start();
    }

    for (int j=0; j <totalBubbles; j++) {
      bubbles[j].display();
      bubbles[j].move();
      if (totalBubbles == bubbles.length && bubbles[j].y <-100) {
        totalBubbles=0;
      }
    } 

    //Score bar
    textFont(openFont, 24);
    fill(cText);
    text("Fish Collected:", width/2-100, 580);
    text(pointsScore, width/2+50, 580);

    // BUBBLES!
    if (timerStart.isFinished()) {
      //For initalizing fish, cannisters, and sharks into the map. 
      if (timerFish.isFinished() && totalFishes < fishes.length) {
        fishes[totalFishes] = new Fish(820, int(random(200, 580)), 1);
        totalFishes++;
        timerFish.start();
      } 

      if (timerCanister.isFinished() && totalCanisters < canisters.length) {
        canisters[totalCanisters] = new Canister(820, int(random(20, 580)), int(random(2, 6)));
        totalCanisters++;
        timerCanister.start();
      }

      //Method for spawing more shorks on top then on bottom. 
      if (timerShark.isFinished() && totalSharks < sharks.length) {
        boolean flag = true;
        Shark tempShark;
        do { // this loop 
          tempShark = new Shark(820, int(random(20, 580)), int(random(2, 6)));
          if ((tempShark.y < 300) && makeSharkOnTop) {
            flag = false;
            numSharksOnTop++;
          } 
          else if ((tempShark.y <= 300) && !makeSharkOnTop) {
            //        println("make bottom shark");
            flag = false;
            numSharksOnBottom++;
          }
          if (numSharksOnTop > 2 || numSharksOnBottom > 0) {
            //        println("switcheroo");
            makeSharkOnTop = !makeSharkOnTop;
            numSharksOnTop = 0; 
            numSharksOnBottom = 0;
          }
        } 
        while (flag);

        sharks[totalSharks] = tempShark;
        totalSharks++;
        timerShark.start();
      }



      for (int i = 0; i < totalFishes; i++) {
        fishes[i].move();
        fishes[i].display();
        if (diver1.intersectF(fishes[i])) {
          fishes[i].caught();
        }
        if (fishes[i].leftScreen()) {
          fishes[i].x=int(random(820, 900));
          fishes[i].y=int(random(200, 580));
        }
      }

      for (int i = 0; i < totalSharks; i++) {
        sharks[i].move();
        sharks[i].display();
        for (int h = 0; h < sharks[i].collisions.length; h++) {
          if (diver1.intersectCirc(sharks[i].collisions[h])) {     
            diver1.health.sharkAttack();
            image(hurt, 0, 0);
          }
          if (sharks[i].leftScreen()) {
            sharks[i].x=int(random(820, 900));
            sharks[i].y=int(random(20, 580));
          }
        }
      }
      for (int i = 0; i < totalCanisters; i++) {
        canisters[i].move();
        canisters[i].display();
        if (diver1.intersectC(canisters[i])) {
          canisters[i].caught();
          diver1.newAir();
        }
        if (canisters[i].leftScreen()) {
          canisters[i].x=int(random(820, 900));
          canisters[i].y=int(random(20, 580));
        }
      }
      if (diver1.healthFlag == false) {
        image(hurt, 0, 0);
      }
    }
  }

  if (gameState == 2) {
    fill(cText);
    textFont(openFont, 36);
    textAlign(CENTER);
    text("You Collected", width/2, height/4);
    text(pointsScore, width/2, height/4+30);
    text("Fish!", width/2, height/4+60);
    text("Game Over", width/2, height/2);
    text("Play Again?", width/2, height/2+35);
    text("Press 'm' for menu", width/2, height/2+70);
  }

  if (gameState == 3) {
    textAlign(CENTER);
    text("Scuba Steve is on a mission!", width/2, height/3);
    text("Collect air to survive!", width/2, height/3+40);
    text("Collect Fish for Points!", width/2, height/3+80);
    text("Avoid the Sharks!", width/2, height/3+120);
    text("Press 'm' to go back", width/2, height/3+160);


    //    fill(209, 53, 53, 128);
    //    rect(width/2-40, height*2/3-30, 80, 40);
    //    fill(195, 255, 173);
    //    text("Back", width/2, height*2/3);
  }
}


void mousePressed() {
  if (gameState == 3 && mouseX > width/2-40 && mouseY > height*2/3-30 && mouseX< width/2+40 && mouseY < height*2/3+10) {
    gameState = 0;
  }

  if (gameState== 0 && mouseX > width/2-40 && mouseY > height*2/3-30 && mouseX< width/2+40 && mouseY < height*2/3+10) {
    gameState = 3;
  }
  if (gameState==0 && mouseX > width/2-40 && mouseY > height/2+10 && mouseX< width/2+40 && mouseY < height/2+50) {
    gameState= 1;
    timerStart.start();
  }
}

void keyPressed() {
  if (gameState== 2 || gameState== 3) {
    if (key =='m' || key == 'M') {
      gameState = 0;
    }
  }
}



void setGradient(int x, int y, float w, float h, color c1, color c2) {

  noFill();


  for (int i = y; i <= y+h; i++) {
    float inter = map(i, y, y+h, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, i, x+w, i);
  }
}

class Bubble {
  int x, y, r;
  int bubbleRise;
  float noiseDrift;

   Bubble (int tempX, int tempY, int tempR) {
    x = tempX;
    y = tempY;
    r = tempR;
    noiseDrift=.2;
    bubbleRise=2;
  }

  void display() {
    stroke(255);
    fill(255, 255, 255, 30);
    ellipse (x, y, r, r);
    ellipse (x-.15*r, y-.15*r, .2*r, .2*r);
  }
  void move() {
    y-=bubbleRise;
    x=x+int(noise(noiseDrift))-1;
   
  }
}

class Canister {
  int y;
  int x;
  int canisterSpeed;
  int r=20;
  CircleInfo[] collisions;

  Canister(int tempX, int tempY, int tempCanisterSpeed) {
    y = tempY;
    x = tempX;
    canisterSpeed = tempCanisterSpeed;
    collisions = new CircleInfo[4];
  }

  void display() {
    
    noStroke();
    fill(128);
    rect(x-3,y-20,6,10);
    rect(x-4,y-18,4,4);
    fill(0);
    ellipse(x-6,y-16,5,4);
    fill(8254,255,33);
    ellipse(x, y, r, r);
    rect(x-10,y,20,30);
    fill(255);
    stroke(1);
    collisions[0] = new CircleInfo(x,y,r);
    collisions[1] = new CircleInfo(x,y+12,r);
    collisions[2] = new CircleInfo(x,y+17,r);
    collisions[3] = new CircleInfo(x,y+21,r);
    for (int i=0; i<  4; i++) {
      collisions[i].display();
     
    }
  }

  void move() {
    x -= canisterSpeed;
  
  }
  boolean leftScreen () {
    //if canister goes off screen
    if (x < 0 || y > 600 || y < 0){
      return true;
    }
    else {
      return false;
    }
  }
  void caught() {
    x=int(random(820,900));
    y=int(random(20,580));
    canisterSpeed=int(random(2,8));
  }
}

class CircleInfo {
  int x,y,r;
  
  CircleInfo(int tempX, int tempY, int tempR) {
    x= tempX;
    y= tempY;
    r= tempR;
  }
  void display() {
    noStroke();
   fill(0,0,0,0);
    ellipse(x,y,r,r);
    stroke(1);
  }
  
}
class Coral {
  int x, y, r, coralSpeed;
  PImage coralSprite;

  Coral () {
    x = int(random(0,800));
    y = int(random(340,450));
    coralSpeed = 1;
    r=5;
    coralSprite= loadImage("Coral1.png");
  }

  void display() {
    image(coralSprite,x,y);
   // fill(255);
   // ellipse(x, y, r, r);
  }

  void move() {
    x-= coralSpeed;
    if(x<-80) { 
      x= int(random(810,950));
    }
  }

  boolean leftScreen () {
    //if canister goes off screen
    if (x < -100 || y > 600 || y < 0) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Diver {
  int r;
  int x= 0;
  int y= 0;
  int xA;
  int xB;
  int yA;
  int yB;
  HealthBar health;
  OxygenBar oxygen;
  PImage scubaSprite;
  boolean healthFlag;


  Diver(int tempR) {
    r= tempR;
    x=mouseX;
    y=mouseY;
    healthFlag = true;

    oxygen = new OxygenBar(10, 25, 40);
    health = new HealthBar(10, 5, 20);
    scubaSprite = loadImage("ScubaDiver.png");
  }

  void setLocation(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    xA=x+30;
    yA=y-15;
    image(scubaSprite, x-50, y-30);
    fill(255);
    // ellipse(x, y, r, r);
    // ellipse(xA, yA, r, r);
  }
  boolean intersectC(Canister c) {
    float distance = dist(x, y, c.x, c.y);
    if (distance < r + c.r) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean intersectF(Fish f) {
    float distance = dist(x, y, f.x, f.y);
    if (distance < r + f.r) {
      return true;
    } 
    else {
      return false;
    }
  }


  boolean intersectCirc(CircleInfo circ) {
    float distance = dist(x, y, circ.x, circ.y);
    float distanceTwo = dist(xA, yA, circ.x, circ.y);
    if (distance < r || distanceTwo < r ) {
      return true;
    } 
    else {
      return false;
    }
  }

  void displayHealthOxygen() {
    health.display();
    health.score();
    if (oxygen.hasOxygen()) {
      oxygen.scoreDepth();
      healthFlag = true;
    } 
    else {
      health.noOxygen();
      healthFlag = false;
    }
    oxygen.display();
    if (!health.hasHealth()) {
      gameState=2;
    }
  }

  void newAir() {
    oxygen.newAir();
  }

}

class Fish {
  int y, x;
  int sFishSpeed=int(random(4, 10));
  int mFishSpeed=int(random(3, 6));
  int lFishSpeed=int(random(2, 4));
  int r=10;
  int fishSize;

  Fish(int tempX, int tempY, int tempFishSize) {
    y = tempY;
    x = tempX;
    fishSize = tempFishSize;
  }

  void display() {
    //for large fish 
    if (fishSize == 1) {
      noStroke();
      fill(2211, 45, 109);
      ellipse(x, y, 1.5*r, 1.5*r);
      triangle(x+2, y, x+15, y+10, x+15, y-10);
      stroke(1);
      fill(255);
    }
  }

  void move() {
    if (fishSize == 1) {
      x -= sFishSpeed;
     // y= y+int(1.5*sin((x+random(1, 10))/100));
    }
    if (fishSize == 2) {
      x-=mFishSpeed;
    }
    if (fishSize == 2) {
      x-= lFishSpeed;
    }
  }
  boolean leftScreen () {
    //if canister goes off screen
    if (x < 0 || y > 600 || y < 0) {
      return true;
    }
    else {
      return false;
    }
  }
  void caught() {
    x=int(random(820, 900));
    y=int(random(200, 580));
    pointsScore+=1;
    
  }
}

class HealthBar {
  int x, y, w, hbLength;
  public float scoreHealth;

  HealthBar(int tempX, int tempY, int tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    scoreHealth=7500;
    hbLength = int(scoreHealth)/10;
  }
  void display () {
    stroke(cStroke);
    strokeWeight(2);
    fill(255, 0, 0);
    rectMode(CORNERS);
    rect(hbLength, w, x, y);
    rectMode(CORNER);
    strokeWeight(1);
  }

  void score() {

    hbLength = int(scoreHealth)/10;

    if (hbLength <= x) {
      scoreHealth = 100;
    }
    if (hbLength >=width-10) {
      scoreHealth=7500;
    }
  }

  void sharkAttack() {
    scoreHealth-= 30;
  }
  void noOxygen() {
    scoreHealth-= 5;
  }
  boolean hasHealth() {
    if (hbLength <= x) {
      println("NO Health");
      return false;
    } 
    else {
      
      return true;
    }
  }
}

class OxygenBar {
  int x, y, w, obLength;
  float scoreOxygen;

  OxygenBar(int tempX, int tempY, int tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    scoreOxygen=7500;
    obLength = int(scoreOxygen)/10;
  }
  void display () {
    stroke(cStroke);
    strokeWeight(2);
    fill(0, 244, 255);
    rectMode(CORNERS);
    rect(obLength, w, x, y);
    rectMode(CORNER);
    strokeWeight(1);
  }

  void scoreDepth () {
    scoreOxygen= scoreOxygen -.5; 
    obLength = int(scoreOxygen)/10;
    if (diver1.y >= 150) {
      scoreOxygen-= 2;
      obLength = int(scoreOxygen)/10;
    }
    if (diver1.y >= 300) {
      scoreOxygen-= 4;
      obLength = int(scoreOxygen)/10;
    }
    if (diver1.y >= 500) {
      scoreOxygen-= 6;
      obLength = int(scoreOxygen)/10;
    }

    if (obLength >=width-10) {
      scoreOxygen=7500;
    }
    if (scoreOxygen < 100) {
      scoreOxygen=100;
    }
  }

  boolean hasOxygen () { //checking to see if oxygen is present
    if (obLength >= x) {

      //     println("Has Oxygen");
      return true;
    }
    else {
       //     println("NO OXYGEN");
      return false;
    }
  }
  
  void newAir() {
    scoreOxygen+= 5000;
    obLength = int(scoreOxygen)/10;
  
  }
}
class Sand {
  int x, y, r, sandSpeed;

  Sand() {
    x = int(random(0,800));
    y = int(random(455,600));
    sandSpeed = 1;
    r=5;
  }

  void display() {
    fill(cSand);
    ellipse(x, y, r, r);
  }

  void move() {
    x-= sandSpeed;
    if(x<0) { 
      x= int(random(810,850));
    }
  }

  boolean leftScreen () {
    //if canister goes off screen
    if (x < 0 || y > 600 || y < 0) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Shark {
  int x, y, sharkSpeed;
  int r=20;
  PImage sharkSprite;
  CircleInfo[] collisions; //CircleInfo class just contains xLoc, yLoc, and r


  Shark (int tempX, int tempY, int tempSharkSpeed) {
    x = tempX;
    y = tempY;
    sharkSpeed = tempSharkSpeed;
    sharkSprite = loadImage("Shark Image.png");
    collisions = new CircleInfo[5];
  }

  void display () {
    image(sharkSprite, x, y);
    collisions[0] = new CircleInfo(x+15, y+35, r);
    collisions[1] = new CircleInfo(x+30, y+28, r);
    collisions[2] = new CircleInfo(x+45, y+32, 18);
    collisions[3] = new CircleInfo(x+60, y+34, 14);
    collisions[4] = new CircleInfo(x+73, y+34, 13);
    for (int i=0; i<  5; i++) {
      collisions[i].display();
    }
  }

  void move() {
    x = x - sharkSpeed;
  }

  boolean leftScreen () {
    //if canister goes off screen
    if ( x < -50 || y > 600 || y < 0) {
      return true;
    }
    else {
      return false;
    }
  }
}
class Timer {
  int savedTime;
  int totalTime;

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() {
    savedTime = millis();
  }

  boolean isFinished() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}



