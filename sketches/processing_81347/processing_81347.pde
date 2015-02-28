
/*
IAT 800 Project 2: A: Create a computer game in Processing.
 Amber Choo
 achoo@sfu.ca
 Comments: Use WASD to move and space bar to shoot. You are the green tank - shoot everything that moves. Your goal is to survive for as long as possible :)
 Each vehicle inherits information from the abstract Vehicle class. Player, Chomp, and Bluetank are subclasses of the Vehicle class. The Chomp is overloaded. 
 Chomp pixel art by Neslug (deviantart)
 Sounds from soundjax.com
 */

import gifAnimation.*; //import gifAnimation from library
import ddf.minim.*; //import Minim from library for sound
PImage img; //creates img of PImage type. THis is the background
PImage button; //creates button of PImage type. This is the endgame button
PImage menu; //creates menu of PImage type. This is the starting game menu
//declare some variables:

float myLocX; //x axis location of the player
float myLocY; //y axis location of the player
//locational variables for ChompyChomps
float eLocX; 
float eLocY; 
float e2LocX; 
float e2LocY; 
//locational variables for bluetank/bullets
float xAttack;
float yAttack;

//import all of my animated gifs:
Gif playerGoesRight; 
Gif playerGoesLeft; 
Gif playerGoesUp; 
Gif playerGoesDown; 
Gif Chompy; 
Gif bluetankGoesDown;
Gif bulletLeft;
Gif bulletRight;
Gif bulletUp;
Gif bulletDown;

//Prep to use T2Cannon.mp3 as shooting sound effect:
Minim tankCannonSound; //declares tankCannonSound as a Minim
AudioPlayer tankSound; //declares tankSound as an AudioPlayer 

//create instances of classes:
Player player1;
Bluetank bluetank1;

void draw() {
  image(img, 0, 0); //700x700 pix. loads the background image
  //show and allow movement for the two chomps
  h1.display();
  h1.movement();
  h2.display();
  h2.movement();
  //show and allow movement/attacking for bluetank
  bluetank1.display();
  bluetank1.movement();
  bluetank1.attack();
  bluetank1.isTankShooting();
  bluetank1.blueTankSound(); //sound patch for bluetank
  //show and allow player movement/collision behaviours/keyboard and shooting behaviours
  player1.display();
  player1.movement();
  player1.collision();
  player1.keyReleased();
  player1.bullet();
  player1.isPlayerShooting();
  player1.beforeGameStarts();
}

void setup() {
  size(700, 700); //change the size of the canvas to the size of the background image

  //Prep to use T2Cannon.mp3 as shooting sound effect:
  tankCannonSound = new Minim(this); //declare tankCannonSound a new minim
  tankSound = tankCannonSound.loadFile("T2Cannon.mp3", 2048); //assigns AudioPlayer tankSound to tankCannonSound which loads T2Cannon.mp3 when triggered

  img = loadImage("BG.jpg"); //assign img to BG.JPG, to be used as the background (700x700 pix)
  button = loadImage("button.jpg"); //endgame button
  menu = loadImage("menu.jpg");
  //create new Gifs and assign them to actual gif files in the data folder:
  bulletUp = new Gif(this, "bulletUp.gif");
  bulletDown = new Gif(this, "bulletDown.gif");
  bulletLeft = new Gif(this, "bulletLeft.gif");
  bulletRight = new Gif(this, "bulletRight.gif");
  playerGoesRight = new Gif(this, "playerRight.gif");
  playerGoesLeft = new Gif(this, "playerLeft.gif"); 
  playerGoesUp = new Gif(this, "playerUp.gif"); 
  playerGoesDown = new Gif(this, "playerDown.gif"); 
  Chompy = new Gif(this, "ChompByNeslug.gif"); 
  bluetankGoesDown = new Gif(this, "bluetankDown.gif");

  //all gifs must be told to play when called:
  playerGoesRight.play(); 
  playerGoesLeft.play(); 
  playerGoesUp.play(); 
  playerGoesDown.play();
  Chompy.play(); 
  //initialize player and bluetank
  player1 = new Player(100, 600);
  bluetank1 = new Bluetank(300, 0);
}

