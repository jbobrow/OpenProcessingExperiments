
// RainGame
// The object of this game is to catch raindrops before they 
// hit the ground. Every so often (depending on the level of 
// difficulty), a new drop falls from the top of the screen 
// at a random horizontal location with a random vertical speed. 
// The player must catch the raindrops with the mouse with the 
// goal of not letting any raindrops reach the bottom of the screen.

Catcher catcher;
Drop[] drops;
Timer timer;
int totalDrops;
Life life;
Endgame endgame;
Level level;
Score score;

void setup() {
  size(600, 400);
  smooth();

  //fullLife = 10;
  catcher = new Catcher(32);
  drops = new Drop[0];
  timer = new Timer(1000);
  life = new Life(10);
  level = new Level(1);
  score = new Score(0);
  endgame = new Endgame(0);
  timer.start();
  totalDrops = 0;
}

void draw() {
  background(0);
  
   //outputs this when life reaches 0
  if (endgame.newGameOver == 1) {
    endgame.display();
  }

  //outputs this when life > 0
  else {
    checkForMoreRain();

    catcher.setLocation(mouseX, mouseY);
    catcher.display();

    drawRaindrops();
    collectRaindrops();

    life.display();
    score.display();
    level.display();
  }
}

// clean out all the dead drops
void collectRaindrops() {
  int i = 0;
  while (i < totalDrops) {
    if (drops[i].living == false) {
      // this drop is dead, so move all the drops
      // in the array behind it, forward one.
      int j = i + 1;
      while (j < totalDrops) {
        drops[j-1] = drops[j];
        j++;
      }
      totalDrops--;
    }
    i++;
  }
}

// move and draw all the drops.
// check to see if they have been caught,
// or if they have reached the bottom.
void drawRaindrops() {
  for (int i = 0; i < totalDrops; i++) {
    drops[i].move();
    if (catcher.intersect( drops[i].x, drops[i].y, drops[i].r )) {
      drops[i].caught();
    }
    if (drops[i].hitBottom()) {
      life.takeAwayLife();
    }
    drops[i].display();
  }
}

// check to see if its time for a new drop
void checkForMoreRain() {
  if (timer.isFinished()) {
    Drop d = new Drop();
    if (totalDrops < drops.length) {
      drops[totalDrops] = d;
    }
    else {
      drops = (Drop[])append(drops, d);
    }
    totalDrops++;
    timer.start();
  }
}

void mousePressed() {
  //if game over displayed allows for restart or quit button selection
  if (endgame.newGameOver == 1) {
    if (mouseY > endgame.bxTop && mouseY < endgame.bxBottom) { 
      if (mouseX > endgame.restartLeft && mouseX < endgame.restartRight) {
        endgame.restartGame();
      }
      else if (mouseX > endgame.quitLeft && mouseX < endgame.quitRight) {
        endgame.endGame();
      }
    }
  }
}

// Catcher - a object to represent the user controlled circle
// used the catch the drops.
class Catcher {
  float x;
  float y;
  float r;
  color c;
  
  Catcher( float newRadius ) {
    x = 0.0;
    y = 0.0;
    r = newRadius;
    c = color(30,240,30);
  }
  
  void display() {
    stroke(255);
    strokeWeight(2);
    fill(c);
    ellipse(x,y,r*2,r*2);
  }
  
  void setLocation( float tempX, float tempY ) {
    x = tempX;
    y = tempY;
  }
  
  boolean intersect( float cx, float cy, float cr ) {
    float distance = dist(x,y,cx,cy);
    if (distance < (r + cr)) {
      return true;
    }
    return false;
  }
  
}
// Drop - an object to represent one drop.
class Drop {
  float x;
  float y;
  float r;
  color c;
  float speed;
  boolean living;

  Drop() {
    r = 8.0;
    x = random(r, width-r);
    y = -r;
    c = color(0, 0, random(180, 255));
    speed = random(1, 5);
    living = true;
  }

