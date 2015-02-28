
Car myCar; // A Car
Grape newGrape; // A Grape
Banana newBanana; // A Bananna

int hitCount = 0; // Counter for how many times the grape has been hit
int carSpeed = 7;

void setup() {
  size(500, 500);
  myCar = new Car();
  newGrape = new Grape();
  newBanana = new Banana();
}
void draw() {
  background(255);
  //
  text (hitCount, width - 50, height - 20); // place HUD in bottom right corner
  fill(0);
  newGrape.display(); // draw a grape randomly on the screen
  myCar.display();    // Car starts in the middle of the screen
  myCar.move();       // Move the car where the user wants



  // Checks for collision between grape and car
  // Grape must be fully within the boundries of the car to be considered "hit"

  if (rectangle_collision (myCar.xpos, myCar.ypos, myCar.sizeW, myCar.sizeH, 
  newGrape.xpos, newGrape.ypos, newGrape.sizeW, newGrape.sizeH)) {  
    hitCount = hitCount + 1; // increase hit counter by 1
    if (hitCount == 10) {
      hitCount = 0;
      newGrape.kill();
      
      newBanana.display();
      newBanana.move();
    } 
    else {
      newGrape = new Grape();  // Grape redraws in a random location.
    }
  }


  if (myCar.xpos + myCar.sizeW/2 > width) {
    myCar.xpos = myCar.xpos - carSpeed;
  } 
  else if (myCar.xpos - myCar.sizeW/2 < 0) {
    myCar.xpos = myCar.xpos + carSpeed;
  } 
  else if (myCar.ypos + myCar.sizeH/2 > height) {
    myCar.ypos = myCar.ypos - carSpeed;
  } 
  else if (myCar.ypos - myCar.sizeH/2 < 0) {
    myCar.ypos = myCar.ypos + carSpeed;
  }
}

// set up of boolean to determine state of collision

boolean rectangle_collision(float carX, float carY, float carW, float carH, 
float grapeX, float grapeY, float grapeW, 
float grapeH)

// returns true if...

{
  return (grapeX + grapeW/2 < carX + carW/2 && // ...the right side of the grape is farther left than the right side of the Car
  grapeX - grapeW/2 > carX - carW/2 && // and if the left side of the grape is farther right than the left side of the Car
  grapeY + grapeW/2 < carY + carW/2 && // and if the bottom of the grape is higher than the bottom of the car
  grapeY - grapeW/2 > carY - carW/2);  // and if the top of the grape is lower than the top of the car
}


// This stuff makes the car move around when the arrow keys are pressed.
// Clever boolean code I picked up from openprocessing somewhere allowing for
// diagonal movement.

void keyPressed() {
  int k = keyCode;
  if (k == SHIFT)
    carSpeed = carSpeed + 1; // if enter is pressed the car speeds up.
  else if (k == ' ')  
    carSpeed = carSpeed - 1; // if space is pressed, Car slows down.
  else if (k == UP)     myCar.up    = true; // sets up movement to true if up is pressed
  else if (k == DOWN)   myCar.down  = true; // sets down movement to true if down is pressed
  else if (k == LEFT)   myCar.left  = true; // sets left movement to true if left is pressed
  else if (k == RIGHT)  myCar.right = true; // sets right movement to true if right is pressed
}
void keyReleased() {
  int k = keyCode;
  if      (k == UP)     myCar.up    = false; // up is false if not pressed
  else if (k == DOWN)   myCar.down  = false; // ditto for other directions...
  else if (k == LEFT)   myCar.left  = false;
  else if (k == RIGHT)  myCar.right = false;
}


class Banana {
   color c;
   float x, y; // location
   float xspeed, yspeed; // speed
   
   // Constructor
   Banana() {
     c = color(254, 255, 21);
     x = int(random(width));
     y = int(random(height));
     xspeed = random(-5,5);
     yspeed = random(-5,5);
   }
   
   void move() {
     x = x + xspeed;
     y = y + yspeed;
     
     if ((x > width) || (x < 0)) {
       xspeed = xspeed * -1;
       print("x = " + x);
     }
     
     if ((y > height) || (y < 0)) {
       yspeed = yspeed * -1;
       print("y = " + y);
       print("height = " + height);
     }
     
   }
   
   void display() {
     stroke(0);
     fill(c);
     ellipse(x,y,10,10);
   }
}

class Car {
  color c; // sets color of Car
  float xpos; // xpos of car
  float ypos; // ypos of car
  int sizeW = 50; // width of car
  int sizeH = 50; // height of car
  boolean up, down, left, right; // booleans for car movement
 
 // Car Class
 
  Car() {
    c = color(175); // Color is a light gray. 
    xpos = width/2; // car is centered at the start of game.
    ypos = width/2;
  }
 
  void display() {
    rectMode(CENTER); // position determined by the center point of Car
    stroke(0); // black outline to car
    fill(c); // Fill is the light gray
    rect(xpos, ypos, sizeW, sizeH); // draw the car in the center with dimensions 50x50
  }
  
  // using the boolens set up previously
  // since the car will move in the directions specified as long as 
  // the booleans are true, the car is capable of diagonal movement
  
  void move() {
    if (up)    ypos -= carSpeed;
    if (down)  ypos += carSpeed;
    if (left)  xpos -= carSpeed;
    if (right) xpos += carSpeed;
  }
}
// The grape class

class Grape {
  color c; // color of grape.
  float xpos; // xpos of grape
  float ypos; // ypos of grape
  int sizeW = 10; // width of grape
  int sizeH = 10; // height of grape

  Grape() {
    c = color(random(180, 255), 44, 208); // color changes to differing shades of purple (added by GoToLoop)
    xpos = int(random(width - sizeW/2)); // xpos of grape
    ypos = int(random(height - sizeH/2)); // ypos of grape
  }

  void display() {
    rectMode(CENTER); // position determined by center of grape
    stroke(0); // black outline
    fill(c); // random fill
    rect(xpos, ypos, sizeW, sizeH); //draw it
  }

  // teleport function. When grape gets it, it moves to a different location

  void tele() {
    xpos = int(random(width - sizeW/2));
    ypos = int(random(height - sizeH/2));
  }

  void kill() {
    xpos = 1000;
    ypos = 1000;
  }
}



