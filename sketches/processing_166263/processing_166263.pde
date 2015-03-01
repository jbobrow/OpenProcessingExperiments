
//Space Invader Interactive Toy by Andrew Guan///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//*Shoot the aliens down before they kill you!

//Use left and right arrow keys to maneuver ship, use spacebar to shoot

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//initialize global variables
//set initial variables------------------------------------------------------------
int score=0; //sets score to 0
int numAliens=2; //total number of aliens=2
int lives=3;//set lives to 3
boolean hit=false; //hit is false, does not run drawHit
boolean gameOver=false; //gameOver is false, does not show game over screen
import ddf.minim.*;
Minim minim;
AudioPlayer theme;


//initialize classes----------------------------------------------------------------
//alien and spaceship class
Alien[] myAliens = new Alien [numAliens];
//class for lives scorekeeping
Lives myLives;

//setup attributes------------------------------------------------------------------
void setup() {
  size(400, 600);
  noStroke();
  background(0);
  createAliens();
  myLives=new Lives();
  frameRate(40);
  println("Use left and right arrows to move, spacebar to shoot.");
  minim = new Minim(this);
  //music from https://www.youtube.com/watch?v=fyTeZn2b46U
  theme = minim.loadFile("theme song.mp3");
}

//drawing method----------------------------------------------------------------------
void draw() {
  //runs while the player hasn't lost the game
  if (gameOver==false) {
    theme.play();
    background(0);
    //draws background elements like the green lines, placement of elements
    bgElements();

    //draw lives
    myLives.drawLives();

    //loops used to fill all indexes of array------------------------------------------
    //updates position of alien
    for (int i=0; i<myAliens.length; i++) {
      myAliens[i].update();
    }

    //draws the ship based on player input
    for (int i=0; i<myAliens.length; i++) {
      myAliens[i].drawShip();
    }

    //handles ship movement
    for (int i=0; i<myAliens.length; i++) {
      myAliens[i].movement();
    }

    //draws the actual aliens
    for (int i=0; i<myAliens.length; i++) {
      myAliens[i].drawAlien();
    }

    //detects if player has hit an alien
    for (int i=0; i<myAliens.length; i++) {
      myAliens[i].detection();
    }
    //makes screen blink red
    if (lives==1) {
      if (frameCount%20==0) {
        fill(255, 0, 0);
        rect(0, 0, 400, 600);
      }
    }
  }

  //runs when the player loses the game---------------------------------------
  if (gameOver==true) {
    myLives.ending();
  }
}

//method to draw background elements--------------------------------------
void bgElements() {
  fill(51, 255, 0);
  rect(0, 560, 400, 3);
  rect(0, 37, 400, 3);
  textSize(18);
  text("score:", 10, 25);
  text("lives:", 220, 25);
  fill(255);
  textSize(14);
  text(score, 65, 25);
}

//creates new alien at each new array index-----------------------------------------
void createAliens() {
  //loops until all indexes of array have filled
  for (int i=0; i<myAliens.length; i++) {
    myAliens[i]=new Alien(random(0, width-50), 0, random(1, 6));
  }
}

//global variable, sets laser's initial position to 0
float laserPosition=0;
//class for aliens and spaceship-------------------------------
class Alien {
  //create pvectors
  PVector position=new PVector();
  PVector velocity=new PVector(0, random(1, 2));
  PVector shipPosition=new PVector();

  //receives initial values to use for pvectors---------------------
  Alien(float x, float y, float velocityY) {
    position.x=x;
    position.y=y;
    velocity.y=velocityY;
    shipPosition.x=width/2;
  }

  //method used to update position of alien---------------------------------------------------
  void update() {

    //if the player has not lost yet
    if (gameOver==false) {

      //add velocity to previous position
      position.add(velocity);

      //when alien moves out of bounds
      if (position.y>height-10) {
        position.y=0;
        position.x=random(width-40);
        velocity.y=random(1, 2);
        lives=lives-1;
      }
      //increase speed if score is greater than or equal to 40
    if (score>=40) {
        velocity.y=random(10, 14);
      }
      //increase speed if score is greater than or equal to 30
      else if (score>=30) {
        velocity.y=random(8, 12);
      }
      //increase speed if score is greater than or equal to 15
      else if (score>=15) {
        velocity.y=random(5, 8);
      }
 
    }

    //if the player has lost the game, set alien positions to 0 so that the player won't immediately lose a life after game restarts
    if (gameOver==true) {
      position.y=0;
      position.x=random(width-40);
      velocity.y=random(1, 2);
    }
  }

