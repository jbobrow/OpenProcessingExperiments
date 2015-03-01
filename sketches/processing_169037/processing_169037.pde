
// Spawn balls from a mouseclick point with random x and y speeds.
// Ball array

MakeBall[] balls = new MakeBall[1];

//Initial conditions
float gravity = 0.3;
float elasticity = .80;
float xSpeed = 0;
float ySpeed = 0;
boolean tossmode = false;

void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  //Generate the ball array
  for (int i=0; i < balls.length; i++) {
    balls[i] = new MakeBall(color(107, 107, 107), random(width), random(height), 20, 0, 0);
  }
}

void draw() {
  background(255);
  // The code for the "toss" option.
  if (tossmode==true)
  {
    if ( mouseX-pmouseX > 0 ) {
      xSpeed = abs(mouseX-pmouseX);
    } 
    else {
      xSpeed = -abs(mouseX-pmouseX);
    }

    if ( mouseY-pmouseY > 0 ) {
      ySpeed = abs(mouseY-pmouseY);
    } 
    else {
      ySpeed = -abs(mouseY-pmouseY);
    }
  }
  for (int i=0; i < balls.length; i++) {
    balls[i].gravity();
    balls[i].move();
    balls[i].render();
  }
}


//Spawns a new ball when mouse is pressed
void mousePressed() {
  if (tossmode==false)
  {
    MakeBall b = new MakeBall(color(107, 107, 107), mouseX, mouseY, 20, random(-2, 2), 
    random(-2.2));
    balls = (MakeBall[]) append(balls, b);
  }
  else 
  {
    MakeBall b = new MakeBall(color(107, 107, 107), mouseX, mouseY, 20, xSpeed, 
    ySpeed);
    balls = (MakeBall[]) append(balls, b);
  }
}

// Activate tossmode
void keyPressed() {
  if(tossmode==false)
  {
    tossmode=true;
  }
  else if(tossmode==true)
  {
    tossmode=false;
  }
}

//Ball class
class MakeBall {
  float x;
  float y;
  float speedY;
  float speedX;
  float w;
  color c;

  //Initial Constructor
  MakeBall(color cinit, float xinit, float yinit, float winit, 
  float speedXinit, float speedYinit) {
    x = xinit;
    y = yinit;
    w = winit;
    speedY = speedYinit;
    speedX = speedXinit;
    c = cinit;
  }

  //Gravity function
  void gravity() {
    speedY = speedY + gravity;
  }

  //Render function
  void render() {
    fill(c);
    noStroke();
    ellipse(x, y, w, w);
  }

  //Updates the ball's position
  void move() {
    y = y + speedY;
    if (y + w/2> height) {
      c = color(random(255),random(255),random(255));
      speedY = -speedY*elasticity;
      y = height-w/2;
    }
    x = x + speedX;
    if (x + w/2 > width) {
      c = color(random(255),random(255),random(255));
      speedX = -speedX*elasticity;
      x = width - w/2;
    }
    if (x - w/2 < 0) {
      c = color(random(255),random(255),random(255));
      speedX = -speedX*elasticity;
      x = w/2;
    }

    if (y - w/2 <0)
    {
      c = color(random(255),random(255),random(255));
      speedY = -speedY*elasticity;
      y = w/2;
    }
  }
}


