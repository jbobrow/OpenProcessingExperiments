
//puzzle game

//variables that change
int proX;
int proY;
int proMovementX;
int proMovementY;

boolean upButton;         //booleans
boolean downButton;
boolean leftButton;
boolean rightButton;

boolean firstSwitch;      
boolean secondSwitch;
boolean thirdSwitch;
boolean fourthSwitch;

boolean litOne;
boolean litTwo;
boolean litThree;
boolean litFour;

int proSpeed;
int gameState;              //0 = pregame, 1 = in-game 2 = game over

PImage pro;                  //images
PImage portable;
PImage portableoff;
PImage blocks;
PImage rainbow;
PImage menu;
PImage press;

//constants
PFont startText;
PFont manual;
PFont gameOver;

void setup()
{
  size (800, 800);
  smooth ();

  proX = width - 100;                //declaring variables
  proY = height/2;
  proMovementX = 3;
  proMovementY = 3;
  proSpeed = 5;

  upButton = false;                    //booleans
  downButton = false;
  leftButton = false;
  rightButton = false;

  firstSwitch = false;
  secondSwitch = false;
  thirdSwitch = false;
  fourthSwitch = false;

  litOne = false;
  litTwo = false;
  litThree = false;
  litFour = false;

  gameState = 0;                                            //game state

  startText = loadFont ("Courier-Bold-48.vlw");                        //texts
  manual = loadFont ("Courier-16.vlw");
  gameOver = loadFont ("Courier-26.vlw");

  pro = loadImage("pro.png");                                            //pngs
  portable = loadImage("portable.png");
  portableoff = loadImage("portableoff.png");
  blocks = loadImage("blocks.png");
  rainbow = loadImage("rainbow.png");
  menu = loadImage("menu.png");
  press = loadImage("press.png");
}

void draw ()
{
  background (40, 40, 40);

  if (gameState == 0) {                                //main menu
    fill (0, random(255), random(255));
    rectMode(CENTER);
    rect (width/2, height/2, width, height);
    imageMode(CENTER);
    image(menu, width/2, height/2, width, height);
    if (keyPressed && key == 's') {
      gameState = 1;
    }
  }

  if (gameState == 2) {                                                   //GAME OVER
    background (random(255), random(255), random(255));
    fill (255);
    textFont (gameOver);
    text("Are you an androidist?", width/4, height/4);
    text("...then why did you kill him?", width/4, 230);
    text ("Press R to start again", width/4, 550);  
    if (keyPressed && key == 'r') {
      gameState = 0;
      setup();
    }
  }


  if (gameState == 1) {                    //GAMESTART GAMESTART GAMESTART GAMESTART GAMESTART GAMESTART GAMESTART GAMESTART
    if (proX <= width/4+30) {                                      //if protagonist touches electric wall
      gameState = 2;
    }

    puzzle();                                            //insert puzzle combination into game

    image(portableoff, 120, 220, 60, 80);                        //portaloff
    image(portableoff, width-150, height-270, 60, 80);        //portaloff
    image(rainbow, 120, 580, 80, 80);                          //rainbow

    stroke (254, 46, 255);
    strokeWeight (14);
    noFill ();
    rectMode (CENTER);
    rect (width/2, height/2, width - 100, height - 300);           //walls
    fill (254, 46, 255);

    //squares
    noStroke();  
    fill (155);
    rectMode(CENTER);                                         
    rect (250, height/2, 50, 50);
    if (proX > 230 && proX < 270 && proY > 380 && proY < 420) {                                                          //when protagonist steps on squares
      if (firstSwitch == false && secondSwitch == false && thirdSwitch == false && fourthSwitch == false) {
        firstSwitch = true;
        fill (255);
        rectMode(CENTER);                                       
        rect (250, height/2, 50, 50);
      }
    }

    noStroke();  
    fill (155);
    rectMode(CENTER);
    rectMode (CENTER);
    rect (350, 550, 150, 150);  
    if (proX > 300 && proX < 390 && proY > 500 && proY < 600) {
      if (firstSwitch == true && secondSwitch == false && thirdSwitch == false && fourthSwitch == false) {  
        secondSwitch = true;
        fill (255);
        rectMode (CENTER);
        rect (350, 550, 150, 150);
      }
    }

    noStroke();  
    fill (155);
    rectMode(CENTER);
    rect (500, 250, 100, 100);
    if (proX > 460 && proX < 540 && proY > 210 && proY < 290) { 
      if (firstSwitch == true && secondSwitch == true && thirdSwitch == false && fourthSwitch == false) {
        thirdSwitch = true;
        fill (255);
        rectMode(CENTER);
        rect (500, 250, 100, 100);
      }
    }

    noStroke();  
    fill (155);
    rectMode (CENTER);
    rect (600, 200, 60, 60); 
    if (proX > 580 && proX < 620 && proY > 180 && proY < 220) {
      if (firstSwitch == true && secondSwitch == true && thirdSwitch == true && fourthSwitch == false) {
        fourthSwitch = true;
        fill (255);
        rectMode (CENTER);
        rect (600, 200, 60, 60);
      }
    } 


    fill (254, 46, 255);
    textFont(manual);
    text("Objective: Enter the Rainbow", width/17, 700);            //instructions
    text("Use arrows to move your android", width/17, 720);
    text("Move android over squares to trigger and activate portal", width/17, 740);


    noStroke();
    image(pro, proX, proY, 30, 40);                                //protagonist movement

    if (upButton == true) {
      proY -= proSpeed;
    }
    if (downButton == true) {
      proY += proSpeed;
    }
    if (leftButton == true) {
      proX -= proSpeed;
    } 
    if (rightButton == true) {
      proX += proSpeed;
    }   
    if (proY< 180) {                                               //protagonist boundaries
      proY = 180;
    }
    if (proY > height-180) {
      proY = height-180;
    }
    if (proX < 110) {
      proX = 110;
    }
    if (proX > width - 70) {
      proX = width-70;
    }


    stroke (random(255), random(255), random(255));                     //electric wall 
    strokeWeight (35);
    line (width/4, 180, width/4, height-180);
    

  }                                                                     //in-game boundary
}

