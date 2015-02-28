
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/36277*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
Spaceship S1;
Laser laser;
Circle c[] = new Circle[4]; // Number of Asteroids

PFont titleFont = createFont("Impact", 48);
PFont scoreFont = createFont("14Segment", 24);
PFont basicFont = createFont("Palatino Linotype", 18);

int INTRO     = 0;
int RUN_GAME  = 1;
int GAME_OVER = 2;

// the gameState variable contains current state
int gameState = INTRO;
int score = 0;

/////////////////////////////////////////////////////////

void setup() {
  size(500, 500);
  smooth();

  laser = new Laser(0, 0, 0, 0);

  S1 = new Spaceship(200, 200, 1);

  for (int i=0; i < c.length; i++) {
    c[i] = new Circle(random(width), random(height), random(50, 100), random(-2, 2), random(-2, 2));
  }
}

///////////////////////////////////////////////////////

void draw() {
  if (gameState == INTRO) {
    intro();
  }
  else if (gameState == RUN_GAME) {
    run_game();
  }
  else if (gameState == GAME_OVER) {
    game_over();
  }
}

////////////////////////////////////////////////////////

void intro() {
  background(96, 76, 15);    
  fill(255);
  // draw the title screen 
  textFont(titleFont);
  textAlign(CENTER);
  text("ASTEROIDS", width/2, height/2);
  textFont(basicFont);
  text("start", width/2, height/3 * 2);
}

////////////////////////////////////////////////////////

void run_game() {

  background(0);
  //score manager
  //score++;
  show_score();

  laser.display();


  for (int i=0; i < c.length; i++) {
    if ( c[i].alive == true) {
      if (intersect(S1.x, S1.y, 50, 
      c[i].x, c[i].y, c[i].radius) == true) {
        gameState = GAME_OVER;
      } 
      c[i].display();
      c[i].move();
    }
  }


  S1.display();
  S1.move(); 
  /// Laser intersect with circle
  for (int i=0; i < c.length; i++) {
    if ( c[i].alive == true) {
      if (intersect(laser.midx, laser.midy, 20, 
      c[i].x, c[i].y, c[i].radius) == true) 
      {
        c[i].alive = false;
        score += 10;
      }
    }
  }
  
  // check if all the asteroids are gone
  boolean allDead = true;
  for (int i=0; i < c.length; i++) {
    if ( c[i].alive == true ) allDead = false;
  }
  if ( allDead == true ) {
     // go the next level 
  }

  if (keyPressed) {
    if (keyCode == RIGHT) {
      S1.Clockwise();
    }
  }
  if (keyPressed) {
    if (keyCode == LEFT) {
      S1.CounterClockwise();
    }
  }

  if ( laser.launched == false ) laser.Rotation = S1.Rotation;


  if ( laser.launched == true ) laser.move();
  else laser.moveTo( S1.x, S1.y );
}

void keyPressed() {
  if (key == ' ') laser.launched = true;
}

///////////////////////////////////////

void game_over() {
  background(200, 0, 0);

  // draw the balls and the player, but don't move them 
  for (int i=0; i < c.length; i++) {
    c[i].display();
  }
  S1.display();

  // draw the game over messge
  fill(0);
  textFont(titleFont);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);

  show_score();
}

///////////////////////////////////////////////

void show_score() {
  // draw the score
  fill(0, 255, 100);
  textFont(scoreFont);
  textAlign(LEFT);
  text(score, 10, 30);
}

///////////////////////////////////////////////

void mousePressed() {
  if (gameState == GAME_OVER || gameState == INTRO) {
    gameState = RUN_GAME; // start the game  
    score=0;
    S1.y = 0;
    S1.x = 0;
    S1.Rotation = 0;
    laser.midx = S1.x;
    laser.midy = S1.y;
    laser.launched = false;
    // make all the asteroids alive again 
    // maybe randomize their position
    for (int i=0; i < c.length; i++) {
      c[i].alive = true;  
    }
  }
}
boolean intersect(float x1, float y1, float d1, 
float x2, float y2, float d2 ) {
  float d = dist(x1, y1, x2, y2);
  if ( d < (d1/2 + d2/2) ) return true;  
  else return false;
}

////////////////////////////////////////////////////

class Circle {
  float x, y, speedX, speedY, radius;
  boolean alive = true;

  Circle(float x, float y, float radius, float speedX, float speedY) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.speedX = speedX;
    this.speedY = speedY;
   
  }

  void display() {
    fill(96,76,15);
    ellipse(this.x, this.y, this.radius, this.radius);
  }

  void move() {
    x = x + speedX;
    y = y + speedY;

    /*if (x > (width-radius) || x < radius) {
     speedX = speedX * -1;
     }
     if (y > (height-radius) || y < radius) {
     speedY = speedY * -1;
     }
     } */
    if (this.x > width + radius + radius/2) {
      this.x = 0;
    }
    if (this.y > height + radius + radius/2) {
      this.y = 0;
    }
    if (this.x < 0 - radius/2) {
      x = width;
    }
    if (this.y < 0 - radius/2) {
      this.y = height;
    }
  }
}
// "I'm not talented, I'm just awesome" - Matthew Marchildon
// "I think of him as a little kid, like a midget. A cute midget" - Natalie Schabo

