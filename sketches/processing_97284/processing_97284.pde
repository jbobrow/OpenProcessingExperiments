
// Snake game
// Final project for CS127-S13


// globally declare a SnakeHead object
SnakeHead head;
//globally declare an Apple object
Apple treat;
//globally declare a score object
ScoreDisplay score;
//globally declare two WormHole object
WormHole warp1;
WormHole warp2;
//globally declare a Hazard object
Hazard death;
//globally declare a SnakeBody object
SnakeBody body;
//globally declare a body array object
ArrayList bodypart = new ArrayList();

void setup() {
  size(300, 300);
  frameRate(10);  // only update / draw a new frame 10 times per second 

  //intialize the objects
  head = new SnakeHead(width/2, height/2, 0, 0, 10, color(120, 255, 0));
  treat = new Apple(int(random(1, 270)), int(random(1, 270)), 8, color(255, 0, 0));
  score = new ScoreDisplay(color(0), 5, 20);
  warp1 = new WormHole(int(random(1, 270)), int(random(1, 270)), 10, color(255, 255, 0));
  warp2 = new WormHole(int(random(1, 270)), int(random(1, 270)), 10, color(255, 255, 0));
  death = new Hazard(int(random(1, 270)), int(random(1, 270)), 2, 2, 8, color(0, 0, 255));
  body = new SnakeBody(head.x, head.y, 10);
}

void draw() {
  // clear the screen
  background(255);
  body.followHead(head);
  // update the position of the SnakeHead and Hazard  
  head.updatePos();
  death.updatePos();



  // check and wrap around if needed
  head.checkPosition();

  //if snake eats apple
  if (head.hasCollidedApple(treat)) {
    treat = new Apple(int(random(1, 290)), int(random(1, 290)), 10, color(255, 0, 0));
    score.addToScore(17);
    body.growLength(head);
  }
  //if snake or body collides into hazard, the game is over
  if (death.hasCollidedHead(head)) { 
    endGame();
  }
  //if snake collides into wormhole, they are transported to the other wormhole
  if (head.hasCollidedWormHole(warp1)) {
  head.warpTo(warp2);
  }
  else if (head.hasCollidedWormHole(warp2)) {
  head.warpTo(warp1);
  }  

  // draws the global objects
  treat.drawMe();
  death.drawMe();
  head.drawMe();
  score.drawMe();
  body.drawMe(head);
  warp1.drawMe();
  warp2.drawMe();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      head.changeDir(0, -10);
    }
    else if (keyCode == LEFT) {
      head.changeDir(-10, 0);
    }
    else if (keyCode == RIGHT) {
      head.changeDir(10, 0);
    }
    else if (keyCode == DOWN) {
      head.changeDir(0, 10);
    }
  }
}

void endGame() {
  //ends the game
  background(0);
  fill(255);
  textSize(50);
  text("Game Over", 10, 150);
  noLoop();
}



class Apple {
  // variables
  int x;      // the x coordinate of the Apple
  int y;      // the y coordinate
  
  int size;   // size of the apple (diameter of a drawn circle, in pixels)
  color c;    // color of the circle
  
  // constructor
  Apple(int i_x, int i_y, int i_size, color i_c) {
    this.x = i_x;
    this.y = i_y;
    this.size = i_size;
    this.c = i_c;
  }
  
  
  // methods

  // drawMe() -- draw this object on the screen
  //             using its position, size, and color
  void drawMe() {
    fill(this.c);
    ellipse(this.x, this.y, this.size, this.size);
  }

}


class BodyBlock {
  int x;
  int y;
  int size;
  color c;
  
BodyBlock (int newx, int newy, int i_size, color i_c) {
    this.x = newx;
    this.y = newy;
    this.size = i_size;
    this.c = i_c;
  }
void drawMe() {
 rect(this.x, this.y, this.size, this.size); 
 }
}