void puzzle () {
  if (firstSwitch == true && secondSwitch == false && thirdSwitch == false && fourthSwitch == false) {
    if (litOne ==false && litTwo == false && litThree == false && litFour == false) {
      litOne = true;
    }
  }
  if (firstSwitch == true && secondSwitch == true && thirdSwitch == false && fourthSwitch == false) {
    if (litOne ==true && litTwo == false && litThree == false && litFour == false) {
      litTwo = true;
    }
  }
  if (firstSwitch == true && secondSwitch == true && thirdSwitch == true && fourthSwitch == false) {
    if (litOne ==true && litTwo == true && litThree == false && litFour == false) {
      litThree = true;
    }
  }
  if (firstSwitch == true && secondSwitch == true && thirdSwitch == true && fourthSwitch == true) {           //when combination is correct
    if (litOne ==true && litTwo == true && litThree == true && litFour == false) {
      litFour = true;
      image(portable, 120, 220, 60, 80);
      image(portable, width-150, height-270, 60, 80);
      if (litOne ==true && litTwo == true && litThree == true && litFour == true) {
        if (proX > 600 && proX < 700 && proY > 500 && proY < 600) {
         proX = 120;
         proY = 220;  
      }
      } 
    }
  }
 
}


void keyPressed()
{
  if (keyCode == UP) {                                                            //arrow keys
    upButton = true;
  }
  if (keyCode == DOWN) {
    downButton = true;
  }  
  if (keyCode == LEFT) {
    leftButton = true;
  }
  if (keyCode == RIGHT) {
    rightButton = true;
  }
}

void keyReleased()
{
  if (keyCode == UP) {
    upButton = false;
  }
  if (keyCode == DOWN) {
    downButton = false;
  }  
  if (keyCode == LEFT) {
    leftButton = false;
  }
  if (keyCode == RIGHT) {
    rightButton = false;
  }
}


