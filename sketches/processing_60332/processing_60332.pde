
/*Project 3 Pac Invaders Game
 April 27, 2012
 
 PROBLEM
 Develop a game where the user shoots an invading pac man.
 The user needs to be able to move the gun left and right along the screen.
 The left mouse button shoots the gun, the computer displays a bullet moving up
 The right releases a pac man, the computer draws the pac man moving down
 A score should be kept.
 
 INPUT
 Use the mouse x position to place the gun.
 The left click to shoot.
 The right click to release a pac invader.
 
 CALCULATIONS
 Based on knowing where the bullet and the pac invader are located, detect a collision.
 Basically, if the bullet and pac invader are within a certain position or range of positions, then a collision has occured.
 If not, then there is no colision.
 If a collision is returned back as true, increase the score for the user.
 If the pac invader reaches the "end zone" increase the score for the pac invaders
 
 OUTPUT
 Draw the gun, the pac invader, the bullets, and the rest of the game environment
 Ouput the score.
 */

//load some variables
boolean releaseInvader = false;
boolean shootGun = false;
boolean mouthMode = true;
float invaderX, invaderY, bulletX, bulletY, setBulletTime, setInvaderTime, mouthOpening;
int playerScore, invaderScore;

//run the setup stuff
void setup() {
  size(640, 640);  //set the size of the window
  PFont font = loadFont("LucidaSans-Demi-15.vlw");  //create a font variable of PFont type, load an external font
  textFont(font, 15);  //set the program use the font variable, set the size
  textAlign(LEFT, TOP);  //set where the x,y axis will draw the text frommouthOpening
}

//draw the screen and run the methods as they are called -- the draw method is looped infinately as the program is running
void draw() {
  background(#000000);  //draw a black background
  stroke(#FFFFFF);  //lines and polygon outlines will be white
  fill(#00FF00);  //polygons and text will be filled with green
  line(5, 590, 635, 590);  //draw a line from x1, y1 to x2 ,y2 -- draws an "endzone" (like in US football)
  text(" Right click relases a \"Pac Invader\" Left shoots the gun",5,30);  //provide some instructions
  text("Player Score: "+playerScore, 5, 595);  //return the player's score
  text("Invader Score: "+invaderScore, 5, 615);  //return the invader's score
  gun();  //call the gun metod
  pacInvader();  //call the pacInvader method
  bullet();  //call the bullet method
  collisionDetect();  //call the collision detect method
  debug();  //call the debug method
}

//draw the gun
void gun() {
  fill(#00FF00);  //fill the polygons green 
  triangle(mouseX-20, 590, mouseX, 570, mouseX+20, 590);  //draw a triangle at x1,y1, x2,y2, x3,y3 -- basically sits on the line and moves with the mouseX position
}

//draw the pac invader
void pacInvader() {
  if (releaseInvader == true) {  //releaseInvader is controlled by a mouse right click
    fill(#FFFF00);
    stroke(#FFFF00);
    ellipse(invaderX, invaderY += (.005*(millis()-setInvaderTime)), 40, 40);  //draw a yellow circle at x,y, with width,height -- notice that I'm accelerating the fall of the pacInvader
    mouth();  //call the mouth method to make it look like a falling pac-man
  }
}

void mouth() {
  fill(#000000);
  stroke(#000000);
  if (mouthMode == true) {  //mouthMode description -- True opens the mouth (beginning at closed, going to open). False closes the mouth
    mouthOpening += 3;  //increases opening by 3 each time
    if (mouthOpening >= 20) {  //if the opening is greater than 20 then change to false, thus beginning the closing of the mouth
      mouthMode = false;
    }
  }
  if (mouthMode == false) {  //same but inverse as above comments
    mouthOpening -= 3;
    if (mouthOpening <= 0) {
      mouthMode = true;
    }
  }
  triangle(invaderX - mouthOpening, invaderY + 20, invaderX, invaderY, invaderX + mouthOpening, invaderY + 20);  //draw mouth (a black triangle), same setup as the gun triangle
}

//draw the bullet
void bullet() {
  if (shootGun == true) {  //this is controlled by a left mouse click
    fill(#0000FF);
    stroke(#000000);
    ellipse(bulletX, bulletY -=  (.1*(millis()-setBulletTime)), 4, 25);  //draw the blue bullet, an ellipse, make it accelerate upward
    if (bulletY < 0) {  //if it reaches the top, destroy the bullet
      shootGun = false;
    }
  }
}

//detect a collision
void collisionDetect() {
  if (shootGun == true || releaseInvader == true) {  //only run the collisionDetect if the gun was shot or the invader was released -- is this even necessary?
    if (bulletX > invaderX - 20 && bulletX < invaderX + 20 && bulletY < invaderY + 20) {  //if the bullet collides with the pac invader
      playerScore ++;  //increase the player score
      shootGun = false;  //cock the gun - lol
      releaseInvader = false;  //destroy the invader
      bulletY = 570;  //reset the bullet y, it should be close to 0 by now
      invaderY = 0;  //reset the invader y, it should be close to 590 by now
      mouthMode = true;  //set the mouth mode to opening
      mouthOpening = 0;  //close the mouth
    }
    if (invaderY > 590 - (40/2)) {  //if the invader reaches the "endzone"
      invaderScore ++;  //increase the invader score
      releaseInvader = false;  //destroy the invader
      invaderY = 0;  //reset the invader y
      mouthMode = true;  //set the mouth mode to opening
      mouthOpening = 0;  //close the mouth
    }
  }
}

void debug() {  //my shoddy debugging tools
  println(millis());
  println("releseInvader = "+releaseInvader);
  println("shootGun = "+shootGun);
}

void mouseClicked() {
  if (mouseButton == LEFT) {  //if the left mouse button is clicked
    if (shootGun != true) {  //if there isnt a bullet already on the screen
      shootGun = true;  //shoot the gun, call the gun() method
      bulletX = mouseX;  //set the bullet x position from the click
      bulletY = 570;  //set the bullet y to near the gun
      setBulletTime = millis();  //set the time for acceleration purposes
    }
  }
  if (mouseButton == RIGHT) {
    if (releaseInvader != true) {  //if the right mouse button is clicked
      releaseInvader = true;  //release the kraken - lol
      invaderX = mouseX;  //set the x position from the mouse click -- semi-randomize this later to make the game more fun
      setInvaderTime = millis();  //set the time for acceleration purposes
    }
  }
}

void keyPressed() {  //implement more functions from pressing keys
}


