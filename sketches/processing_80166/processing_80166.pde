
/* A game. Use arrow keys to move the guy and munch the dots. But don't bump
into the red walls that appear.

written by Sean Fottrell, November, 2012
based on an old program by Jeff Camp, circa 1979
*/


int speed = 1;  // Guy's speed can be controlled with this, or with frameRate()
int r = 10;  // radius of guy
int maxStars = 100;
int starRadius = 5;  // radius of dots ("stars")
int wallLength = 10;  //half-length of line that Star turns into when eaten

Star[] stars = new Star[maxStars];
int direction = 0;  // 1 = right, 2 = down, -1 = left, -2 = up, 0 = stopped
boolean alive = true;
int score = 0;
int guyX = 30;  // position of Guy on the screen
int guyY = 490;
boolean playAgain = true;  //sets up a new game
int numStars;    //Current number of stars

void setup() {
  size (800, 600);
  frameRate(120);
  background(0);
  ellipseMode(RADIUS);
  

}

void draw() {
  if (playAgain) {
    numStars = 0;  // reset initial conditions
    alive = true;
    score = 0;
    direction = 0;
    guyX = 30;
    guyY = 490;

    //Draw the initial 10 dots on the screen
    for (int i = 0; i < 10; i++) {
      int starX = int(random(11 + starRadius, 789 - starRadius));
      int starY = int(random(11 + starRadius, 509 - starRadius));
      stars[i] = new Star(starX, starY, true, starRadius);
      numStars++;
      stars[i].display();
    }
    playAgain = false;
  } 
  if (alive) {
    background(0);  
    stroke(255);
    fill(0);
    rect(10,10,780, 500);
    
    if (keyPressed) {
      if ((key == 'i') || (keyCode == UP)) {
        direction = -2;
      } else if ((key == 'l') || (keyCode == RIGHT)) {
        direction = 1;
      } else if ((key == 'm') || (keyCode == DOWN)) {
        direction = 2;
      } else if ((key == 'j') || (keyCode == LEFT)) {
        direction = -1;
      }
    }
    drawGuy();
    drawStars();
    text("Score: " + score, 500, 560);
    
  } else {                                    //if Guy has died...  
    fill(0);
    stroke(0);                // Write "Game Over" in a black box
    rect(50, 550, 90, 30);
    fill(0, 200, 0);
    text("GAME OVER", 50, 560);
    
    stroke(0, 120, 0);              // Make "Play Again" button
    fill(0, 120, 0);
    if ((mouseX > 300) && (mouseX < 380) && (mouseY > 540) && (mouseY < 570)) {
      stroke(0, 180, 0);
      fill(0, 180, 0);
      if (mousePressed) {
        playAgain = true;
      }
    }
    rect(300, 540, 80, 30);
    fill(255);
    text("Play Again", 308, 560);    
      
  }
}

void drawGuy() {
  stroke(200, 200, 0);
  fill(200, 200, 0);
  
  // when reach edge of screen, flip direction  
  if ((guyX >= 790 - r) || (guyX <= 10 + r) || (guyY >= 510 - r) || (guyY <= 10 + r)) {
    direction = -direction;                       
  }
  
  // Advance guy's position and draw him facing the right direction  
  if (direction == 1) {
    guyX += speed;
    arc(guyX, guyY, r, r, QUARTER_PI, 1.75*PI);
  } else if (direction == 2) {
    guyY += speed;
    arc(guyX, guyY, r, r, .75*PI, TWO_PI+QUARTER_PI);
  } else if (direction == -1) {
    guyX -= speed;
    arc(guyX, guyY, r, r, 1.25*PI, TWO_PI+.75*PI);
  } else if (direction == -2) {
    guyY -= speed;
    arc(guyX, guyY, r, r, 1.75*PI, TWO_PI+1.25*PI);    
  } else if (direction == 0) {
    arc(guyX, guyY, r, r, QUARTER_PI, 1.75*PI);
  }
}

void drawStars() {
  for (int i = 0; i < numStars; i++) {
    stars[i].collision();
    stars[i].display();
  }
}
  
class Star {    // A star is the general name for all dots and walls
  int starX;
  int starY;
  boolean starState;    // if true, it's a dot; if false, it's a wall
  int rStar;
  boolean vertical;  // when it becomes a wall, it can be vertical (true) or horizontal (false)
  
  Star(int x_, int y_, boolean state_, int rStar_) {
    starX = x_;
    starY = y_;
    starState = state_;
    rStar = rStar_;
  }
  
  void display() {
    if (starState) {      // if it's a dot, draw a circle
      fill(0, 200, 0);    // green color
      stroke(0, 200, 0);
      ellipse(starX, starY, rStar, rStar);
    } else {              // if it's a wall, draw a line
      stroke(255, 0, 0);  // red color
      if (vertical) {
        line(starX, starY + rStar, starX, starY - rStar);
      } else {
        line(starX - rStar, starY, starX + rStar, starY);
      }
    }
  }


  // Looks for collisions b/w guy and dot. If so, turns dot into a wall.
  // Also looks for collision b/w guy and wall. If so, game over.
  void collision() {    
    int dx = guyX - starX;
    int dy = guyY - starY;
    int d;  //distance between guy and star
    
    if ((abs(dx) <= r + rStar) && (abs(dy) <= r + rStar)) {    // If star is anywhere close...
      
      if (starState) {                  // If it's still a dot
        d = int(sqrt(dx*dx + dy*dy));  // distance between guy center and star center
        if (d <= r) {          // Collision! Guy runs over center of star
          starState = false;  // state changes from "star" to "wall"
          score++;
          
          if (abs(direction) == 1) {    
            vertical = true;            // Set orientation of wall
          } else {
            vertical = false;
          }
          
          rStar = wallLength;
          if (abs(direction) == 1) {        // Reset coorinates of old Star
            starX = guyX - direction*r;     // to be the middle of the new wall
            starY = guyY;
          } else {
            starX = guyX;
            starY = guyY - direction/2*r;
          }
          
          int newX = int(random(11 + rStar, 789 - rStar));  // Add a new star to the screen
          int newY = int(random(11 + rStar, 509 - rStar));
          stars[numStars] = new Star(newX, newY, true, starRadius);
          numStars++;
        }
        
      } else {         // If the star is a wall, determine whether there is a collision
        int a;  
        int b;  // Find coordinates of point on wall that would collide with Guy
        if (vertical) {                  //Basically, this looks at all the ways in which
          if (abs(direction) == 1) {     //a circle can collide with a line segment.
            a = starX;                   //For each way, it finds the point of the line
            if (dy < -r) {               //segment that would first hit the circle, then
              b = starY - r;             //it calculates the distance between that point
            } else if (dy > r) {         //and the circle.
              b = starY + r;
            } else {
              b = guyY;
            }
          } else {
            a = starX;
            if (direction == 2) {
              b = starY - r;
            } else {
              b = starY + r;
            }
          }
        } else {
          if (abs(direction) == 2) {
            b = starY;
            if (dx < -r) {
              a = starX - r;
            } else if (dx > r) {
              a = starX + r;
            } else {
              a = guyX;
            }
          } else {
            b = starY;
            if (direction == 1) {
              a = starX - r;
            } else {
              a = starX + r;
            }
          }
        }
        
        d = int(sqrt(sq(a - guyX) + sq(b - guyY)));  // distance between (a, b) and Guy
        if (d <= r) {    // Hit the wall: GAME OVER
          alive = false;
        }          
      }
    }
  }
} 
      
        



