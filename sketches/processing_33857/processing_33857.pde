
import ddf.minim.*;
Minim minim;
//import fullscreen.*; 
//SoftFullScreen fs; 

// MENU SCREEN RESOURCES --------------
AudioSnippet selector1;
AudioSnippet selector2;
AudioSnippet selected;
AudioSnippet claps;
PImage selectD;
PImage selectM;
PImage title;
PImage pressSpace;
PImage marinetti;
PImage duchamp;
PImage missionShovel;
PImage missionFountain;
PImage missionWheel;
Boolean DSelected = true;
Boolean MSelected = false;
Boolean keysActive = true;
int opacity = 255;
int fadeAmount = 4;
PImage dSelect1;
PImage dSelect2;
PImage dSelect3;
PImage createWheel;
PImage createShovel;
PImage createFountain;

// WHEEL GAME RESOURCES ----------------
PImage marinettiWheel;
PImage fountain;
PImage cloud1;
PImage cloud2;
float cloud1X = 800;
float cloud1Y;
float cloud2X = 1300;
float cloud2Y;
int charX = 100;
int charY = 285;
int jumpAmount = 3;
int jumpHeight;
float obstacleX = 1000;
Boolean jumpTrigger = false;
HLine h1 = new HLine(0, 6); 
HLine h2 = new HLine(300, 6); 
HLine h3 = new HLine(600, 6);
Boolean wheelRun = true;
PFont font;
int timer; //this is the timer that will count down
int start_time; //this is the where the timer starts
int delay_time = 1000; //this is the amount of time that needs to elapse before something happens

// PEE GAME RESOURCES ------------------
int arcEndX = 700;
float fountainX = 400;
float targetX = 400;
float easing = 0.03;
Boolean pee = false;
float peeScore = 0;
PImage marinettiP;
PImage fountain2;

//SHOVEL GAME RESOURCES -------------------
PImage mShovel;
PImage car;
int marX;
int snowL = 400;
int snowML = 400;
int snowM = 400;
int snowMR = 400;
int snowR = 400;

// for game state, 0 = title screen, 1 = character select, 2 = mission selection, 
// 3 = mini-games for Marinetti, 4 = mini-games for Duchamp
int gameState = 0;

// for mission select, 1 = shovel, 2 = fountain, 3 = wheel
int missionSelect = 1;


// THIS IS SETUP **************************************************

void setup() {
  size(800,600);
  smooth();
//frame.setBackground(new java.awt.Color(0, 0, 0));
  // Create the fullscreen object

  //fs = new SoftFullScreen(this); 
  
  // enter fullscreen mode
  //fs.enter(); 

  selectD = loadImage ("character_selectD.jpg");
  selectM = loadImage ("character_selectM.jpg");
  title = loadImage ("title1.jpg");
  pressSpace = loadImage ("pressSpace.png");
  marinetti = loadImage ("marinetti.png");
  duchamp = loadImage ("duchamp.png");
  missionShovel = loadImage ("missionShovel.jpg");
  missionFountain = loadImage ("missionFountain.jpg");
  missionWheel = loadImage ("missionWheel.jpg");
  minim = new Minim(this);
  selector1 = minim.loadSnippet("selector.wav");
  selector2 = minim.loadSnippet("selector.wav");
  selected = minim.loadSnippet("selected.wav");
  claps = minim.loadSnippet("claps.wav");
  dSelect1 = loadImage("dSelector1.jpg");
  dSelect2 = loadImage("dSelector2.jpg");
  dSelect3 = loadImage("dSelector3.jpg");
  createWheel = loadImage("createWheel.jpg");
  createShovel = loadImage("createShovel.jpg");
  createFountain = loadImage("createFountain.jpg");


  marinettiWheel = loadImage ("marinettiWheel.png");
  cloud1 = loadImage ("cloud.png");
  cloud2 = loadImage ("cloud.png");
  fountain = loadImage ("fountain.png");
  font = loadFont ("font.vlw"); //loading the font 
  textFont (font);

  marinettiP = loadImage ("marinettiPee.png");
  fountain2 = loadImage ("fountain2.png");
  ellipseMode(CORNERS);

  mShovel  = loadImage("mShovel.png");
  car = loadImage("car.png");
}

// *************************************************************


// THIS IS THE TITLE SCREEN ////////////////////////////////////

