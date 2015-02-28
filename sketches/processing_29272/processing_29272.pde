
/*
"Clean Ski Runner," by Evan S.

Created for an APCS project.

Four methods were based on code from Space Blob
http://www.openprocessing.org/visuals/?visualID=7704





*/
PImage skier;
PImage heart; //indicates health amount
PImage tree; //not used
int timeCount;
boolean activate; //used to start ahd run the game
int scoreCount;
int numLives = 2; //only because reset is called twice
boolean resumeGame;
//ArrayList<point> deathPoints = new ArrayList<point>();
  
/*
These four methods were based off of code from Space Blob, by PwnMonkey
http://www.openprocessing.org/visuals/?visualID=7704
*/
float[][] trees = new float[20][20];
float[][] pills = new float[5][3];
float[][] lives = new float[5][3];
float[][] rocks = new float[5][3];
  
void setup() {
  timeCount = 180;
  size(700, 700);
  reset(); //create certain amounts
  background(255);
  fill(0);
  textSize(30);
  text("Clean Ski runner\n  Click to begin", width / 3, height/2);
  
  frameRate(180);
  skier = loadImage("Skier.png");
  heart = loadImage("Heart.png");
  tree = loadImage("Tree.png");
}
  
void draw() {
  //fill(fillVal);
  
  //cursor(skier, 0, 0);
  if (mousePressed == true && activate == false && resumeGame == false) {
  
    activate = true;
    timeCount = 10;
    scoreCount = 0;
    reset();
  }
  
  if (mousePressed == true && activate == false && resumeGame == true) {
  
    activate = true;
    reset();
  }
  
  if (activate == true) {
    background(255); //loop reset
    line(0, heart.height + 40, width, heart.height + 40);
    image(heart, 25, 25);
    fill(255);
    noStroke();
    ellipse(mouseX, mouseY, 60, 60);
    image(skier, mouseX - skier.width / 2, mouseY - skier.height / 2);
    //image(tree, width / 2, height / 2);
  
    //reset();
    /*
    calls methods to create these objects
    */
    trees();
    pills();
    lives();
    rocks();
  
    textSize(50);
    text(timeCount / 180 + 10, heart.width + 30, heart.height * 1.55);
    fill(0);
    text("Score: " + scoreCount, width - 280, heart.height * 1.55);
    fill(0);
    textSize(30);
    text("Lives: " + numLives, width / 2 - 50, heart.height + 100);
    fill(0);
    if (timeCount / 180 + 10 > -1) { //note the formula
      timeCount--;
    }
  
    if (timeCount / 180 + 10 <= -1) {
      text("Game Over\n Play again?", width / 3, height/2);
      resumeGame = false;
      activate = false;
      numLives = 0;
    }
  
    if (keyPressed) {
      if (key == 'w' || key == 'W') {
        if (timeCount / 90 + 6 >= 10) {
          timeCount -= 1800;
          numLives++;
        }
      }
  
      if (key == 's' || key == 'S') {
        if (numLives >= 1) {
          timeCount += 900;
          numLives--;
        }
      }
    }
      
      
  }
}
  
/*
Again, these four methods are based on code from 
http://www.openprocessing.org/visuals/?visualID=7704
*/
void trees() {
  for (int x = 7; x >= 0; x--) {
    pushMatrix();
    translate(trees[x][1], trees[x][0]);
    //image(tree, x, height);
    fill(0, 120, 0);
    rotate(PI);
    triangle(-30, 0, 30, 0, 0, 90);
    noFill();
    //fill(0);
    noStroke();
    ellipse(0, 45, 30, 90);
  
  
    fill(51, 0, 0);
    rect(-10, -15, 20, 15);
  
    //image(tree, x, height);
    popMatrix();
  
    trees[x][0] = trees[x][0] - 5; //this controls the speed
  
    //trees[x][0] = trees[x][0] - 1; //for testing only
  
  
    if (trees[x][0] < -25) {
      trees[x][0] = width + 25;
      trees[x][1] = random(0, height);
    }
  
    if (dist(trees[x][1], trees[x][0], mouseX + 2, mouseY + 40) < trees[x][2] + 20 && numLives <= 0) { //the + 20 isn't based
      text("Game Over\n Play again?", width / 3, height/2); 
      activate = false;
      resumeGame = false;
    }
    else if (dist(trees[x][1], trees[x][0], mouseX + 2, mouseY + 40) < trees[x][2] + 20) {
      text("More lives left\n Click to continue", width / 5 + 100, height / 2);
      activate = false;
      resumeGame = true;
      if (mousePressed == true) {
        activate = true;
        reset();
        numLives--;
  
        if (numLives < 0) {
          numLives = 0;
        }
      }
    }
  }
}
  