class Hazard {
  // variables
  int x, y;  // x-coordinate and y-coordinate of the Hazard
  int speedx, speedy;  // distance traveled in x and y directions each frame  
  int size;    // size of the Hazard (drawn as a ???)
  color c;     // color of the Hazard

  // constructor
  Hazard(int i_x, int i_y, int i_speedx, int i_speedy, int i_size, color i_c) {
    this.x = i_x;
    this.y = i_y;
    this.speedx = i_speedx;
    this.speedy = i_speedy;
    this.size = i_size;
    this.c = i_c;
  }


  // methods

  // Draw this Hazard on the screen
  void drawMe() {
     fill(this.c);
     triangle(this.x-this.size/2, this.y-this.size/2, 
              this.x +this.size/2, this.y-this.size/2,
              this.x, this.y+this.size/2);
  }

  // Update the position of this Hazard for the next frame
  // based on its velocity (speedx, speedy).
  // Bounce off of walls when this Hazard collides with one
  void updatePos() {
    this.x += this.speedx;
    this.y += this.speedy;
    if (this.x <= 0 || this.x >= width) {
      // bounce horizontally (reverse x speed)
      this.speedx = this.speedx * -1;
    }
    if (this.y <= 0 || this.y >= height) {
      // bounce vertically (reverse y speed)
      this.speedy = this.speedy * -1;
    }
  }
  
  // Detect whether this Hazard has collided with a given SnakeHead
  // Returns true if so, false otherwise
  boolean hasCollidedHead(SnakeHead head) {
    if (dist(this.x, this.y, head.x, head.y) < (this.size + head.size)/2) { 
      return true;
    }
    else {
      return false;
    }
  }

  // Detect whether this Hazard has collided with a given Brick
  // Returns true if so, false otherwise
  boolean hasCollidedBody(SnakeBody body,SnakeHead head) {
      if (dist(this.x, this.y, body.x, body.y) < (this.size + head.size)/2) {
       return true;
      }
      else {
       return false;
      }
    }
}


class ScoreDisplay {
  // variables
  color c;    // color of the score when displayed on the screen
  int x, y;   // x and y coordinates where the score is displayed
  int score;  // the score for the entire game, maintained here
  
  // constructor
  ScoreDisplay(color i_c, int i_x, int i_y) {
    this.c = i_c;
    this.x = i_x;
    this.y = i_y;
    this.score = 0;
  }


  // methods

  // drawMe() -- Draw the current score on the screen
  void drawMe() {
    fill(this.c);
    textSize(15);
    text("Score:"+" "+this.score, this.x, this.y);
  }

  // addToScore(int increment) -- Update the score by adding
  //                              the given value to it
  void addToScore(int increment) {
    this.score = this.score + increment;
  }
}


class SnakeBody {
  // variables
  int x;          // the x coordinate of the snakebody
  int y;          // the y coordinate
  int size;       // size (in pixels) of each piece of the body
  int numPieces;  // keep track of the number of pieces (the length) of the snake
  
  


  // constructor
  SnakeBody(int newx, int newy, int i_size) {
    // Not *all* variables need to be set by input parameters.
    // Here, numPieces makes sense to just start out at 0, because
    // there should be no pieces when a new SnakeBody is made.
    this.x = newx;
    this.y = newy;
    this.numPieces = 0;
    this.size = i_size;
  }


  // methods

  // followHead -- moves the body, following a SnakeHead, by
  //               adding a new piece where the SnakeHead is (given
  //               in the input parameters) and removing a piece from
  //               the end.
  //               This is similar to updatePosition in other classes,
  //               but it has to be explicitly given the next position
  //               to "move" to.
  void followHead(SnakeHead sh) {
    int snakex = sh.x;
    int snakey = sh.y;
    int tempx;
    int tempy;
    for (int i = 0; i < bodypart.size(); i++) {
      BodyBlock snakepart = (BodyBlock)bodypart.get(i);
      tempx = snakepart.x;
      snakepart.x = snakex;
      snakex = tempx;
      tempy = snakepart.y;
      snakepart.y = snakey;
      snakey = tempy;
    }
  }
  // growLength -- grow the SnakeBody by the given amount
  void growLength(SnakeHead sh) {
    bodypart.add(new BodyBlock(sh.x, sh.y, this.size, color(120, 255, 0)));
  }