abstract class Vehicle { //abstract class cannot be called, but is useful as a reference for subclasses
  PFont f = createFont("Impact", 100, true); //set the font characteristics for all numbers //font Impact to be used for game over message
  boolean gameOverTime = false; //the game is not yet over
  boolean canWeStartYet = false; //game is paused at start
  float xPosition; //abstract x positioning 
  float yPosition; //abstract y positioning
  Vehicle(float xPos, float yPos) { //a vehicle normally consists of two floats
    xPosition = xPos; //x positioning, 
    yPosition = yPos; //and y positioning
  }

  void beforeGameStarts() {  //function that runs the opening menu before gameplay
    if (canWeStartYet == false) { //if the game hasn't started yet
      fill(0, 0, 0, 100); //transparent black
      rect(0, 0, 700, 700); //transparent black covers the screen
      image(menu, 150, 150); //print the menu image
    }
  }

  void startTheGame() { //function called when player presses P to start game
    canWeStartYet = true; //boolean triggers movement and behaviours when game is supposed to start
  }

  void gameOver() { //called to trigger game over scenario
    gameOverTime = true; //this will disable some pieces of code when called (ex: player movement when hit by a chomp)
    textFont(f, 70); //font size is 70pt
    fill(0, 0, 0, 50); //transparent black
    rect(0, 0, 700, 700); //transparent black covers the screen
    fill(0); //black
    text("Game Over!", width/2-170, height/2); //print the text "game over" in the middle of the screen
    textFont(f, 40); //font size is 70pt
    image(button, 215, 400); //254x67pix 
    gameOverButtonIsVisible(); //calls function below to reveal gameoverbutton
    text("Click to exit", width/2-105, height/2+100); //text that appears over the gameover button
  }

  void gameOverButtonIsVisible() { //function called to reveal game over button
    if (mousePressed == true) { //on mousepress, 
      if (mouseX > 215 && mouseX < 469 && mouseY >400 && mouseY < 467) { //if the mouse in in this location (over the jpg button called elsewhere)
        exit(); //close the screen/exit the game
      }
    }
  }

  void movement() { //guidelines for movement in vehicle classes. I think this was overwritten for all subclasses extensively, except for bluetank, which kept this
    if (canWeStartYet == true) { //if the player has closed the intro menu/has started play
      if (xPosition < myLocX) { //if the position of this object is less than the position of the player
        xPosition = xPosition + 0.3; //move this object closer toward the player
      }
      if (xPosition > myLocX) { //if the position of this object is greater than the position of the player
        xPosition = xPosition - 0.3; //move this object closer toward the player
      }
    }
  }
}

class Player extends Vehicle { //create new class Player which is a subclass of Vehicle/will inherit some functions from it
  int pointingWhere = 1; //player spawns pointing to the right
  //initialize some new float variables for bullet collision and movement:
  float xBulletMove;
  float yBulletMove;
  float bulletLocationX;
  float bulletLocationY;
  //new booleans to make sure the player can't shoot in more than one direction at once:
  boolean bulletShootsRight = false;
  boolean bulletShootsLeft = false;
  boolean bulletShootsUp = false;
  boolean bulletShootsDown = false;
  boolean rightShot = false;
  boolean leftShot = false;
  boolean upShot = false;
  boolean downShot = false;
  Player(float xPos, float yPos) { //player consists of an x location and y location
    super(xPos, yPos); //subclasses invoke a 'super' constrictor
    myLocX = xPos; //we assign the value of myLocX to the previously abstract variable xPos
    myLocY = yPos; //we assign the value of myLocY to the previously abstract variable yPos
  }

