
PImage donut_cursor; //create image donut_cursor
PImage homer1;
PImage homer2;
PImage homer3;
PImage nelson;
PImage lose;
PImage maggie;
PImage maggie2;
PImage nelson2;


int timer;
int nelsonactivatetimer= 5000;
int maggieactivatetimer = 7500;
int homer2activatetimer = 10000;

int nelson2activatetimer = 25000;
int maggie2activatetimer = 20000;
int homer3activatetimer = 15000;

int timeSurvived;

boolean menu = true; //menu system will load up at the start
boolean level_1= false; //level 1 will be activated from the menu
boolean timerlevel_1=false; //the timer for level 
boolean gameOverScreen = false; // game over screen will be activated from level 1
boolean winnersScreen = false;

float yPos = 30; //homer1's y pos
float xPos = 120;
float npos1 = 800;
float npos2 = 550;
float h2pos1 ;
float h2pos2 ;
float mpos1 = 700;
float mpos2 = 550;
float n2pos1 = 700;
float n2pos2 = 550;
float m2pos1 = 700;
float m2pos2 = 550;
float h3pos1;
float h3pos2;

float m = 10;
float n = 5;
float h2m = 5;
float h2n = 10;
float h3m = 10;
float h3n = 5;
int total_lives = 3;
int q =250;
int w = 300;
float e =1;
float r =1;
int pointCounter = 0;

void setup() {

  noStroke();
  frameRate(50);
  size(600, 600);
  createFont("ourfont.vlw", 48);
  createFont("ourfont1.vlw", 48);
  createFont("ourfont2.vlw", 48);
  createFont("ourfont3.vlw", 48);
  donut_cursor = loadImage("doughnut.png");
  donut_cursor.resize(50, 50);
  lose= loadImage("lose_screen.png");
  homer1 = loadImage("homer.fw.png");
  homer1.resize(150, 150);
  nelson= loadImage("nelson.png");
  nelson.resize(200, 200);
  timer= millis();
  maggie= loadImage("maggie.fw.png");
  maggie.resize(100, 100);
  homer2 = loadImage("homer.fw.png");
  homer2.resize(200, 200);
  homer3 = loadImage("homer.fw.png");
  homer3.resize(250, 250);
  maggie2 = loadImage("maggie.jpg");
  maggie2.resize(100, 100);
  nelson2 = loadImage("nelson.png");
  nelson2.resize(200, 200);
}

void draw() {

  if (menu == true && level_1 == false && gameOverScreen == false && winnersScreen == false) {
    runMenu();
  }

  if (level_1 == true && menu == false && gameOverScreen == false && winnersScreen == false) {
    background(255);
    runLevel_1();
    displayLivesTimePoints();
    runPointCounter();
  }

  if (gameOverScreen = true && level_1 == false && menu == false && winnersScreen == false) {
    gameover_screen();
  }

  if (winnersScreen == true && level_1 == false && menu == false && gameOverScreen == false) {
    winnersScreen();
  }
}


public void runMenu() {

  background(255, 255, 0);


  stroke(0); 
  fill(255);
  rect(200, 380, 200, 100);

  fill(0);
  PFont ourfont;
  ourfont = loadFont("ourfont.vlw");
  textFont(ourfont, 26);
  text("Homer's Doughnut Nightmare!", 150, 300);

  PFont ourfont1;
  ourfont1= loadFont("ourfont1.vlw");
  textFont(ourfont1, 24);
  text("Click Start To Play", 200, 340);

  PFont ourfont3;
  ourfont3 = loadFont("ourfont3.vlw");
  textFont(ourfont3, 24);
  text("Start", 265, 430);

  text("Did you know?", 200, 530);
  text("Eating doughnuts on a regular basis", 70, 560);
  text("increases the risk of heart disease.", 70, 580);

  if ((mousePressed) &&  (mouseY >= 380) && (mouseY <=480) && (mouseX >= 200) && (mouseX <= 400)) {
    menu = false;
    level_1 = true;
  }
}

public void runLevel_1() {

  runHomer1();
  runHomer2();
  runHomer3();
  runCursor();
  runCheck();
  timerlevel_1();
} 

public void runHomer1() {  

  imageMode(CENTER);
  image(homer1, xPos, yPos);

  if (yPos==height) {
    m=m*(-1);
  }

  if (yPos<0) {
    m=m*(-1);
  }
  yPos+=m;

  if (xPos==width) {
    n=n*(-1);
  }

  if (xPos<0) {
    n=n*(-1);
  }
  xPos+=n;
}

public void setHomer2Position() {
  if (timer == homer2activatetimer - 1) {
    h2pos1 = 570;
    h2pos2 = 480;
  }
}

public void runHomer2() {  

  setHomer2Position();

  int homer2timerlevel_1 = timer - homer2activatetimer;

  if (homer2timerlevel_1 > homer2activatetimer) {

    imageMode(CENTER);
    image(homer2, h2pos1, h2pos2);

    if (h2pos2==height) {
      h2m=h2m*(-1);
    }

    if (h2pos2<0) {
      h2m=h2m*(-1);
    }
    h2pos2+=h2m;

    if (h2pos1==width) {
      h2n=h2n*(-1);
    }

    if (h2pos1<0) {
      h2n=h2n*(-1);
    }

    h2pos1+=h2n;

    if (dist(pmouseX, pmouseY, h2pos1, h2pos2) <=125) {
      if (pmouseX < 300) {
        h2pos1 = 500;
      }
      else {
        h2pos1 = 200;
      }
      if (pmouseY < 300) {
        h2pos2 = 500;
      }
      else {
        h2pos2 = 200;
      }
      total_lives = total_lives - 1;
      pointCounter = pointCounter - 100;
    }
  }
}

