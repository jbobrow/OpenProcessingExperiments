
Blob blob;
//array of balls (#3 of hw assignment)
Ball[] balls = new Ball[15];
//create a font f
PFont f =createFont("AmericanTypewriter", 48, true);
//create booleans for winning/losing the game
boolean lost=false;
boolean won=false; 

void setup()
{
  size(500, 600);
  smooth();
  noStroke();
  background(0);
  //instantiate a blob in the middle with 10 units of wobbling and angle of oscillation for wobbling of 0
  blob = new Blob(width/2, 10, 0);
  //create array of 25 balls
  for (int i=0; i<balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  fill(0, 50);
  rect(0, 0, width, height);
  //draw and update the blob
  blob.draw();
  blob.update();
  //draw and update the balls
  for (int i=0; i<balls.length; i++) balls[i].draw();
  for (int i=0; i<balls.length; i++) balls[i].update();
  //check if player restarts game
  keyPressed();
  //check if game restart text should be displayed
  restartText();
}

void keyPressed() {
  //reset position and size of blob, get rid of you won/lost
  if (key=='r') {
    blob.r=3;
    blob.x=width/2;
    lost=false;
    won=false;
  }
}

void restartText() {
  //display text for restarting game when player wins or loses
  if (won || lost) {
    textFont(f, 20);
    fill(125);
    textAlign(CENTER);
    text("to play again, press 'r'", width/2, 2*height/3);
  }
}

//class describing what blob does
class Blob {
  float x, y;
  float vx;
  float w;
  float a;
  float r=2;

  //initialize a Blob at given x coordinate and wobbling size and angle
  Blob(float x0, float w0, float a0) {
    x=x0;
    w=w0;
    a=a0;
  }

  void draw() {
    fill(255, 200);
    //draw an ellipse with oscillating height and width
    ellipse(x, y, w*sin(a)/2+(r*2+w), w*cos(a)/2+(r*2+w));
  }

  void update() {
    //use 'j' and 'k' keys to control blob velocity 
    //(#1 of hw assigment)
    if (keyPressed) {
      if (key=='j') {
        vx=vx-0.05;
      }
      if (key=='k') {
        vx=vx+0.05;
      }
    }
    //update blob position
    x+=vx;
    //update blob height (stays at bottom of canvas)
    y=height-(r+w);
    //update angle of oscillation
    a+=0.1;

    //you win if the blob becomes as wide as the canvas
    if (r>width/2-30) {
      won=true;
    }
    //check if you need to display win text
    win();
  }

  void win() {
    if (won) {
      textFont(f, 40);
      fill(0);
      textAlign(CENTER);
      text("YOU WIN! ", width/2, 3*height/7);
    }
  }
}

//class describing balls
class Ball {
  float x, y;
  float vy;
  float timer;
  float dt;
  //randomize colors
  float R=random(255);
  float G=random(255);
  float B=random(255);
  //gravity (#2 of hw assignment)
  float g=random(0, 0.03);
  float r=random(1, 45);
  boolean on=false;

  //initialize ball
  Ball() {
  }

  //turn on balls
  void balls() {
    on=true;
    x=random(width);
    //balls begin spread out 
    y=random(-500, -40);
    vy=random(0, 1.5);
    //counts down to when balls disappear (height*2 to account for the -500)
    timer=height*2;
  }


  void draw() {
    //draw ellipses that fade with the timer
    if (!on) return;
    fill(R, G, B, timer);
    ellipse(x, y, 2*r, 2*r);
  }

  void update() {
    //check if balls are off and initialize balls if they are
    if (!on) {
      balls(); 
      return;
    }
    //update the velocity by adding acceleration
    vy += g;
    //update the position by adding velocity
    y += vy;
    //change in timer depends on velocity
    //update the timer
    dt=vy;
    timer-=dt;
    //when timer reaches 0, turn off that ball
    if (timer < 0) {
      on=false;
    }

    //you lose if blob touches the edge
    if (blob.x!=constrain(blob.x, 0+blob.r, width-blob.r)) 
    {
      lost=true;
    }
    //check if ball absorbs or is absorbed
    absorb();
    //check if you need to display 'you lose' text
    lose();
  }

  void lose() {
    //make sure you lose doesn't overlap with you win
    if (lost && !won) {
      //blob stops moving left/right and follows ball that absorbed it
      blob.vx=0;
      blob.y=y;
      //move blob outside of canvas so it doesn't return with ball array
      if (y>height+r) 
        blob.x=2*width;
      //display 'you lose' text
      textFont(f, 40);
      fill(255);
      textAlign(CENTER);
      text("YOU LOSE.", width/2, height/3);
    }
  }

  void absorb() {
    for (int i=0; i<balls.length; i++) {
      //compare distance between centers with sum of radii to see if there has been a collision
      float d = dist(x, y, blob.x, blob.y);
      float md = blob.r+r;
      //if there is a collision, blob becomes larger and ball is moved out of screen
      if (d<md) {
        if (blob.w/2+blob.r>r) {
          blob.r=r/5+blob.r;
          y=2*height;
        }
        //compare radius of blob (without oscillation) with radius of touching ball
        if (blob.w/2+blob.r<r) {
          //if blob is smaller, you lose
          lost=true;
        }
      }
    }
  }
}