class Laser {
  float x1, y1, x2, y2;
  float Speed = 15;
  float Rotation = 0;
  float l = 25;
  float midx = (x2-x1);
  float midy = (y2-y1);
  boolean launched = false;
  float nx, ny;

  Laser(float x1, float y1, float x2, float y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }

  void display() {
    //midx = (x2-x1);
    //midy = (y2-y1);
    stroke(0, 255, 0);
    strokeWeight(3);
    pushMatrix();
    translate(midx, midy);
    rotate(Rotation);
    line(0, -20, 0, 20);
    //ellipse(0, 0, 10, 10);
    popMatrix();
    stroke(0);
    strokeWeight(1);
  }

  void moveTo( float nx, float ny ) {
    pushMatrix();
    midx = nx;
    midy = ny;
    popMatrix();
  }

  void move() {
    midx += cos(Rotation - PI/2) * Speed;
    midy += sin(Rotation - PI/2) * Speed;
    
    if (midx > 500 || midx < -500 || midy > 500 || midy < -500) {
      launched = false;
    }
  }

  void keyReleased() {
    if (key == 32) {
      y1 -= sin(Rotation - PI/2) * Speed;
      y2 -= sin(Rotation - PI/2) * Speed;
    }
  }

 /*
 void Clockwise() {
    Rotation = Rotation + 0.05;
  }

  void CounterClockwise() {
    Rotation = Rotation - 0.05;
  }
  */
}

class Spaceship {
  float Size;
  float x;
  float y;
  float a = 1;
  float Speed = 2;
  float Rotation = 0;
  float xPos, yPos;
  float intX = 0;
  float intY = 0;

  Spaceship(float xx, float yy, float Size) {
    this.x = xx;
    this.y = yy;
    this.Size = Size;
  }

  void display() {
    stroke(255, 0, 0);
    line(width/2, 0, width/2, height);
    stroke(0, 255, 0);
    line(0, height/2, width, height/2);
    stroke(0);
    fill(255, 128);
    //translate(width/2, height/2);
    pushMatrix();    
    translate(x, y);
    
    rotate(Rotation);
    //translate(-intX, -intY);
    
    arc(intX*Size, intY - (25*Size), 25*Size, 25*Size, PI, TWO_PI);
    triangle(intX - (37.5*Size), intY + (25*Size),  intX - (12.5*Size), intY - (25*Size), intX - (12.5*Size), intY + (25*Size));
    triangle(intX + (12.5*Size), intY + (25*Size), intX + (12.5*Size), intY - (25*Size), intX + (37.5*Size), intY + (25*Size));
    rectMode(CENTER);
    rect(intX + 0, intY + 0, 25*Size, 50*Size);
 
    
    popMatrix();
  }

  void move() {
    // Forward
    if(keyPressed) {
      if (keyCode == UP) {
        y += sin(Rotation - PI/2) * Speed;
        x += cos(Rotation - PI/2) * Speed;
        translate(x, y);
        rotate(Rotation);
        fill(255, 0, 0, 128);
        triangle(intX - (12.5*Size), intY + (25*Size), intX - (10.5*Size), intY + (35*Size), intX - (8.5*Size), intY + (25*Size));
        triangle(intX - (4.5*Size), intY + (25*Size), intX - (2.5*Size), intY + (35*Size), intX - (0.5*Size), intY + (25*Size));
        triangle(intX + (12.5*Size), intY + (25*Size), intX + (10.5*Size), intY + (35*Size), intX + (8.5*Size), intY + (25*Size));
        triangle(intX + (4.5*Size), intY + (25*Size), intX + (2.5*Size), intY + (35*Size), intX + (0.5*Size), intY + (25*Size));
        fill(255, 128, 0);
        triangle(intX - (8.5*Size), intY + (25*Size), intX - (6.5*Size), intY + (35*Size), intX - (4.5*Size), intY + (25*Size));
        triangle(intX + (8.5*Size), intY + (25*Size), intX + (6.5*Size), intY + (35*Size), intX + (4.5*Size), intY + (25*Size));
      }
    }
    // Reverse
    if(keyPressed) {
      if (keyCode == DOWN) {
        float speed = 1;
        y -= sin(Rotation - PI/2) * speed;
        x -= cos(Rotation - PI/2) * speed;
      }
    }
    
    // X-Axis loop to opposite side
    if (this.x > 500) {
      this.x -= 500;
    }
    else if (this.x < 0) {
      this.x += 500;
    }
    
    // Y-Axis
    if (this.y > 500) {
      this.y -= 500;
    }
    else if (this.y < 0) {
      this.y += 500;
    }
  }

  void Clockwise() {
    Rotation = Rotation + 0.05;
  }

  void CounterClockwise() {
    Rotation = Rotation - 0.05;
  }
}