  void collision() {
    //collision behaviours for player tank in relation to Chomp tank. Collisions may consist of a thick border around the object to prevent glitching through objects when colliding
    if (eLocY <= myLocY-56 && eLocY >= myLocY-61 && eLocX <= myLocX+60 && eLocX >= myLocX-60) { //if the Chomp and player tank collide (player tank on south end)
      eLocY = eLocY -5; //Then STOP the Chomp from overlapping the player tank by negating it's downward movement 
      myLocY = myLocY +2; //Also stop the player tank from overlapping the Chomp tank by negating it's upward movement
      h1.gameOver(); //forces the chomp to stop moving, causes game over
      h2.gameOver();  //forces the other chomp to stop moving, causes game over
      gameOver(); //forces player to stop moving, shooting
      bluetank1.gameOver(); //forces blue tank to default to position above player and stop shooting
    }
    if (eLocY >= myLocY+58 && eLocY <= myLocY+61 && eLocX >=myLocX-60 && eLocX <= myLocX+60) { //if the Chomp  tank and player tank collide (player tank on the north end) 
      eLocY = eLocY +5; //Then STOP the Chomp from overlapping the player tank by negating it's northward movement
      myLocY = myLocY -2; //Also stop the player tank from overlapping the Chomp tank by negating it's downward movement
      h1.gameOver(); //forces the chomp to stop moving, causes game over
      h2.gameOver();  //forces the other chomp to stop moving, causes game over
      gameOver(); //forces player to stop moving, shooting
      bluetank1.gameOver(); //forces blue tank to default to position above player and stop shooting
    }
    if (eLocX <= myLocX-58 && eLocX >= myLocX-61 && eLocY <=myLocY+60 && eLocY >=myLocY-60) { //if the Chomp and player tank collide (player tank on east end)
      eLocX = eLocX -5; //Then STOP the Chomp from overlapping the player tank by negating it's rightward movemet
      myLocX = myLocX +2; //Also stop the player tank from overlapping the Chomp tank by negating it's leftward movement
      h1.gameOver(); //forces the chomp to stop moving, causes game over
      h2.gameOver();  //forces the other chomp to stop moving, causes game over
      gameOver(); //forces player to stop moving, shooting
      bluetank1.gameOver(); //forces blue tank to default to position above player and stop shooting
    }
    if (eLocX >= myLocX+58 && eLocX <= myLocX+61 && eLocY >=myLocY-60 && eLocY <=myLocY+60) { //if the Chomp and player tank collide (player tank on west end)
      eLocX = eLocX +5; //Then STOP the Chomp from overlapping the player tank by negating it's leftward movement
      myLocX = myLocX -2; //Also stop the player tank from overlapping the Chomp by negating it's rightward movement
      h1.gameOver(); //forces the chomp to stop moving, causes game over
      h2.gameOver();  //forces the other chomp to stop moving, causes game over
      gameOver(); //forces player to stop moving, shooting
      bluetank1.gameOver(); //forces blue tank to default to position above player and stop shooting
    }
    //second red tank's collisions VS player
    if (e2LocY <= myLocY-56 && e2LocY >= myLocY-61 && e2LocX <= myLocX+60 && e2LocX >= myLocX-60) { //if the Chomp and player tank collide (player tank on south end)
      e2LocY = e2LocY -5; //Then STOP the Chomp from overlapping the player tank by negating it's downward movement 
      myLocY = myLocY +2; //Also stop the player tank from overlapping the Chomp by negating it's upward movement
      h1.gameOver(); //forces the chomp to stop moving, causes game over
      h2.gameOver();  //forces the other chomp to stop moving, causes game over 
      gameOver(); //forces player to stop moving, shooting
      bluetank1.gameOver(); //forces blue tank to default to position above player and stop shooting
    }
    if (e2LocY >= myLocY+58 && e2LocY <= myLocY+61 && e2LocX >=myLocX-60 && e2LocX <= myLocX+60) { //if the Chomp  and player tank collide (player tank on the north end) 
      e2LocY = e2LocY +5; //Then STOP the Chomp from overlapping the player tank by negating it's northward movement
      myLocY = myLocY -2; //Also stop the player tank from overlapping the Chomp by negating it's downward movement
      h1.gameOver(); //forces the chomp to stop moving, causes game over
      h2.gameOver();  //forces the other chomp to stop moving, causes game over
      gameOver(); //forces player to stop moving, shooting
      bluetank1.gameOver(); //forces blue tank to default to position above player and stop shooting
    }
    if (e2LocX <= myLocX-58 && e2LocX >= myLocX-61 && e2LocY <=myLocY+60 && e2LocY >=myLocY-60) { //if the Chomp and player tank collide (player tank on east end)
      e2LocX = e2LocX -5; //Then STOP the Chomp from overlapping the player tank by negating it's rightward movemet
      myLocX = myLocX +2; //Also stop the player tank from overlapping the Chomp by negating it's leftward movement
      h1.gameOver(); //forces the chomp to stop moving, causes game over
      h2.gameOver();  //forces the other chomp to stop moving, causes game over
      gameOver(); //forces player to stop moving, shooting
      bluetank1.gameOver(); //forces blue tank to default to position above player and stop shooting
    }
    if (e2LocX >= myLocX+58 && e2LocX <= myLocX+61 && e2LocY >=myLocY-60 && e2LocY <=myLocY+60) { //if the Chomp and player tank collide (player tank on west end)
      e2LocX = e2LocX +5; //Then STOP the Chomp from overlapping the player tank by negating it's leftward movement
      myLocX = myLocX -2; //Also stop the player tank from overlapping the Chomp by negating it's rightward movement
      h1.gameOver(); //forces the chomp to stop moving, causes game over
      h2.gameOver();  //forces the other chomp to stop moving, causes game over
      gameOver(); //forces player to stop moving, shooting
      bluetank1.gameOver(); //forces blue tank to default to position above player and stop shooting
    }
  }
  void display() { //visual function for player - used when keys are pressed (WASD)
    if (pointingWhere ==1) { //when pointingWhere = 1 (value of pointingWhere is changed by WASD keys)
      image(playerGoesRight, myLocX, myLocY); //draws image at current player location to make tank image face rightward
    }
    if (pointingWhere ==2) { //when pointingWhere = 2 (value of pointingWhere is changed by WASD keys)
      image(playerGoesLeft, myLocX, myLocY); //draws image at current player location to make tank image face leftward
    }
    if (pointingWhere ==3) { //when pointingWhere = 3 (value of pointingWhere is changed by WASD keys)
      image(playerGoesUp, myLocX, myLocY); //draws image at current player location to make tank image face upward
    }
    if (pointingWhere ==4) { //when pointingWhere = 4 (value of pointingWhere is changed by WASD keys)
      image(playerGoesDown, myLocX, myLocY); //draws image at current player location to make tank image face downward
    }
  }

