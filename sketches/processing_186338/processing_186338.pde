
/*This Program was made by Shayan Farmani
this program is a variation of the classic game Lunar Lander.

UPDATE: Fixed the bug with the fuel; when it was at 0% it still 
had thrust.
*/

int marks = 20;
float w;
float[] landscape;
float fuel= 50;

//sets up the background and landscape.
void setup () {
  smooth();
  size(500,500);
  rocket= new Rocket(width/2, height/2);
  landscape = new float[marks];
  for (int i=0; i<marks; i++) {
    landscape[i] = random(height*.7, height);
  }
  landscape[7]= landscape[6];
  landscape[15]=landscape[14];
  w= width/(marks-1);
}
// sets the landing pad
void displayLandscape() {
  stroke(255, 0, 0);
  for (int i=1; i<marks; i++) {
    if (i==7 || i==15) {
      stroke(255);
      strokeWeight(5);
    }
    else {
      stroke(255, 0, 0);
      strokeWeight(2.5);
    }
    line((i-1)*w, landscape[i-1], i*w, landscape[i]);
  }
}
Rocket rocket;
//draws the rocket and updates it
void draw() {
  fill(0);
  background(0);
  displayLandscape();
  adjustControls(rocket);
  rocket.update();
//resets the fuel if its less than 0
  if (fuel <=0) {
    fuel=0;
  }
  stroke(255);
  rect(0, 20, 80, 50);
  fill(255);
  PFont font2;
  font2=loadFont("Arial-BoldMT-15.vlw");
  stroke(255);
  textFont(font2, 15);
  //shows the fuel
  text("Fuel", 20, 15);
  text("Use the Arrow keys to move.", 250, 15);
  text("Don't land too fast or else you lose!",250,30);
  text((int)fuel*2+"%", 10, 50);
}
//sets the controls of the rocket
void adjustControls(Rocket rocket) {
  // control thrust with the y-position of the mouse
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        rocket.setThrust((height/4));
      }
      else {
        rocket.setThrust(0);
      }
      if (keyCode == LEFT) {
        rocket.rotateRocket(-1);
      }
      else if (keyCode == RIGHT) {
        rocket.rotateRocket(1);
      }
    }
  }
}

/*
  A simple rocket class, operating in a vacuum (no friction)
 but with gravity pulling it down.
 */
class Rocket {
  /**
   Initial location of the rocket.
   startX - horizontal position
   startY - vertical position 
   */
  Rocket(int startX, int startY) {
    x = startX;
    y = startY;
  }

  /*
   Increase the thrust the specified amount between 0-100 where
   specifying 100 will increase to MAX_THRUST.
   */
  void increaseThrust(int amount) {
    amount = constrain(amount, 0, 100);
    thrust = thrust + MAX_THRUST*amount/100;
    if (thrust > MAX_THRUST) thrust = MAX_THRUST;
  }

  /**
   Decrease the thrust by the specified amount where decreasing
   by 100 will immediately reduce thrust to zero.
   */
  void setThrust(int amount) {
    initialThrust=thrust;
    amount = constrain(amount, 0, 100);
    thrust = MAX_THRUST*amount/100;
    if (thrust < 0) thrust = 0;
    if (fuel <= 0) {
      thrust=0;
    }
  }

  /**
   Rotate the rocket positive means right or clockwise, negative means
   left or counter clockwise.
   */
  void rotateRocket(int amt) {
    tilt = tilt + amt*TILT_INC;
  }
  void land() {

    if (get((int)x, (int)y)== color(255) && abs(xVel) > .4 && abs(yVel) >.5) {
      background(188, 12, 6);
      PFont font;
      font=loadFont("Arial-BoldMT-40.vlw");
      stroke(255);
      textFont(font, 40);
      text("Too Fast!", width/4, height/2);
      text("Try again!", width/4, (height/2)+40);
      noLoop();
    }
    if (get((int)x, (int)y)== color(255)) {
      background(5, 180, 39);
      PFont font;
      font=loadFont("Arial-BoldMT-40.vlw");
      stroke(255);
      textFont( font, 40);
      text("Good Landing!", width/4, height/2);
      noLoop();
    }
    if (get((int)x, (int)y) == color(255, 0, 0)) {
      background(188, 12, 6);
      PFont font;
      font=loadFont("Arial-BoldMT-40.vlw");
      stroke(255);
      textFont(font, 40);
      text("You Lose!", width/4, height/2);
      noLoop();
    }
  }

  /**
   Adjust the position and velocity, and draw the rocket.
   */
  void update() {
    x = x + xVel;
    y = y + yVel;
    xVel = xVel - cos(tilt)*thrust;
    yVel = yVel - sin(tilt)*thrust + GRAVITY;
    fuel=fuel-initialThrust*7;
    land();

    // to make it more stable set very small values to 0
    if (abs(xVel) < 0.000005) xVel = 0;
    if (abs(yVel) < 0.000005) yVel = 0;


    // draw it
    pushMatrix();
    translate(x, y);
    rotate(tilt - HALF_PI); 
    // draw the rocket body
    stroke(206, 180, 73);
    triangle(0, -30, 8, 0, -8, 0); // bad magic numbers here for the simple rocket body
    ellipse(0, -15, 15, 35);
    // draw the rocket thrust "flames"
    line(0, 0, 0, thrust * FLAME_SCALE);

    popMatrix();
    //  println(x + ", " + y + ", " + xVel + ", " + yVel);
  }
  private float x, y, xVel, yVel, thrust = GRAVITY, tilt = HALF_PI;
  // the values below were arrived at by trial and error
  // for something that had the responsiveness desired
  float initialThrust;
  static final float GRAVITY = 0.006;
  static final float MAX_THRUST = 3*GRAVITY;
  static final float TILT_INC = PI/40;
  static final int FLAME_SCALE = 1000; // multiplier to determine how long the flame should be based on thrust
}