  //method to draw the alien-----------------------------
  //alien ref: http://2.bp.blogspot.com/-PykZG0PmnMk/TwTQvI7LriI/AAAAAAAAAYM/3nYq5m3Hc10/s1600/space_invaders.jpg
  void drawAlien() {
    //easy alien
    if (score<15) {
      fill(255);
      rect(0+position.x, 85+position.y+10, 5, 15);
      rect(5+position.x, 80+position.y+10, 5, 10);
      rect(10+position.x, 75+position.y+10, 5, 25);
      rect(15+position.x, 100+position.y+10, 10, 5);
      rect(30+position.x, 100+position.y+10, 10, 5);
      rect(15+position.x, 90+position.y+10, 25, 5);
      rect(50+position.x, 85+position.y+10, 5, 15);
      rect(45+position.x, 80+position.y+10, 5, 10);
      rect(40+position.x, 75+position.y+10, 5, 25);
      rect(15+position.x, 70+position.y+10, 5, 5);
      rect(35+position.x, 70+position.y+10, 5, 5);
      rect(15+position.x, 75+position.y+10, 25, 5);
      rect(15+position.x, 85+position.y+10, 25, 5);
      rect(20+position.x, 80+position.y+10, 15, 5);
    }
    //medium alien
    if (score>=15&&score<30) {
      fill(255);
      rect(0+position.x, 100+position.y+10, 10, 5);
      rect(50+position.x, 100+position.y+10, 10, 5);
      rect(10+position.x, 95+position.y+10, 10, 5);
      rect(25+position.x, 95+position.y+10, 10, 5);
      rect(40+position.x, 95+position.y+10, 10, 5);
      rect(15+position.x, 90+position.y+10, 10, 5);
      rect(35+position.x, 90+position.y+10, 10, 5);
      rect(0+position.x, 75+position.y+10, 60, 15);
      rect(5+position.x, 70+position.y+10, 50, 5);
      rect(15+position.x, 65+position.y+10, 30, 5);
      fill(0);
      rect(15+position.x, 80+position.y+10, 10, 5);
      rect(35+position.x, 80+position.y+10, 10, 5);
    }
    //hard alien
    if (score>=30&&score<40) {
      fill(255);
      rect(15+position.x, 55+position.y+10, 10, 5);
      rect(10+position.x, 60+position.y+10, 20, 5);
      rect(5+position.x, 65+position.y+10, 30, 5);
      rect(0+position.x, 70+position.y+10, 40, 10);
      rect(10+position.x, 80+position.y+10, 5, 5);
      rect(25+position.x, 80+position.y+10, 5, 5);
      rect(5+position.x, 85+position.y+10, 5, 5);
      rect(15+position.x, 85+position.y+10, 10, 5);
      rect(30+position.x, 85+position.y+10, 5, 5);
      rect(0+position.x, 90+position.y+10, 5, 5);
      rect(10+position.x, 90+position.y+10, 5, 5);
      rect(25+position.x, 90+position.y+10, 5, 5);
      rect(35+position.x, 90+position.y+10, 5, 5);
      fill(0);
      rect(10+position.x, 70+position.y+10, 5, 5);
      rect(25+position.x, 70+position.y+10, 5, 5);
    }
    //insane alien
    if (score>=40) {
      fill(255, 0, 0);
      rect(15+position.x, 55+position.y+10, 10, 5);
      rect(10+position.x, 60+position.y+10, 20, 5);
      rect(5+position.x, 65+position.y+10, 30, 5);
      rect(0+position.x, 70+position.y+10, 40, 10);
      rect(10+position.x, 80+position.y+10, 5, 5);
      rect(25+position.x, 80+position.y+10, 5, 5);
      rect(5+position.x, 85+position.y+10, 5, 5);
      rect(15+position.x, 85+position.y+10, 10, 5);
      rect(30+position.x, 85+position.y+10, 5, 5);
      rect(0+position.x, 90+position.y+10, 5, 5);
      rect(10+position.x, 90+position.y+10, 5, 5);
      rect(25+position.x, 90+position.y+10, 5, 5);
      rect(35+position.x, 90+position.y+10, 5, 5);
      fill(0);
      rect(10+position.x, 70+position.y+10, 5, 5);
      rect(25+position.x, 70+position.y+10, 5, 5);
    }
  }
  //method to draw ship------------------------------------------
  //ship ref: https://uploads-riptapparel-com.s3.amazonaws.com/designs/1115/8bit-space-trip-detail_cached_thumb_-928107ac47da4bc345a3edd84ac43cf3.jpg
  void drawShip() {
    fill(51, 255, 0);
    rect(0+shipPosition.x, 535, 5, 25);
    rect(5+shipPosition.x, 545, 5, 10);
    rect(10+shipPosition.x, 520, 5, 30);
    rect(15+shipPosition.x, 530, 5, 25);
    rect(20+shipPosition.x, 520, 5, 30);
    rect(25+shipPosition.x, 500, 5, 60);
    rect(30+shipPosition.x, 520, 5, 30);
    rect(35+shipPosition.x, 530, 5, 25);
    rect(50+shipPosition.x, 535, 5, 25);
    rect(45+shipPosition.x, 545, 5, 10);
    rect(40+shipPosition.x, 520, 5, 30);
    fill(0);
    rect(20+shipPosition.x, 535, 15, 5);
    rect(25+shipPosition.x, 530, 5, 5);
    rect(30+shipPosition.x, 540, 5, 5);
    rect(20+shipPosition.x, 540, 5, 5);
  }