  void bullet() { //this function is for bullet collision detection
    bulletLocationX = myLocX+xBulletMove; //defines the value of bulletLocation to be used below
    bulletLocationY = myLocY+yBulletMove; //defines the value of bulletLocation to be used below

    if (bluetank1.yPosition < bulletLocationY && bluetank1.yPosition+50 > bulletLocationY && bluetank1.xPosition+25 > bulletLocationX && bluetank1.xPosition-25 < bulletLocationX) { //if the player hits the blue tank 
      bluetank1.isHit(); //this moves the tank off the screen, like it's 'died' like the Chomps when hit. But, it will be back too...!
    }
    if (bulletLocationX+50 > eLocX+13 && bulletLocationX+53 < eLocX+60 && myLocY+25 > eLocY && myLocY+25 < eLocY+50 ) { //if a collision occurs betweek the bullet and the left/right sides of the 1st chomp
      print("PLAYER HITS TARGET ");
      eLocY=1000; //make the Chomp disappear for a few seconds (he'll walk back)
      eLocX=1000; //make the Chomp disappear for a few seconds (he'll walk back)
      xBulletMove = -99999999; //make that bullet disappear, we'll call it back later
    }
    if (bulletLocationY < eLocY+20 && bulletLocationY > eLocY-30 && bulletLocationX < eLocX+25 && bulletLocationX > eLocX-25) { //if a collision occurs betweek the bullet and the top/bottom sides of the 1st chomp
      print("PLAYER HITS TARGET ");
      eLocY=800; //make the Chomp disappear for a few seconds (he'll walk back)
      eLocX=800; //make the Chomp disappear for a few seconds (he'll walk back)
      yBulletMove = -99999999; //make that bullet disappear, we'll call it back later
    }
    if (bulletLocationX+50 > e2LocX+13 && bulletLocationX+53 < e2LocX+60 && myLocY+25 > e2LocY && myLocY+25 < e2LocY+50 ) { //if a collision occurs betweek the bullet and the top/bottom sides of the 2nd chomp
      print("PLAYER HITS TARGET 2 ");
      e2LocX=-800; //make the Chomp disappear for a few seconds (he'll walk back)
      e2LocY=800; //make the Chomp disappear for a few seconds (he'll walk back)
      xBulletMove = -99999999; //make that bullet disappear, we'll call it back later
    }
    if (bulletLocationY < e2LocY+20 && bulletLocationY > e2LocY-30 && bulletLocationX < e2LocX+25 && bulletLocationX > e2LocX-25) { //if a collision occurs betweek the bullet and the left/right sides of the 2nd chomp
      print("PLAYER HITS TARGET 2 ");
      e2LocX=-800; //make the Chomp disappear for a few seconds (he'll walk back)
      e2LocY=800; //make the Chomp disappear for a few seconds (he'll walk back)
      yBulletMove = -99999999; //make that bullet disappear, we'll call it back later
    }
  }

