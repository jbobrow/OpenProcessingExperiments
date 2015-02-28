
int start;
int count;
Timer timer;
String[] instruction;
boolean gameOver;
int myTimer;
int gameState; //if gameState=0=ingame, 1=lose, 2=win


PImage flashLight;
PFont inst;

//setup//////////////////////////////// 

void setup() {
  size(500, 500);
  myTimer = 150;
  //  timer = new Timer (10000);
  //  timer.start();
  //  start = millis();
  //  count = 100;
  //  println(count);
  frameRate(30);

  //instructions//////////////////////////

  textAlign(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  inst = loadFont ("futura.vlw");
  textFont (inst, 24);
  instruction = new String[25];

  instruction[0] = "hello";
  instruction[1] = "go down";
  instruction[2] = "go back";
  instruction[3] = "go right";
  instruction[4] = "submit C";
  instruction[5] = "B";
  instruction[6] = "yes go down";
  instruction[7] = "submit B or C";
  instruction[8] = "this way";
  instruction[9] = "wrong";
  instruction[10] = "go on";
  instruction[11] = "thank you";
  instruction[12] = "good";
  instruction[13] = "A";
  instruction[14] = "denied";
  instruction[15] = "one down";
  instruction[16] = "one right";
  instruction[17] = "submit A";
  instruction[18] = "get out";
  instruction[19] = "one left";
  instruction[20] = "all right";
  instruction[21] = "no";
  instruction[22] = "exit";
  instruction[23] = "fail";
  instruction[24] = "one up";
}



//draw////////////////////////////////////

void draw() {

  if (gameState == 0) {

    background(0, 33, 71);

    for (int i = 0; i < 500; i+=100) {
      for (int j = 0; j < 500; j+=100) {
        makeRect(50+i, 50+j);
      }
    }

    for (int x = 0; x < 500; x+=100) {
      for (int y = 0; y < 500; y += 100) {
        if (mouseX > x + 25 && mouseY > y + 25
          && mouseX < x + 75 && mouseY < y + 75) {
          if (mousePressed == true) {
            fill(255);
            text(instruction[(x+ (y*5))/100], x + 50, y + 50);
            println((x + (y*5))/100);
          }
        }
      }
    }

    flashLight = loadImage("alpha.png");
    image(flashLight, mouseX, mouseY);

    if (myTimer < 0) {
      gameState = 1;
    } 
    else {
      myTimer--;
      println(myTimer);
      text((myTimer/30) + 1, 400, 450);
    }
  }

  if (gameState == 1) {
    background(0);
    text("YOU ARE TOO LATE", 250, 250);
    text("press 'enter' to restart your application", 250, 300);
  }

  if (gameState == 2) {
    background(0);
    text("CONGRATULATIONS, YOU PASSED", width/2, height/2);
    text("press 'enter' to start again", width/2, height/2 + 50);
  }
}


//makeRect//////////////////////////////////////

void makeRect(int posX, int posY) {
  noStroke();
  fill(135, 206, 235);
  rect(posX, posY, 50, 50);
}

void keyPressed() {

  if (keyCode == ENTER) {
    gameState = 0;
    setup();
  }
}

void mouseClicked() {
  if (mouseX > 225 && mouseY > 425
    && mouseX < 275 && mouseY < 475) {
    gameState = 2;
  }
  
 else if(mouseX > 425 && mouseY > 175
  && mouseX < 475 && mouseY < 225){
 gameState = 1; 
  }
}