  void display() {
    if (living == true) {
      noStroke();
      fill(c);
      ellipse(x, y, r*2, r*2);
    }
  }

  void move() {
    y += (speed*level.newLevel);
  }
  
  boolean hitBottom() {
    if (y > height + (r * 2)) {
      living = false;
      return true;
    }
    return false;
  }
  
  void caught() {
    living = false;
    score.scoreUp();
  }
}

///create endgame class

class Endgame {

  float bxTop = ((height*2/3)-(height/10/2));
  float bxBottom = ((height*2/3)+(height/10/2));
  float restartLeft = ((width*1/3)-(width/10/2));
  float restartRight = ((width*1/3)+(width/10/2));
  float quitLeft = ((width*2/3)-(width/10/2));
  float quitRight = ((width*2/3)+(width/10/2));
  int newGameOver;
  
  Endgame(int gameOver){
    newGameOver = gameOver;
  }
//will display endgame interface
  void display() {
    for (int i = 0; i < 750; i++) {
    }
    noStroke();
    float m = millis() * 0.05;
    fill((m % 50)+100);
    rectMode(CENTER);
    rect(width/2, height/2, width/1.5, height/1.5);

    fill(8, 157, 61);
    rect(width*1/3, height*2/3, width/10, height/10);
    rect(width*2/3, height*2/3, width/10, height/10);

    fill(0, 0, 255);
    PFont font;
    // The font must be located in the sketch's 
    // "data" directory to load successfully
    font = loadFont("AppleCasual-48.vlw"); 
    textFont(font); 
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    PFont font2;
    font2 = loadFont("AppleCasual-15.vlw"); 
    textFont(font2);
    text("RESTART", width*1/3, height*2/3);
    text("QUIT", width*2/3, height*2/3);
  }
//if restart button selected on game over screen
  void restartGame() {
    setup();
  }

//if quit button selected on game over screen
  void endGame() {
    exit();
  }
}

//create level class
class Level {

  int newLevel;
  

  Level( int startLevel) {
    newLevel = startLevel;
  }

  void levelUp() {
    newLevel =(int(score.newScore/100)+1);
  }

  void display() {
    fill(255);
    textAlign(LEFT);
    PFont font2;
    font2 = loadFont("AppleCasual-15.vlw"); 
    textFont(font2);
    String l = "LV " + newLevel;
    text(l, width*0.1/12,height*0.75/12);
  }
}

//tracks the life of player
class Life {
  int newLife;

  Life( int lifePoints) {
    newLife = lifePoints;
  }

//shows life bar
  void display() {
    noStroke();
    fill(0, 255, 0, 100);
    rectMode(CORNER);
    rect((width/12), 10, (width/12)+(width/12*(newLife-1)), 20);
  }

//removes one point  from life
  void takeAwayLife() {
    newLife-= 1;
    if (newLife <= 0) {
      endgame.newGameOver = 1;
    }
  }
}

//creat score class
class Score {

  int newScore;

  Score(int startScore) {
    newScore =  startScore;
  }

  void scoreUp() {
    newScore += 10;
    level.levelUp();
  }

  void display() {
    fill(255);
    PFont font2;
    textAlign(LEFT);
    font2 = loadFont("AppleCasual-15.vlw"); 
    textFont(font2);
    text(newScore, width*11/12,height*11/12);
  }
}

// A timer that can be used to trigger an action
// at some interval. Duration is a value in milliseconds.
class Timer {
  int duration;
  int startTime;
  
  Timer( int durationValue ) {
    duration = durationValue;
  }
  
  void start() {
    startTime = millis();
  }
  
  boolean isFinished() {
    int passedTime = millis() - startTime;
    if (passedTime > duration) {
      return true;
    }
    return false;
  }
  
  void setDuration( int durationValue ) {
    duration = durationValue;
  }
  
}