  void keyReleased() { //the player controls
    if (gameOverTime == false) { //these will only work if the game over condition is still false
      if (canWeStartYet == true) { //if the player has closed the intro menu/started play
        //player movement controls:
        if (key == 'd') { //if d is pressed
          myLocX = myLocX + 1; //move right.
          pointingWhere = 1; //pointing right
        }
        if (key == 'a') { //if a is pressed
          myLocX = myLocX -1; //move left.
          pointingWhere = 2; //pointing left
        }
        if (key == 'w') { //if w is pressed
          myLocY = myLocY - 1; //move up
          pointingWhere = 3; //pointing up
        }
        if (key == 's') { //if s is pressed
          myLocY = myLocY + 1; //move down
          pointingWhere = 4; //pointing down
        }
        if (key == 'l') { //if l is pressed
          myLocY = myLocY + 0; //stop moving
          myLocX = myLocX + 0; //stop moving
        }
        if (key == ' ') { //if space is pressed 
          if (pointingWhere ==1) { //right facing
            bulletShootsRight = true; //activate the bullet - shoots bullet
          }
          if (pointingWhere ==2) { //left
            bulletShootsLeft = true;
          }
          if (pointingWhere ==3) { //up
            bulletShootsUp = true;
          }
          if (pointingWhere ==4) { //down
            bulletShootsDown = true;
          }
        }
        if (key == ' ' && !tankSound.isPlaying()) { //if the tank shooting sound isn't play yet, and you hit the space bar
          tankSound.rewind(); //rewind the sound just in case it's been played already (so it can be played more than just once)
          if (keyPressed) { //confirming keypressed stops the sound from playing multiple times in a row when you hit space bar.
            tankSound.play(); //play the sound.
          }
        }
      }
      if (key == 'p') { //if p is pressed
        h1.startTheGame(); //enables Chomp movement
        this.canWeStartYet = true; //enables Player movement
        bluetank1.startTheGame(); //enables Bluetank movement
      }
    }
    //if statements required for shooting. These make sure the player can only shoot one bullet in one direction at a time
    if (bulletShootsRight == true && xBulletMove < 700 && pointingWhere==1 && bulletShootsLeft ==false && bulletShootsUp ==false && bulletShootsDown ==false) {  //if the bullet was shot and it's not at the edge of the screen
      rightShot = true;
    }
    if (bulletShootsLeft == true && xBulletMove > -700 && pointingWhere==2 && bulletShootsRight ==false && bulletShootsUp ==false && bulletShootsDown ==false) {
      leftShot = true;
    }
    if (bulletShootsDown == true && yBulletMove < 700 && pointingWhere==4 && bulletShootsRight ==false && bulletShootsUp ==false && bulletShootsLeft ==false) {
      downShot = true;
    }
    if (bulletShootsUp == true && yBulletMove > -700 && pointingWhere==3 && bulletShootsRight ==false && bulletShootsLeft ==false && bulletShootsDown ==false) {
      upShot = true;
    }
    if (keyPressed) { //a second keypress makes sure this bullet doesn't loop forever
      if (key == ' ') { //on space bar, set all of these values to zero or false. These reset their values so bullets can be shot more than once in the game:
        yBulletMove=0;
        xBulletMove=0;
        bulletShootsRight = false;
        bulletShootsLeft = false;
        bulletShootsUp = false;
        bulletShootsDown = false;
        rightShot = false;
        leftShot = false;
        upShot = false;
        downShot = false;
      }
    }
  }

