
// a simple bouncing ball app that illustrates arrays, classes, for loops
// and more!!
//
// by ben grosser, for ARTS 444, jan 2012
//
// press the mouse button to spray balls at the current location
// hold the mouse (and move it if desired) as long as you want to 
// spray more.
//
// UP or DOWN arrow speeds or slows the frame rate
// SPACE clears the screen and starts over
//

// the maximum number of balls we can have at one time
int MAXBALLS = 1000;

// declaring an array balls of type Ball
Ball[] balls = new Ball[MAXBALLS];

// a counter to track how many balls we've created
int numballs = 0;

// a boolean to keep track of whether we're creating new balls right now
boolean spray = false;

// the background color
int bg = 40;

// the current frame rate
int fps = 40;


void setup() {
  background(bg);
  size(1000,600);
  smooth();
  noStroke();
  frameRate(fps);
}

void draw() {
  background(bg);

  // spray gets set in mousePressed() and mouseReleased()
  if(spray) {
    boolean done = makeNewBall();
  }

  // run through all balls in the array
  // and move, bounce, and color them
  for(int i = 0; i< numballs; i++) {
    balls[i].moveBall();
    balls[i].bounceBall();
    balls[i].colorBall();
  }

  // once all ball locations are calc'd
  // now we draw them all at once
  for(int i = 0; i< numballs; i++) {
    balls[i].drawBall();  
  }

}


// every time the mouse is pressed
// create a new ball and send it on
// its way

void mousePressed() {
  spray = true;
}

void mouseReleased() {
  spray = false;
}

// make a new ball!
boolean makeNewBall() {

  // don't bother if we've hit our max
  if(numballs == MAXBALLS - 1) return false;

  // pick a speed for the new ball
  float xspeed = random(1,5);
  float yspeed = random(1,5);


  // a bit of randomness to make sure 
  // new balls spray in varying directions
  if(random(10) > 5) {
    xspeed *= -1;
  }
  if(random(10) > 5) {
    yspeed *= -1;
  }

  // the ball size
  float w = 15 + random(10);
  float h = w;

  // now make a new ball and add it to the array of balls
  // each new ball calls Ball(), a new type created below
  balls[numballs] = new Ball(mouseX,mouseY,xspeed,yspeed,w,h);
  numballs++;

  return true;
}


// class Ball is a new data type that encapsulates 
// everything having to do with a ball into one place
// data declared inside the ball is unique to any one
// individual ball

class Ball {
  float x;
  float y;
  color c;
  float xspeed;
  float yspeed;
  boolean hitedge = false;
  float w,h;

  // this is the 'constructor', where i can initialize each new
  // ball when it's created
  Ball(float x_, float y_, float xspeed_, float yspeed_, float w_, float h_) {
    x = x_;
    y = y_;
    c = color(random(180));
    xspeed = xspeed_;
    yspeed = yspeed_;
    w = w_;
    h = h_;
  }

  // these functions below, within the {} of Ball, are 'member' 
  // functions, and are only called through the ball itself 
  // e.g. ball.drawBall()
  void drawBall() {
    fill(c);
    noStroke();
    ellipse(x,y,w,h);
  }

	void colorBall() {
    float ballR,ballG,ballB;
	  if(hitedge) {
	    hitedge = false;
      if(random(10) > 8) {
	      ballR = random(180);
	      ballG = random(180);
	      ballB = random(180);
	      c = color(ballR,ballG,ballB);
      } else {
        c = color(random(180));
      }
	  }
	}
	
	void bounceBall() {
	  if(x > width || x < 0) {
	    xspeed = xspeed * -1;
	    hitedge = true;
	  }
	  if(y > height || y < 0) {
	    yspeed = yspeed * -1;
	    hitedge = true;
	  }
	}

	void moveBall() {
	  x = x + xspeed;
	  y = y + yspeed;
	}

}

void keyPressed() {

  if(key == CODED) {
    if(keyCode == UP) {
      fps++;
      if(fps > 80) { fps = 60; }
      frameRate(fps);
      println(frameRate);
    } else if(keyCode == DOWN) {
      fps--;
      if(fps < 1) { fps = 1; }
      frameRate(fps);
      println(frameRate);
    }
  }

  if(key == ' ') {
    background(bg);
    numballs = 0;
  }

}


