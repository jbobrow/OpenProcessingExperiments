
//color fillVal = color(1806); //this was just to see if keys respond
PImage skier;
PImage heart;
PImage tree;
int timeCount;
int fieldTimeCount;
boolean activate;

boolean forceFieldReady;
boolean forceFieldOn;

int scoreCount;
int numLives = 2; //only because reset is called twice
boolean resumeGame;
//ArrayList<point> deathPoints = new ArrayList<point>();

float[][] trees = new float[20][20];
float[][] pills = new float[5][3];
float[][] lives = new float[5][3];
float[][] fields = new float[5][3];
float[][] rocks = new float[5][3];

void setup() {
  timeCount = 180;
  fieldTimeCount = 180;
  size(700, 700);
  reset(); 
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
    fieldTimeCount = 3;
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

    //image(tree, width / 2, height / 2);

    //reset();

    trees();
    pills();
    lives();
    rocks();
    fields(); 

    textSize(50);
    fill(0);
    text(timeCount / 180 + 10, heart.width + 30, heart.height * 1.55);
    fill(0);
    text("Score: " + scoreCount, width - 300, heart.height * 1.55);
    fill(0);
    textSize(30);
    text("Lives: " + numLives, width / 2 - 50, heart.height + 100);
    fill(0);
    if (timeCount / 180 + 10 > -1) { //the whole if statement is actually unnecessary...just the middle is needed
      timeCount--;
    }

    if (forceFieldReady == true && forceFieldOn == false) {
      textSize(30);
      fill(255, 150, 0);
      text("Click for Force Field", width / 2 - 130, heart.height  + 60);
    }

    if (forceFieldReady == true && mousePressed) {
      forceFieldReady = false;
      forceFieldOn = true;

    }
    
    if (forceFieldOn == true) {
      fill(255, 150, 0);
      text("Force Field ON", width / 2 - 100, heart.height  + 60);
      fill(255, 150, 0);
      ellipse(mouseX, mouseY, 60, 60); //circle surrounding skier with orange
      textSize(35);
      fill(255, 150, 0);
      text(fieldTimeCount / 180 + 3, mouseX - 5, mouseY - 40); //draws field time count 
      if (fieldTimeCount / 180 + 3 > 0) {
        fieldTimeCount--;
      } else {
        fieldTimeCount = 0;
        forceFieldOn = false;
      }
    }
    
    image(skier, mouseX - skier.width / 2, mouseY - skier.height / 2);

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


void trees() {
  for (int x = 5; x >= 0; x--) {
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
    if (scoreCount < 150) { //controls speed
      trees[x][0] = trees[x][0] - 2;
    } 
    else if (scoreCount > 150 && scoreCount < 500 ) {
      trees[x][0] = trees[x][0] - 3;
    } 
    else if (scoreCount > 500 && scoreCount < 750 ) {
      trees[x][0] = trees[x][0] - 4;
    } 
    else if (scoreCount > 750 && scoreCount < 1000 ) {
      trees[x][0] = trees[x][0] - 5;
    } 
    else if (scoreCount > 1000 && scoreCount < 1250 ) {
      trees[x][0] = trees[x][0] - 6;
    } 
    else if (scoreCount > 1500 && scoreCount < 2000 ) {
      trees[x][0] = trees[x][0] - 7;
    } 
    else {
      trees[x][0] = trees[x][0] - 4;
    }





    if (trees[x][0] < -25) {
      trees[x][0] = width + 25;
      trees[x][1] = random(0, height);
    }

    if (forceFieldOn == false && dist(trees[x][1], trees[x][0], mouseX + 2, mouseY + 40) < trees[x][2] + 20 && numLives <= 0) { //the + 20 isn't based
      text("Game Over\n Play again?", width / 3, height/2); //on a formula, but it makes the game more fair
      activate = false;
      resumeGame = false;
    } 
    else if (forceFieldOn == false && dist(trees[x][1], trees[x][0], mouseX + 2, mouseY + 40) < trees[x][2] + 20) {
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
  for (int x = 4; x >= 0; x--) {
    pushMatrix();
    translate(pills[x][1], pills[x][0]);
    fill(120, 0, 0);
    ellipse(20, 20, 20, 20);
    popMatrix();

    if (scoreCount < 150) { //controls speed
      pills[x][0] = pills[x][0] - 2;
    } 
    else if (scoreCount > 150 && scoreCount < 500 ) {
      pills[x][0] = pills[x][0] - 3;
    } 
    else if (scoreCount > 500 && scoreCount < 750 ) {
      pills[x][0] = pills[x][0] - 4;
    } 
    else if (scoreCount > 750 && scoreCount < 1000 ) {
      pills[x][0] = pills[x][0] - 5;
    } 
    else if (scoreCount > 1000 && scoreCount < 1250 ) {
      pills[x][0] = pills[x][0] - 6;
    } 
    else if (scoreCount > 1500 && scoreCount < 2000 ) {
      pills[x][0] = pills[x][0] - 7;
    } 
    else {
      pills[x][0] = pills[x][0] - 4; //note that it may slow here
    }


    if (pills[x][0] < -25) {
      pills[x][0] = width + 25;
      pills[x][1] = random(0, height);
    }
    for (int y = 0; y <= 19; y++) { //attempt to not put pills where trees are
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

    if (scoreCount < 150) { //controls speed
      lives[x][0] = lives[x][0] - 2;
    } 
    else if (scoreCount > 150 && scoreCount < 500 ) {
      lives[x][0] = lives[x][0] - 3;
    } 
    else if (scoreCount > 500 && scoreCount < 750 ) {
      lives[x][0] = lives[x][0] - 4;
    } 
    else if (scoreCount > 750 && scoreCount < 1000 ) {
      lives[x][0] = lives[x][0] - 5;
    } 
    else if (scoreCount > 1000 && scoreCount < 1250 ) {
      lives[x][0] = lives[x][0] - 6;
    } 
    else if (scoreCount > 1500 && scoreCount < 2000 ) {
      lives[x][0] = lives[x][0] - 7;
    } 
    else {
      lives[x][0] = lives[x][0] - 4;
    }


    if (lives[x][0] < -5000) { //blue pills are rare
      lives[x][0] = width + 25;
      lives[x][1] = random(0, height);
    }
    for (int y = 0; y <= 19; y++) { //attempt to not put pills where trees are
      if (lives[x][0] == trees[x][y] || lives[x][1] == trees[x][y]) {
        lives[x][0] = width + 25;
        lives[x][1] = random(0, height);
      }

      if (lives[x][1] == trees[x][y] || lives[x][0] == trees[x][y]) {
        lives[x][0] = width + 25;
        lives[x][1] = random(0, height);
      }
    }
    if (dist(lives[x][1], lives[x][0], mouseX -5, mouseY -5) < pills[x][2] + 7) { //60 is the circle's radius
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

    if (scoreCount < 150) { //controls speed
      rocks[x][0] = rocks[x][0] - 2;
    } 
    else if (scoreCount > 150 && scoreCount < 500 ) {
      rocks[x][0] = rocks[x][0] - 3;
    } 
    else if (scoreCount > 500 && scoreCount < 750 ) {
      rocks[x][0] = rocks[x][0] - 4;
    } 
    else if (scoreCount > 750 && scoreCount < 1000 ) {
      rocks[x][0] = rocks[x][0] - 5;
    } 
    else if (scoreCount > 1000 && scoreCount < 1250 ) {
      rocks[x][0] = rocks[x][0] - 6;
    } 
    else if (scoreCount > 1500 && scoreCount < 2000 ) {
      rocks[x][0] = rocks[x][0] - 7;
    } 
    else {
      rocks[x][0] = rocks[x][0] - 4;
    }


    if (rocks[x][0] < -25) {
      rocks[x][0] = width + 25;
      rocks[x][1] = random(0, height);
    }


    if (forceFieldOn == false &&  dist(rocks[x][1], rocks[x][0], mouseX - 5, mouseY) < 20 && numLives <= 0) { //60 is the circle's radius
      text("Game Over\n Play again?", width / 3, height/2); //on a formula, but it makes the game more fair
      activate = false;
      resumeGame = false;
    }




    if (forceFieldOn == false &&  dist(rocks[x][1], rocks[x][0], mouseX  - 5, mouseY) < 20 && numLives > 0) { //60 is the circle's radius
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

void fields() {
  for (int x = 1; x > 0; x--) {
    pushMatrix();
    translate(fields[x][1], fields[x][0]);
    fill(255, 150, 0); //orange
    ellipse(20, 20, 20, 20);
    popMatrix();

    if (scoreCount < 150) { //controls speed
      fields[x][0] = fields[x][0] - 2;
    } 
    else if (scoreCount > 150 && scoreCount < 500 ) {
      fields[x][0] = fields[x][0] - 3;
    } 
    else if (scoreCount > 500 && scoreCount < 750 ) {
      fields[x][0] = fields[x][0] - 4;
    } 
    else if (scoreCount > 750 && scoreCount < 1000 ) {
      fields[x][0] = fields[x][0] - 5;
    } 
    else if (scoreCount > 1000 && scoreCount < 1250 ) {
      fields[x][0] = fields[x][0] - 6;
    } 
    else if (scoreCount > 1500 && scoreCount < 2000 ) {
      fields[x][0] = fields[x][0] - 7;
    } 
    else {
      fields[x][0] = fields[x][0] - 4;
    }


    if (fields[x][0] < -5000) { //fields are rare
      fields[x][0] = width + 25;
      fields[x][1] = random(0, height);
    }
    for (int y = 0; y <= 19; y++) { //attempt to not put fields where trees are
      if (fields[x][0] == trees[x][y] || fields[x][1] == trees[x][y]) {
        fields[x][0] = width + 25;
        fields[x][1] = random(0, height);
      }

      if (fields[x][1] == trees[x][y] || fields[x][0] == trees[x][y]) {
        fields[x][0] = width + 25;
        fields[x][1] = random(0, height);
      }
    }
    if (dist(fields[x][1], fields[x][0], mouseX -5, mouseY -5) < fields[x][2] + 7) { //is it fields there, last word?  Not pills?
      fields[x][0]=-500;
      fields[x][1]=random(0, height);
      forceFieldReady = true;
    }
  }
}



void reset() {
  numLives--;

  if (numLives < 0) {
    numLives = 0;
  }

  for (int x = 5; x >= 0; x--) {
    trees[x][0] = random(5, 500);
    trees[x][1] = random(-500, -300);
    trees[x][2]=random(15, 25);//size
    //trees[x][19]=random(.5,1.5);//speed
  }

  for (int x = 4; x >= 0; x--) {
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

  for (int x = 1; x > 0; x--) {
    fields[x][0] = random(5, 500);
    fields[x][1] = random(-500, -300);
    fields[x][2] = random(15, 25);
  }
}