void titleScreen() {
  image(title, 0, 0);
  image(marinetti, 100, 200);
  image(duchamp, 250, 200);
  tint(255, opacity);
  image (pressSpace, 450, 400);
  tint (255, 255);
  opacity = opacity - fadeAmount;
  if (opacity <= 0 || opacity >= 255) {
    fadeAmount = - fadeAmount;
  }

  if (keyPressed && (key == ' ')) {
    selected.loop(0);
    gameState = 1;
  }
}

// /////////////////////////////////////////////////////////////


// THIS IS THE CHARACTER SELECT ********************************

void characterSelect() {

  if (DSelected) {
    image(selectD,0,0);
    MSelected = false;
  }
  else {
    image(selectM,0,0);
    MSelected = true;
  }

  if (keyPressed ) { // If a coded key is being pressed
    if (key == CODED) {
      if (keyCode == RIGHT) { //specifically the right arrow
        DSelected = false;
        if(!selector1.isPlaying()) {
          selector1.loop(0);
        }
      }
      else if (keyCode == LEFT) { // If it’s the left arrow being pressed
        DSelected = true;
        if(!selector2.isPlaying()) {
          selector2.loop(0);
        }
      }
    }
    if (key == ENTER || key == RETURN) {
      selected.loop(0);
      keysActive = false;
      gameState = 2;
    }
  }
}

// *************************************************************

// THIS IS THE MISSION SELECT SCREEN FOR MARINETTI /////////////

void selectMissionM() {
  int arcEndX = 700;
  float peeScore = 0;
  pee = false;
  int snowL = 400;
  int snowML = 400;
  int snowM = 400;
  int snowMR = 400;
  int snowR = 400;

  if (missionSelect == 1) {
    image(missionShovel, 0, 0);
  }

  if (missionSelect == 2) {
    image(missionFountain, 0, 0);
  }

  if (missionSelect == 3) {
    image(missionWheel, 0, 0);
  }

  if (keyPressed && keysActive) { 
    if (key == CODED ) { // If a coded key is being pressed
      if (keyCode == RIGHT) { //specifically the right arrow

        selector1.loop(0);

        missionSelect ++;
        if (missionSelect > 3) {
          missionSelect = 3;
        }
        keysActive = false;
      }
      else if (keyCode == LEFT) { // If it’s the left arrow being pressed

        selector2.loop(0);

        missionSelect--;
        if (missionSelect < 1) {
          missionSelect = 1;
        }
        keysActive = false;
      }
    }

    if (key == ENTER || key == RETURN) {
      selected.loop(0);
      timer = 30;
      charX = 100;
      obstacleX = 800;
      start_time = millis();
      peeScore = 0;
      pee = false;
      snowL = 400;
      snowML = 400;
      snowM = 400;
      snowMR = 400;
      snowR = 400;
      gameState = 3;
    }
  }
}

// /////////////////////////////////////////////////////////////


// THIS IS THE GAME FOR DUCHAMP ********************************

void runGameD() {
  if (missionSelect == 1) {
    image(dSelect1, 0, 0);
  }

  if (missionSelect == 2) {
    image(dSelect2, 0, 0);
  }

  if (missionSelect == 3) {
    image(dSelect3, 0, 0);
  }

  if (keyPressed && keysActive) { 
    if (key == CODED ) { // If a coded key is being pressed
      if (keyCode == RIGHT) { //specifically the right arrow

        selector1.loop(0);

        missionSelect ++;
        if (missionSelect > 3) {
          missionSelect = 3;
        }
        keysActive = false;
      }
      else if (keyCode == LEFT) { // If it’s the left arrow being pressed

        selector2.loop(0);

        missionSelect--;
        if (missionSelect < 1) {
          missionSelect = 1;
        }
        keysActive = false;
      }
    }

    if (key == ENTER || key == RETURN) {
      selected.loop(0);
      gameState = 4;
      keysActive = false;
    }
  }
}


// *************************************************************


// THIS IS THE MARINETTI WHEEL GAME ############################

