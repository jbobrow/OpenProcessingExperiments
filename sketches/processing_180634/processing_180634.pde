
//LET'S BOUNCE A BALL
PFont font;
float alpha = 180; //alpha on ball
float dampen = 0.9; //dampening effect when ball hits wall

int balltotal = 1; //array size of 1
Ball[] ball = new Ball[balltotal];

int [] colour_r = {  
  255, 0, 5, 167, 0, 126
};
int [] colour_g = {
  231, 206, 17, 255, 175, 61
};
int [] colour_b = {
  46, 255, 229, 36, 71, 196
};

void setup() {
  font = loadFont("SerifaStd-Light-200.vlw");
  size (800, 800);
  smooth();
  // Create ball 0 (cw_, xspeed_, yspeed_, xpos_, ypos_, alpha_, gravity_)  
  ball[0] = new Ball(random(30, 70), random(1, 20), 0, random(0, 30), random(0, height/2), random(0.5, 1), 255, 231, 46);
}

void draw() {
  background(255);
  textFont(font, 100);
  textAlign(CENTER, CENTER);
  ball[0].displayText(); //press keys and display text for keypresses
  addBall();

  for (int i = 0; i < ball.length; i++) {
    ball[i].dampenBounce(); //press d to dampen bounce
    ball[i].mouseOver(); //mouseOver to highlight ball and grow ball
    ball[i].drawEllipse(); //draw ball
    ball[i].ballChange(); //ball changes during keypress
  }
}

//press spacebar to add ball
void addBall()
{ 
  if (keyPressed && key == ' ') {
    // add ball (cw_, xspeed_, yspeed_, xpos_, ypos_, alpha_, gravity_)  

    int x = int(random(0, 6));
    int r = colour_r[x];
    int g = colour_g[x];
    int b = colour_b[x];


    Ball B = new Ball(random(5, 100), random(1, 20), 1, mouseX, mouseY, random(-0.5, 0.5), r, g, b);
    ball = (Ball[]) append(ball, B);
  }
}


class Ball {

  float cw; // width of ellipse
  float xspeed; 
  float yspeed;
  float xpos;
  float ypos; 
  float alpha;
  float r;
  float g;
  float b;
  float gravity;

  Ball(float cw_, float xspeed_, float yspeed_, float xpos_, float ypos_, float gravity_, float r_, float g_, float b_)
  {
    cw = cw_;
    xspeed = xspeed_;
    yspeed = yspeed_;
    xpos = xpos_;
    ypos = ypos_;
    r = r_;
    g = g_;
    b = b_;
    gravity = gravity_;
  }

  //draws ball
  void drawEllipse() {
    fill(r, g, b, alpha);
    noStroke();
    ellipse(xpos, ypos, cw, cw);
    xpos = xpos + xspeed; //increase xpos constantly
    ypos = ypos + yspeed; //increase ypos constantly
    yspeed = yspeed + gravity; // increases vertical velocity over time (Acceleration)
  }

  void dampenBounce()
  {
    if (xpos > width-cw/2 || xpos < cw/2){
      xspeed = xspeed*(-dampen); // if ball hits any wall, reverse xspeed
    }
    if (ypos > height-cw/2 || ypos < cw/2){
      yspeed = yspeed*(-dampen); // if ball hits any wall, reverse yspeed
    }
    xpos = constrain(xpos, cw/2, width-cw/2); //make sure ball does not leave window
    ypos = constrain(ypos, cw/2, height-cw/2); //make sure ball does not leave window
  }

  void increaseWidth(){
    cw = cw+2;
  }
  
  void decreaseWidth(){       
    cw = cw-2;
  }

  void antiGravity()
  {
    if (gravity > 0)
    {
      gravity = -gravity; //up is gravity
    }
  }

  void regularGravity()
  {
    if (gravity < 0)
    {
      gravity = - gravity; //down is gravity
    }
  }
  void randomPosition()
  { 
    xpos = random(cw+10, width-cw-10); //ball generates at any x position
    ypos = random(cw+10, height/2); // ball always generates above horizontal middle
  }

  void increaseSpeed()
  {
    //if moving from left to right
    if (xspeed > 0)
    {
      xspeed = xspeed + 1;
    }
    // if moving from right to left
    else if (xspeed < 0)
    {  
      xspeed = xspeed - 1;
    }
    else
    {
      xspeed = xspeed;
    }
  }


  void displayText()
  {
    fill(30, 90);
    textSize(cw*2);

    if (keyPressed) {
      if (key == 'i') {
        text("speeding!", width/2+xspeed, height/4);
      }
      if (key == 'p')
      {
        text("grow", width/2, height/4);
      }
      if (key == 'o')
      {
        text("shrink", width/2, height/4);
      }
      if (key == 'g')
      {
        text("anti-gravity!", width/2, height/4+ypos/2);
      }
      if (key == 'f')
      {
        text("gravity!", width/2, height/4+ypos/2);
      }
    }
  }

  void mouseOver()
  {
    if (mouseX <= xpos + cw/2 && mouseX >= xpos - cw/2 && mouseY <= ypos + cw/2 && mouseY >= ypos - cw/2){
      cw=cw+1; //increase ball width
      alpha = 200; //becomes saturated
    }
    else{
      alpha = 130; //reset alpha to original
      cw = cw-0.07; //reduce ball width as time passes
    }
    cw = constrain(cw, 0, 150); //stops ball from being too big
  }

  void ballChange()
  {
    if (keyPressed) {
      if (key == 'i') {
        increaseSpeed();
      }
      if (key == 'p') {
        increaseWidth();
      }
      if (key == 'o') {
        decreaseWidth();
      }
      if (key == 'r') {
        randomPosition();
      }
      if (key == 'f') {
        antiGravity();
      }
      if (key == 'g') {
        regularGravity();
      }
    }
  }
}