  void isPlayerShooting() { //this function moves our bullets 
    if (rightShot == true) { //if a shot to the right is confirmed
      image(bulletRight, bulletLocationX+25, myLocY+25);  //draw bullet
      xBulletMove=xBulletMove+10; //speed = 10
    }
    if (leftShot == true) { //if a shot to the left is confirmed
      image(bulletLeft, bulletLocationX+25, myLocY+25); //draw bullet
      xBulletMove=xBulletMove-10; //speed = 10
    }
    if (upShot == true) { //if a shot up is confirmed
      image(bulletUp, myLocX+25, bulletLocationY+25); //draw bullet
      yBulletMove=yBulletMove-10; //speed = 10
    }
    if (downShot == true) { //if a shot down is confirmed
      image(bulletDown, myLocX+25, bulletLocationY+25); //draw the bullet infront of the player tank's currrent location
      yBulletMove=yBulletMove+10; //move the bullet at a speed of +5
    }
  }

  void movement() { //player movement collisions with side of screen:
    if (myLocX >= 650) { //if the tank hits the right side of the screen
      myLocX = 650; //don't let it go past that point
    }
    if (myLocX <= 0) { //if the tank hits the left side of the screen 
      myLocX = 0; //don't let it go past that point
    }
    if (myLocY >= 650) { //if the tank hits the bottom of the screen
      myLocY = 650; //don't let it go past that point
    }
    if (myLocY <= 0) { //if the tank hits the top of the screen
      myLocY = 0; //don't let it go past that point
    }
  }
}

class Bluetank extends Vehicle { //create a new class, bluetank, which is a subclass of vehicle.
  float xAttack; //for positioning on x axis for bluetank
  float yAttack; //for positioning on y axis for bluetank
  boolean shootDownAtEnemy = false; //boolean used to limit bluetank to shooting when player is within range. Stops bullet from triggering pre-emptively.
  Bluetank(float xPos, float yPos) { //constrictor with two variables for x/y locations
    super(xPos, yPos); //subclasses invoke another constrictor
    xAttack = xPos; //assign xPos value from xAttack
    yAttack = yPos; //assign yPos value from yAttack
  }

  void isHit() { //if the blue tank is hit
    xPosition = 700; //move it off screen, it'll come back later
  }

  void blueTankSound() { //function for creating sound when bluetank shoots
    if (yAttack < 10 && yAttack > 0) { //if the bluetank's bullet has just left the bluetank
      tankSound.rewind(); //rewind the sound just in case it's been played already (so it can be played more than just once)
      tankSound.play(); //play the sound.
    }
  }