  //method that controls ship movement--------------------------------------------------
  void movement() {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT&&shipPosition.x>5) {
          //moves left left pixels on left key press
          shipPosition.x=shipPosition.x-12;
        }
      }
    }
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == RIGHT&&shipPosition.x<340) {
          //moves right 12 pixels on right key press (position constrained to screen)
          shipPosition.x=shipPosition.x+12;
        }
      }
    }
  }

  //method that detects if player has hit an alien--------------------------------------
  void detection() {
    if (keyPressed) {
      if (key == 32) {
        //draws laser
        fill(51, 255, 0, 100);
        rect(26.5+shipPosition.x, 520-laserPosition-40, 4, 20);
        laserPosition+=60;

        //reset laser position
        if (laserPosition>=750) {
          laserPosition=0;
        }
        //if the ship is in the same x position as alien (primitive detection method)
        if (position.x+30>=shipPosition.x&&position.x-30<shipPosition.x) {
          boolean hit=true;
          score+=1;
          drawHit();
        }
      }
    }
  }

  //draws hit animation----------------------------------------------------
  void drawHit() {
    fill(0);
    rect(0+position.x, 85+position.y+10, 5, 15);
    rect(5+position.x, 80+position.y+10, 5, 10);
    rect(10+position.x, 75+position.y+10, 5, 25);
    rect(15+position.x, 100+position.y+10, 10, 5);
    rect(30+position.x, 100+position.y+10, 10, 5);
    rect(15+position.x, 90+position.y+10, 25, 5);
    rect(50+position.x, 85+position.y+10, 5, 15);
    rect(45+position.x, 80+position.y+10, 5, 10);
    rect(40+position.x, 75+position.y+10, 5, 25);
    rect(15+position.x, 70+position.y+10, 5, 5);
    rect(35+position.x, 70+position.y+10, 5, 5);
    rect(15+position.x, 75+position.y+10, 25, 5);
    rect(15+position.x, 85+position.y+10, 25, 5);
    rect(20+position.x, 80+position.y+10, 15, 5);
    fill(51, 255, 0);
    rect(0+position.x, 85+position.y, 5, 15);
    rect(30+position.x, 85+position.y, 5, 15);
    rect(5+position.x, 80+position.y, 25, 5);
    rect(5+position.x, 100+position.y, 25, 5);
    position.x=random(0, width-50);
    position.y=0;
    hit=!hit;
  }
}

//initializes global variable
int distIncrease=0;
class Lives {

  //method that draws the icons for lives-------------------------------------------------
  void drawLives() {
    fill(51, 255, 0);
    if (lives==3) {
      rect(280+distIncrease, 20, 30, 10);
      rect(290+distIncrease, 10, 10, 10);
      rect(320+distIncrease, 20, 30, 10);
      rect(330+distIncrease, 10, 10, 10);
      rect(360+distIncrease, 20, 30, 10);
      rect(370+distIncrease, 10, 10, 10);

    }
    if (lives==2) {
      rect(280+distIncrease, 20, 30, 10);
      rect(290+distIncrease, 10, 10, 10);
      rect(320+distIncrease, 20, 30, 10);
      rect(330+distIncrease, 10, 10, 10);
    }
    if (lives==1) {
      rect(280+distIncrease, 20, 30, 10);
      rect(290+distIncrease, 10, 10, 10);

    }
    if (lives<1) {
      gameOver=true;
    }
  } 

  //method that draws game over screen--------------------------------------------
  void ending() {
    background(0);
    fill(255);
    textSize(32);
    text("score:", width/2-40, height/2);
    text(score, width/2-40, (height/2)+40);
    textSize(12);
    text("Press backspace to restart.", width/2, height/2+80);
    if (keyPressed) {
      if (key==8) {
        lives=3;
        score=0;
        gameOver=!gameOver;
      }
    }
  }
}



