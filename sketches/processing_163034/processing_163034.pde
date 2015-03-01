
// 3 layers of parallax floating Balls/Balloons
// by Birgit Bachler, 2013
// www.birgitbachler.com

// Ball class adapted from
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 10-2: Bouncing ball class

//number of balls in 3 layers
int bground = 30;
int mdground =40;
int frground = 25;

//array length = all layers together
int total = bground+mdground+frground;

//size of balls in 3 layers
int bgsize = 25;
int mdsize = 50;
int frsize = 80;

//Initialize Color Array, colors by https://kuler.adobe.com/Retro-Rain-color-theme-2861967/
color[] colors= { 
  color(254, 67, 101, 240), 
  color(252, 157, 154, 240), 
  color(249, 205, 173, 240), 
  color(200, 200, 169, 240), 
  color(131, 175, 155, 240),
};

//ball array
Ball[] balls;

void setup() {
  size(1280, 720);
  frameRate(25);
  smooth();
  
  //we fill the Ball array backrgound, midground, foreground
  balls = new Ball[total];
  for (int i = 0; i < balls.length; i++) {
    if (i < bground) {
      balls[i] = new Ball(bgsize);
    } else if (i < mdground+bground) {
      balls[i] = new Ball(mdsize);
    } else if (i >= mdground) {
      balls[i] = new Ball(frsize);
    }
  }
}

void draw() {
  background(255, 255, 236);

  // Move and display balls
  for (int i = 0; i < balls.length; i++) {
    balls[i].move();
    balls[i].display();
  }
}

class Ball {
  int size;  // size
  float r;   // radius
  float x, y; // location
  float xspeed; // speed
  color bcolor; // color

    // Constructor
  Ball(float tempR) {
    r = tempR;
    x = random(width);     //position the balls randomly on the canvas
    y = random(height);
    xspeed =  map(r, bgsize, frsize, 2, 8);     //map the speed in x-direction based on the size/layer of the balls
    bcolor = colors[(int) random(0, colors.length)];    //assign a random color value from the colors array
  }

  void move() {
    x += xspeed*mouseX/width; // Increment x
    y += map(mouseY, 0, height, -5, 5);

    // Check edges
    if (x > width+r || x < -r) {
      x= -r-random(width)/2;
      y = random(height);
    }
    if (y > height+r || y < -r) {
      x= -r-random(width)/2;
      y = random(height);
    }
  }
  void display() {  // Draw the ball
    noStroke();
    fill(bcolor);    // assign fill color
    pushMatrix();
    translate(x,y);     //translate in x and y direction
    ellipse(0, 0, r, r);     // draw the ball
    popMatrix();
  }
}