  void isTankShooting() { //shooting function for bluetank
    if (shootDownAtEnemy == true) { //if player is in range (true)
      image(bulletDown, xPosition+10, yAttack+30); //draw the bullet infront of the player tank's currrent location
      yAttack = yAttack+3; //move the bullet at a speed of +3
    }
    if (gameOverTime == true) { //if the game is over,
      yAttack = yAttack-3; //stop the bluetank bullet by negating it's downward momentum
      yAttack = myLocY; //change the blue tank's bullet's location to where the player tank is (y axis)
      xAttack = myLocX; //change the blue tank's bullet's location to where the player tank is (x axis)
      xPosition = myLocX; //move the blue tank to the same y axis value as the player (so it will appear directly above the tank)
      //I have positioned the bullet and tank in this fashion because I have noticed that in the Chomp collision endgame scenario, the collisions which trigger 
      //gameOver() are not final. And thus, the Game Over! text blinks rapidly or doesn't appear at all. By defaulting the blue tank 
      //infront of the player, of which it's bullet shares it's y axis position, the gameOver() is permanent
    }
  }

  void attack() { //this function tells bluetank when to strike
    boolean isShooting = false; //bluetank is not shooting yet 
    if (xPosition < myLocX+100 && xPosition > myLocX-60 && isShooting ==false) { //if the player is within range of the blue tank and the bluetank doesn't have a bullet on the field yet
      isTankShooting(); //shoot a bullet!
      shootDownAtEnemy = true; //now that the player is in range, enable shooting.
    }
    if (xPosition < myLocX+45 && xPosition > myLocX-20 && yAttack > myLocY-25 && yAttack < myLocY+25) { //if the player is hit by bluetank's bullet:
      player1.gameOver(); //forces the player to stop moving/shooting
      h1.gameOver(); //forces the chomp to stop moving
      h2.gameOver();  //forces the other chomp to stop moving
      gameOver(); //stops the bullet from flying through the player (the one that killed the player.)
      isShooting = true; //bullet is now moving through the space = true
    }
    if (yAttack > 700) { //if the bullet strays too far
      yAttack = 0; //bring it back!
    }
  }   

  void display() { //for the bluetank visuals
    image(bluetankGoesDown, xPosition, yPosition); //draws the blue tank gif in an abstract position, defined later when we declare and construct it
  }
}

ChompyChomp h1 = new ChompyChomp(500, 100); //spawns ChompyChomp1 at location 500, 500
ChompyChomp h2 = new ChompyChomp(0, 0, 0); //spawns ChompyChomp2 at random location. uses overloading. 

class ChompyChomp extends Vehicle { //create a new class, ChompyChomp, which is a subclass of Vehicle

    ChompyChomp(float xPos, float yPos) { //constrictor with two variables for x/y locations. This will spawn one tank using values below
    super(e2LocX, e2LocY);  //subclasses invoke a super constrictor - this will adjust the location of the first tank
    eLocX = xPos; //the x axis spawning location of red tank 1 (500, set elsewhere)
    eLocY = yPos; //the y axis spawning location of red tank 1 (500, set elsewhere)
  }

  ChompyChomp(float xPos, float yPos, float randomPlace) { //constrictor with two variables for x/y locations. influenced by new third variable. This will spawn one tank using values below. Overloading. 
    super(e2LocX, e2LocY);  //subclasses invoke a super constrictor - values reference location of second tank
    float randomNumber = random(0, 600); //create a float assigned to a random number between 0 and 600
    int patchRandom = int (randomNumber); //mandatory conversion into an INT because the FLOAT was disabling Chomp's movement on the X axis - in order to change direction the Chomp must align numerically with the player on the X or Y axis
    //   randomPlace = patchRandom; 
    e2LocX = patchRandom; //the x axis spawning location of red tank 1 (random!)
    e2LocY = patchRandom-300; //the y axis spawning location of red tank 1 (random, but with -300, to prevent the chomp from spawning on the player)
  }

  void display() { //a method - visuals for tank
    image(Chompy, eLocX, eLocY); //draws Chomp image 
    image(Chompy, e2LocX, e2LocY); //draws Chomp image
  }