  // drawMe -- as in other classes
  void drawMe(SnakeHead sh) {
    for (int i = 0; i < bodypart.size(); i++) {
      BodyBlock snakepart = (BodyBlock)bodypart.get(i);
      snakepart.drawMe();
    }
  }
}


// SnakeHead class, the head of the snake,
// controllable via the keyboard.

class SnakeHead {
  // variable declarations
  int x;   // the x coordinate of the SnakeHead
  int y;   // the y coordinate
  
  int xspeed;   // the change in x position (# pixels) per frame
  int yspeed;   // the change in y position (# pixels) per frame
  
  int size;     // the height *and* width of the square drawn
  color c;      // the color of the square
 
  
  // constructor
  SnakeHead(int newx, int newy, int i_xspeed, int i_yspeed, int i_size, color i_c) {
    this.x = newx;
    this.y = newy;
    this.xspeed = i_xspeed;
    this.yspeed = i_yspeed;
    this.size = i_size;
    this.c = i_c;
  }
  
  
  // methods
  
  // drawMe() -- draw this SnakeHead object on the screen
  //             using its position, size, and color
  void drawMe() {
    fill(this.c);
    rect(this.x, this.y, this.size, this.size);
  }
  
  // updatePos() -- update the position of this object
  //                using its current position and its speed
  void updatePos() {
    this.x = this.x + this.xspeed;
    this.y = this.y + this.yspeed;
  }
  
  // changeDir(int xmov, int ymov) -- change the direction of this object
  //                                  given the new x and y movement values (to update xspeed and yspeed)
  void changeDir(int xmov, int ymov) {
    this.xspeed = xmov;
    this.yspeed = ymov;
  }

  // checkPosition() -- check for falling off screen and
  //                    and wrap around if so.
  void checkPosition() {
    if (this.x > width) {
      this.x = 0;      
    }
    else if (this.x < 0) {
      this.x = width;
    }
    else if (this.y > height) {
      this.y = 0;
    }
    else if (this.y < 0) {
      this.y = height;
    }
  }
  
  // boolean hasCollidedApple -- return true if this SnakeHead object has collided
  //                             (is at the same position as) the given Apple object
  boolean hasCollidedApple(Apple treat) {
      if (dist(this.x, this.y, treat.x, treat.y) < (this.size + treat.size)/2) {
       return true;
      }
      else {
        return false; 
    }
  }

  // boolean hasCollided WormHole -- check for collision with a WormHole object
  boolean hasCollidedWormHole(WormHole warp) {
    if (dist(this.x, this.y, warp.x, warp.y) < (this.size + warp.size)/2) {
      return true;
    }
    else {
      return false;
    }
  }
  
  //void warpTo - warp to the other warp hole
  void warpTo(WormHole warp) {
   this.x = warp.x;
   this.y = warp.y; 
  }
}







class WormHole {
  // variables
  int x;      // the x coordinate of the WormHole
  int y;      // the y coordinate
  
  int size;   // size of the WormHole (diameter of a drawn circle, in pixels)
  color c;    // color of the circle
  
  // constructor
  WormHole(int i_x, int i_y, int i_size, color i_c) {
    this.x = i_x;
    this.y = i_y;
    this.size = i_size;
    this.c = i_c;
  }
  
  
  // methods

  // drawMe() -- draw this object on the screen
  //             using its position, size, and color
  void drawMe() {
    fill(this.c);
    //wormhole wiggles
    rect(this.x-this.size/2+random(-1,1), this.y-this.size/2+random(-1,1), this.size, this.size);
  }

}