void pills() {
  for (int x = 1; x >= 0; x--) {
    pushMatrix();
    translate(pills[x][1], pills[x][0]);
    fill(120, 0, 0);
    ellipse(20, 20, 20, 20);
    popMatrix();
  
    pills[x][0] = pills[x][0] - 5;
    //pills[x][0] = pills[x][0] - 1; //for testing only
  
  
    if (pills[x][0] < -25) {
      pills[x][0] = width + 25;
      pills[x][1] = random(0, height);
    }
    for (int y = 0; y <= 19; y++) { 
      if (pills[x][0] == trees[x][y] || pills[x][1] == trees[x][y]) {
        pills[x][0] = width + 25;
        pills[x][1] = random(0, height);
      }
  
      if (pills[x][1] == trees[x][y] || pills[x][0] == trees[x][y]) {
        pills[x][0] = width + 25;
        pills[x][1] = random(0, height);
      }
    }
    if (dist(pills[x][1], pills[x][0], mouseX - 5, mouseY - 5) < pills[x][2] + 7) {
      pills[x][0]=-500;
      pills[x][1]=random(0, height);
      timeCount+= 180;
      scoreCount +=10;
    }
  }
}
  
void lives() {
  for (int x = 1; x > 0; x--) {
    pushMatrix();
    translate(lives[x][1], lives[x][0]);
    fill(0, 0, 120);
    ellipse(20, 20, 20, 20);
    popMatrix();
  
    lives[x][0] = lives[x][0] - 5;
  
    //lives[x][0] = lives[x][0] - 1; //for testing only
  
  
    if (lives[x][0] < -5000) { //blue pills are rare
      lives[x][0] = width + 25;
      lives[x][1] = random(0, height);
    }
    for (int y = 0; y <= 19; y++) { 
      if (lives[x][0] == trees[x][y] || lives[x][1] == trees[x][y]) {
        lives[x][0] = width + 25;
        lives[x][1] = random(0, height);
      }
  
      if (lives[x][1] == trees[x][y] || lives[x][0] == trees[x][y]) {
        lives[x][0] = width + 25;
        lives[x][1] = random(0, height);
      }
    }
    if (dist(lives[x][1], lives[x][0], mouseX -5, mouseY -5) < pills[x][2] + 7) { 
      lives[x][0]=-500;
      lives[x][1]=random(0, height);
      numLives++;
    }
  }
}
  
void rocks() {
  for (int x = 1; x > 0; x--) {
    pushMatrix();
    translate(rocks[x][1], rocks[x][0]);
    fill(55);
    ellipse(20, 20, 50, 40);
    popMatrix();
  
    rocks[x][0] = rocks[x][0] - 5;
    //rocks[x][0] = rocks[x][0] - 1; //for testing only
  
  
    if (rocks[x][0] < -25) {
      rocks[x][0] = width + 25;
      rocks[x][1] = random(0, height);
    }
  
  
    if (dist(rocks[x][1], rocks[x][0], mouseX - 5, mouseY) < 20 && numLives <= 0) { 
      text("Game Over\n Play again?", width / 3, height/2); 
      activate = false;
      resumeGame = false;
    }
  
  
  
  
    if (dist(rocks[x][1], rocks[x][0], mouseX  - 5, mouseY) < 20 && numLives > 0) { 
      text("More lives left\n Click to continue", width / 5 + 100, height / 2);
      activate = false;
      resumeGame = true;
      if (mousePressed == true) {
        activate = true;
        reset();
        numLives--;
  
        if (numLives < 0) {
          numLives = 0;
        }
      }
    }
  }
}
  
  
  
void reset() {
  numLives--;
  
  if (numLives < 0) {
    numLives = 0;
  }
  
  for (int x = 7; x >= 0; x--) {
    trees[x][0] = random(5, 500);
    trees[x][1] = random(-500, -300);
    trees[x][2]=random(15, 25);
  }
  
  for (int x = 1; x >= 0; x--) {
    pills[x][0] = random(5, 500);
    pills[x][1] = random(-500, -300);
    pills[x][2] = random(15, 25);
  }
  
  for (int x = 1; x > 0; x--) {
    lives[x][0] = random(5, 500);
    lives[x][1] = random(-500, -300);
    lives[x][2] = random(15, 25);
  }
  
  for (int x = 4; x >= 0; x--) {
    rocks[x][0] = random(5, 500);
    rocks[x][1] = random(-500, -300);
    rocks[x][2] = random(15, 25);
  }
}