public void setHomer3Position() {
  if (timer == homer3activatetimer - 1) {
    h3pos1 = 570;
    h3pos2 = 480;
  }
}

public void runHomer3() {  

  setHomer3Position();

  int homer3timerlevel_1 = timer - homer3activatetimer;

  if (homer3timerlevel_1 > homer3activatetimer) {

    imageMode(CENTER);
    image(homer3, h3pos1, h3pos2);

    if (h3pos2==height) {
      h3m=h3m*(-1);
    }

    if (h3pos2<0) {
      h3m=h3m*(-1);
    }
    h3pos2+=h3m;

    if (h3pos1==width) {
      h3n=h3n*(-1);
    }

    if (h3pos1<0) {
      h3n=h3n*(-1);
    }

    h3pos1+=h3n;

    if (dist(pmouseX, pmouseY, h3pos1, h3pos2) <=125) {
      if (pmouseX < 300) {
        h3pos1 = 500;
      }
      else {
        h3pos1 = 200;
      }
      if (pmouseY < 300) {
        h3pos2 = 500;
      }
      else {
        h3pos2 = 200;
      }
      total_lives = total_lives - 1;
      pointCounter = pointCounter - 100;
    }
  }
}


public void runCursor() {

  imageMode(CENTER);       
  image(donut_cursor, mouseX, mouseY);
}

public void runCheck() {

  if (total_lives == 0) {
    level_1 = false;
    gameOverScreen = true;
  }

  if (total_lives > 0) {
    if (timer > 60000) {
      level_1 = false;
      winnersScreen = true;
    }
  }

  if (total_lives > 0) {

    if (dist(pmouseX, pmouseY, xPos, yPos) <=75) {
      if (pmouseX < 300) {
        xPos = 500;
      }
      else {
        xPos = 100;
      }
      if (pmouseY < 300) {
        yPos = 500;
      }
      else {
        yPos = 150;
      }
      total_lives = total_lives -1;
      pointCounter = pointCounter - 100;
    }
    if (dist(pmouseX, pmouseY, npos1, npos2) <=125) {

      npos1 = 0;
      npos2 = 800;
      total_lives = total_lives -1;
      pointCounter = pointCounter - 1000;
    }
    if (dist(pmouseX, pmouseY, mpos1, mpos2) <=75) {
      mpos1 = 0;
      mpos2 = 800;
      total_lives = total_lives + 1;
      pointCounter = pointCounter + 100;
    }

    if (dist(pmouseX, pmouseY, n2pos1, n2pos2) <=125) {

      n2pos1 = 0;
      n2pos2 = 800;
      total_lives = total_lives -1;
      pointCounter = pointCounter - 1000;
    }
    if (dist(pmouseX, pmouseY, m2pos1, m2pos2) <=75) {
      m2pos1 = 0;
      m2pos2 = 800;
      total_lives = total_lives + 1;
      pointCounter = pointCounter + 100;
    }
  }
  else {
    noLoop();
  }
}

public void displayLivesTimePoints() {   

  fill(0);
  PFont ourfont2;
  ourfont2 = loadFont("ourfont2.vlw");
  textFont(ourfont2, 26);
  text("total lives: " + total_lives, 4, 30);
  text("total points: " + pointCounter, 4, 60);
  text("time survived: " + timeSurvived, 4, 90);
}


public void timerlevel_1() {

  timerlevel_1=true;
  int nelsontimerlevel_1 = timer - nelsonactivatetimer;
  int maggietimerlevel_1 = timer - maggieactivatetimer; 
  int nelson2timerlevel_1 = timer - nelson2activatetimer;
  int maggie2timerlevel_1 = timer - maggie2activatetimer;  

  if (nelsontimerlevel_1 > nelsonactivatetimer) {
    imageMode(CENTER); 
    image(nelson, npos1, npos2);
    npos1-=10;
    npos2-=5;
  }

  if (maggietimerlevel_1 > maggieactivatetimer) {
    imageMode(CENTER);
    image(maggie, mpos1, mpos2);
    mpos1-=10;
    mpos2-=5;
  }

  if (nelson2timerlevel_1 > nelson2activatetimer) {
    imageMode(CENTER); 
    image(nelson2, n2pos1, n2pos2);
    n2pos1-=10;
    n2pos2-=5;
  }

  if (maggie2timerlevel_1 > maggie2activatetimer) {
    imageMode(CENTER);
    image(maggie2, m2pos1, m2pos2);
    m2pos1-=10;
    m2pos2-=5;
  }


  timer= millis();

  timeSurvived = timer/1000;
}

public void gameover_screen() {

  background(255);
  image(lose, 300, 200);
  fill(0);
  text("Game Over", 230, 450);
  text("Final Score: " + pointCounter, 230, 475);
  text("Did you know?", 200, 500);
  text("Doughnuts contain high levels of sugar.", 50, 540);
  text("Eating too many can cause high blood", 50, 560);
  text("glucose levels!", 50, 580);
}

public void runPointCounter() {

  pointCounter++;
}  

public void winnersScreen() {

  background(255);
  fill(0);
  text("Did you know?", 200, 400);
  text("Even a single doughnut a day", 50, 445);
  text("can lead to significant weight gain over time.", 50, 485);


  text("You Win!", 240, 200); 
  text("Final Score: " + pointCounter, 230, 245);
}