void runWheelGame() {
  background(100,175,255);
  fill(100);
  stroke(0);
  strokeWeight(1);
  rect(0, 550, 800, 50);
  textAlign(LEFT);
  fill(255);
  textSize(14);
  text("left and right arrows to move", 10, 30);
  text("spacebar to jump", 10, 50);
  text("Escape successful in " + timer + " seconds", 10, 70);
  image(cloud1, cloud1X, cloud1Y);
  image(cloud2, cloud2X, cloud2Y);

  if (timer == 0) {
    background(100, 175, 255);
    image(marinettiWheel, charX, charY);
    textAlign(CENTER);
    textSize(48);
    text("you escaped!", width/2, 300);
    if(!claps.isPlaying()) {
      claps.loop(0);
    }
    if (millis()-start_time >= delay_time*3) {
      gameState = 2;
      wheelRun = true;
      obstacleX = 800;
      timer = 30;
      charX = 100;
    }
  }

  else {


    if (wheelRun) {

      //this is the timer function, every 1 second [because delay_time = 1000] the timer count drops by one  
      if (millis()-start_time >= delay_time) {
        start_time = millis();
        timer--;
      }

      h1.update(); 
      h2.update();  
      h3.update();
      obstacleX-=6;
      if (obstacleX < -200) {
        obstacleX = random(800, 1500);
      }


      if (cloud1X == 800) {
        cloud1Y = random(0, 200);
      }

      if (cloud2X == 800) {
        cloud2Y = random(0, 200);
      }


      cloud1X-=1.0;
      cloud2X-=0.7;

      if (cloud1X < -200) {
        cloud1X = 800;
      }

      if (cloud2X < -200) {
        cloud2X = 800;
      }

      if (keyPressed && key == CODED) {

        if (keyCode == LEFT) {
          charX-=2;
        }
        else if (keyCode == RIGHT) {
          charX+=2;
        }
      }

      if (keyPressed && key == ' ') {

        jumpTrigger = true;
      }


      if(jumpTrigger) {
        charY = charY - jumpAmount;
        if (charY < 190) {
          jumpAmount = -jumpAmount;
        }
        if (charY > 285) {
          jumpTrigger = false;
          jumpAmount = -jumpAmount;
        }
      }
    }

    if (!wheelRun) {
      h1.display(); 
      h2.display(); 
      h3.display();
      textAlign (CENTER);
      textSize(20);
      text("press shift to retry", width/2, 150);
      text("press backspace to return", width/2, 200);
      text("to title screen", width/2, 230);
      if (keyPressed && key == CODED && keyCode == SHIFT) {
        wheelRun = true;
        obstacleX = 800;
        timer = 30;
      }
    }

    image(fountain, obstacleX, 515);

    image(marinettiWheel, charX, charY);

    if (charY > 250 && charX > obstacleX - 80 && charX < obstacleX + 50) {
      wheelRun = false;
    }
  }
}

// #############################################################


// THIS IS THE MARINETTI PEE GAME ******************************

void runPeeGame() {

  background(100,175,255);
  textAlign(LEFT);

  if (peeScore >= 150) {
    image(marinettiP, 0, 60);
    fill(255);
    textSize(24);
    text("Defilement successful!", 225, 280);
    if(!claps.isPlaying()) {
      claps.loop(0);
    }
    if (millis()-start_time >= delay_time*3) {
      gameState = 2;
      peeScore = 0;
    }
  }

  else {
    strokeWeight(1);
    fill(100);
    rect(0, 550, 800, 50);
    fill(255);
    textSize(14);
    text("press spacebar to begin defiling", 10, 30);
    text("left and right arrows to position stream", 10, 50);
    if (millis()-start_time >= delay_time) {
      start_time = millis();
      targetX = random (360, 710);
    }


    float dfountainX = targetX - fountainX;
    if(abs(dfountainX) > 1) {
      fountainX += dfountainX * easing;
    }

    if (arcEndX < 400) {
      arcEndX=400;
    }

    if (arcEndX >= 780) {
      arcEndX=780;
    }

    if (keyPressed ) {
      if (key == ' ' && keysActive) {
        pee = !pee;
        keysActive = false;
      }
      if (key == CODED) {
        if (keyCode == LEFT) {
          arcEndX-=2;
        }
        else if (keyCode == RIGHT) {
          arcEndX+=2;
        }
      }
    }

    image(fountain2, fountainX, 480);
    if (pee) {
      noFill();  
      stroke(240, 230, 60, 130); 
      strokeWeight(3);
      arc(-600,235, arcEndX, 900, TWO_PI-PI/2, TWO_PI);
    }
    fill(100,175,255);
    noStroke();
    rect(0, 155, 100, 100);
    image(marinettiP, 0, 60);
    text("SCORE: " + peeScore, 500, 100);

    if (arcEndX > fountainX+45 && arcEndX < fountainX+90 && pee) {
      peeScore+=.25;
    }

    fill(255, 0, 0);
    noStroke();
    rect(600, 35, peeScore, 40);
    noFill();  
    stroke(0); 
    strokeWeight(2);
    rect(600, 35, 150, 40);
  }
}