  void movement() {
    //these booleans check to see which direction the ChompyChomp tank is moving. Only one can be "true" at a time - this makes sure the ChompyChomp tank cannot move in a diagonal fashion
    boolean ChompyChompMovingDown = false; 
    boolean ChompyChompMovingUp = false;
    boolean ChompyChompMovingLeft = false;
    boolean ChompyChompMovingRight = false;
    boolean ChompyChompMovingDown2 = false; 
    boolean ChompyChompMovingUp2 = false;
    boolean ChompyChompMovingLeft2 = false;
    boolean ChompyChompMovingRight2 = false;

    if (gameOverTime == false) {
      if (canWeStartYet == true) { //when the player closes the intro menu and starts playing
        if (eLocX > myLocX && ChompyChompMovingUp !=true && ChompyChompMovingDown !=true) { //if the ChompyChomp is positioned to the right of the player, and it isn't already moving up or down
          eLocX = eLocX -1; //have the ChompyChomp tank move left, toward the player.
          ChompyChompMovingLeft = true; //booleans acknowledge the tank is moving left, and in no other direction. This helps inhibit diagonal movement.
        }
        if (eLocX < myLocX && ChompyChompMovingUp !=true && ChompyChompMovingDown !=true) { //if the ChompyChomp is positioned to the left of the player, and it isn't already moving up or down
          eLocX = eLocX + 1;
          ChompyChompMovingRight = true; //booleans acknowledge the tank is moving right, and in no other direction. This helps inhibit diagonal movement.
        }
        if (eLocY < myLocY && ChompyChompMovingLeft !=true && ChompyChompMovingRight !=true) { //if the ChompyChomp is positioned above the player, and it isn't already moving left or right
          eLocY = eLocY + 1;
          ChompyChompMovingDown = true; //booleans acknowledge the tank is moving down, and in no other direction. This helps inhibit diagonal movement.
        }
        if (eLocY > myLocY && ChompyChompMovingLeft !=true && ChompyChompMovingRight !=true) { //if the ChompyChomp is positioned below the player, and it isn't already moving left or right
          eLocY = eLocY - 1;
          ChompyChompMovingUp = true; //booleans acknowledge the tank is moving up, and in no other direction. This helps inhibit diagonal movement.
        }
        if (e2LocY < myLocY && ChompyChompMovingLeft2 !=true && ChompyChompMovingRight2 !=true) { //if the ChompyChomp is positioned above the player, and it isn't already moving Left2 or Right2
          e2LocY = e2LocY + 1;
          ChompyChompMovingDown2 = true; //booleans acknowledge the tank is moving Down2, and in no other direction. This helps inhibit diagonal movement.
        }
        if (e2LocY > myLocY && ChompyChompMovingLeft2 !=true && ChompyChompMovingRight2 !=true) { //if the ChompyChomp is positioned below the player, and it isn't already moving Left2 or Right2
          e2LocY = e2LocY - 1;
          ChompyChompMovingUp2 = true; //booleans acknowledge the tank is moving Up2, and in no other direction. This helps inhibit diagonal movement.
        }
        if (e2LocX > myLocX && ChompyChompMovingUp2 !=true && ChompyChompMovingDown2 !=true) { //if the ChompyChomp is positioned to the Right2 of the player, and it isn't already moving Up2 or Down2
          e2LocX = e2LocX -1; 
          ChompyChompMovingLeft2 = true; //booleans acknowledge the tank is moving Left2, and in no other direction. This helps inhibit diagonal movement.
        }
        if (e2LocX < myLocX && ChompyChompMovingUp2 !=true && ChompyChompMovingDown2 !=true) { //if the ChompyChomp is positioned to the Left2 of the player, and it isn't already moving Up2 or Down2
          e2LocX = e2LocX + 1;
          ChompyChompMovingRight2 = true; //booleans acknowledge the tank is moving Right2, and in no other direction. This helps inhibit diagonal movement.
        }
      }
    }
  }
}


