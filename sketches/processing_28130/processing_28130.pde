
/*==================

D O D G E

Jason Ea
5/3/2011

==================*/

Hero hero;

int x, y, l, h;
boolean dead = false;
int boxSize = 20;
int numBox = 5;
int incBox = 2; // add this many boxes every level
int boxSpeed = 2;
int heroSpeed = 2;
int levelDuration = 5; // duration of each level in seconds
int level = 1;
boolean incLevel = true;  // for box num
boolean incLevel2 = true; // for box speed
 //box coordinates
int[] boxX = new int[1000];
int[] boxY = new int[1000];

//timer
int timer;
int startTime;

//randomly place blocks
int randY(){
  return int(random(400));
}
int randX(){
  return int(random(800)+400);  // spawn area of boxes e.g. 400-800
}

void setup() {
  size(400,400);
  //hero: Hero(color tempC, float tempXpos, float tempYpos, float tempXspeed, int temph, int tempw) {
  hero = new Hero(color(0,0,0), 3, 5, height/2-25, heroSpeed, 10, 10); 
  generateBox();
  startTime = second();
  println("You're at level "+level);
  //noLoop();
}

void draw() {
  background(100);
  level();
  boxMove();
  hero.drive();
  hero.display();
  boxHit();
  showHealth();
  gameEnd();
}

void showHealth() {
  for (int i=0; i<hero.lives; i++) {
    fill(255,0,0);
    int s = 10; // size
    int p = 15; // padding
    rect(width-(s+p/2)-(p*i), p, s, s);
  } 
}

/////GENERATE BOXES////
void generateBox(){
  for (int i=0; i<numBox; i++) {
    boxX[i] = randX();
    boxY[i] = randY(); 
  }
}

/////CREATE BOXES////
void boxMove(){
  stroke(255);
  fill(255);
  for (int i=0; i<numBox; i++){
    if (boxX[i] < 0) {
      boxX[i] = randX();
      boxY[i] = randY();
    } else {
      boxX[i]=boxX[i]-boxSpeed;
    }
    rect(boxX[i], boxY[i], boxSize, boxSize);
  }
}


///// TRACK LEVEL////
void level() {
  if (second() > 0) {
    // every level, increase boxes
    if (second() % levelDuration == 0) {
      if (incLevel) {
        // new level
        level++;
        // increase number of boxes
        numBox = numBox + incBox;
        println("You're at level "+level);
        // increase box speed
        if (second() % (2*levelDuration) == 0) {
          boxSpeed++;
          println("Speed has increased");
        }
        incLevel = false;
      }
    } else {
      incLevel = true;
    }
  }
}

///// HIT ////
void boxHit(){
  for (int i=0; i<numBox; i++){
    //print("box"+i+": ("+boxX[i]+","+boxY[i]+")\n");
    //print("hero: ("+hero.xpos+","+hero.ypos+")\n");
    if (touchingY(boxY[i]) && touchingX(boxX[i]))
      {
          dead = hero.takeLife();
          println("touched");
      }
  }
}

boolean touchingY(float boxy) {
  if ((hero.ypos+hero.h >= boxy) &&
      (hero.ypos <= (boxy+boxSize))) {
    return true;
  } else {
    return false;
  } 
}

boolean touchingX(float boxx) {
  if ((hero.xpos+hero.w >= boxx) &&
      (hero.xpos <= (boxx+boxSize))) {
    return true;
  } else {
    return false;
  }
}

/// END GAME ///
void gameEnd (){
  if ((hero.ypos+hero.h < 0) || (hero.ypos > 400)) {
     dead = true;
  }
  if (dead == true) {
      noLoop();
      println("Game over!");
      showEnd();
  }
}

// Display start game dialogue
void showStart(){
  fill(255);
  rect(width/4, height/4, width/2, height/2);
  PFont font;
  font = loadFont("Helvetica-Bold-20.vlw"); 
  textFont(font); 
  String s = "Press Space to Start.";
  fill(0);
  text(s, width/3, height/3, width/3, height);
  // If space is pressed restart
    if (keyPressed) {
      if (key == ' ') {
        loop();
      }
     }
}

// Display end game dialogue
void showEnd(){
  int m = millis();
  int seconds = second();
  int minutes = minute();
  fill(255);
  rect(width/4, height/4, width/2, height/2);
  PFont font;
  font = loadFont("Helvetica-Bold-20.vlw"); 
  textFont(font); 
  String s = "";
  if (minutes > 0) {
    s = "You died! You lasted "+minutes+" minutes and "+seconds+" seconds. Press R to restart.";
  } else {
    s = "You died! You lasted "+seconds+" seconds. Press R to restart.";
  }
  fill(0);
  text(s, width/3, height/3, width/3, height);
  // If R is pressed restart
    if (keyPressed) {
      if (key == 'r') {
        loop();
      }
     }
}
      
      