// *************************************************************


// THIS IS THE SHOVEL GAME &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

void runShovelGame() {
  background(100,175,255);
  if (snowL > 475 && snowML > 525 && snowM > 525 && snowMR > 525 && snowR > 475) {

    image(mShovel, marX, 200);
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text("Snow Cleared!", width/2, 100);
    if(!claps.isPlaying()) {
      claps.loop(0);
    }
    if (millis()-start_time >= delay_time*3) {
      gameState = 2;
      snowL = 400;
      snowML = 400;
      snowM = 400;
      snowMR = 400;
      snowR = 400;
      marX = 0;
    }
  }
  else {
    start_time = millis();
    textAlign(LEFT);
    fill(255);
    textSize(14);
    text("left and right arrows to move", 10, 30);
    text("spacebar to dig", 10, 50);
    strokeWeight(1);
    fill(100);
    rect(0, 450, 800, 150);

    if (keyPressed) {
      if (key == CODED) {

        if (keyCode == LEFT) {
          marX-=2;
        }
        else if (keyCode == RIGHT) {
          marX+=2;
        }
      }
      if (key == ' ' && keysActive && marX <= 0) {
        snowL+=4;
        keysActive = !keysActive;
      }
      if (key == ' ' && keysActive && marX <= 150 && marX > 0) {
        snowML+=4;
        keysActive = !keysActive;
      }
      if (key == ' ' && keysActive && marX <= 350 && marX > 150) {
        snowM+=4;
        keysActive = !keysActive;
      }
      if (key == ' ' && keysActive && marX > 350 && marX < 550) {
        snowMR+=4;
        keysActive = !keysActive;
      }
      if (key == ' ' && keysActive && marX >= 550) {
        snowR+=4;
        keysActive = !keysActive;
      }
    }
    image(car, 80, 200);
    image(mShovel, marX, 200);
    fill(255);
    beginShape();
    vertex(-1, snowL);
    vertex(200, snowML);
    vertex(400, snowM);
    vertex(600, snowMR);
    vertex(800, snowR);
    vertex(800, 600);
    vertex(0, 600);
    endShape(CLOSE);
  }
}



// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


// THIS IS THE DRAW FUNCTION ///////////////////////////////////

void draw() {
  if (gameState == 0) {
    titleScreen();
  }

  else if (gameState == 1) {
    characterSelect();
  }

  else if (gameState == 2 && MSelected) {
    selectMissionM();
  }

  else if (gameState == 2 && DSelected) {
    runGameD();
  }

  else if (gameState == 3 && missionSelect == 1) {
    runShovelGame();
  }

  else if (gameState == 3 && missionSelect == 2) {
    runPeeGame();
  }

  else if (gameState == 3 && missionSelect == 3) {
    runWheelGame();
  }
  else if (gameState == 4 && missionSelect == 1) {
    image(createFountain, 0, 0);   
    if (keyPressed && keysActive && (key == ENTER || key == RETURN)) {
      selected.loop(0);
      keysActive = false;
      gameState = 2;
    }
  }
  else if (gameState == 4 && missionSelect == 2) {
    image(createShovel, 0, 0);
    if (keyPressed && keysActive && (key == ENTER || key == RETURN)) {
      selected.loop(0);
      keysActive = false;
      gameState = 2;
    }
  }
  else if (gameState == 4 && missionSelect == 3) {
    image(createWheel, 0, 0);
    if (keyPressed && keysActive && (key == ENTER || key == RETURN)) {
      selected.loop(0);
      keysActive = false;
      gameState = 2;
    }
  }

  if (keyPressed && key == BACKSPACE) {
    timer = 30;
    peeScore = 0;
    pee = false;
    snowL = 400;
    snowML = 400;
    snowM = 400;
    snowMR = 400;
    snowR = 400;
    marX = 0;
    charX = 100;
    obstacleX = 800;
    gameState = 0;
  }
  println("timer: " + timer + ", pee score: " + peeScore + ", snowM: " + snowM);
}

// /////////////////////////////////////////////////////////////


void keyReleased() {
  keysActive = true;
}



