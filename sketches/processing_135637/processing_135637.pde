
//WIGGLY WORM
//By Cooper Thomas
//Professor Casey
//Computer Science 2, Homework #3
//February 21, 2014

//In this groundbreaking game, the player controls Timmy the tapeworm, 
//a lamentably misunderstood invertebrate battling for survival
//against an army of pesky antibiotics. Players control Timmy
//with the mouse. The longer that Timmy evades the antibiotics,
//the more points he will accrue...however, the antibiotics gradually
//move faster and faster, making survival for Timmy progressively more difficult!
//Timmy can also snack on green nutrients to gain bonus points.


//See CThomas_HW3_Info.txt (in sketch folder) for more information.

//GLOBAL VARAIBLES

//the three game states
int menu = 1;
int playing = 2;
int lost = 3;

//game state constant
int gameState;

//scoring variables
int score;
int hiScore;
int scoreUpdate;

//create font for menus and score
PFont font;
PFont fontTitle;
color fontColor;

//starting number of balls
int nBalls = 16;

//Timmy can have up to 15 total joints, but he starts with just 6
WormJoint[] joints = new WormJoint[6];


//the 10 antibiotics automatically regenerate once they leave the screen
Ball[] balls = new Ball[100];

Square[] squares = new Square[8];

void setup()
{

  //canvas and project setup
  size(800, 450);
  smooth();
  frameRate(30);
  noStroke();

  //font initialization
  font = createFont("ArialRoundedMTBold.vlw", 20);
  fontTitle = createFont("BirchStd.vlw", 20);
  fontColor = color(0, random(100, 255), random(100, 240));
  textFont(font);
  textAlign(CENTER);

  //initialize the game (function follows)
  gameInit();
}

//global function that initializes the game
void gameInit()
{

  //game begins on menu screen with score of 0
  gameState = menu;
  score = 0;
  nBalls = 10;
  
  // Construct joints at center of canvas. 
  for (int i=0; i<joints.length; i++)
  {
    joints[i] = new WormJoint(i*width/joints.length, height/2, 4);
  }

  // Create the antibiotic balls
  for (int i=0; i<nBalls; i++) {
    balls[i] = new Ball();
  }

  // Create the tasty nutritional squares
  for (int i=0; i<squares.length; i++) {
    squares[i] = new Square();
  }
}

//create an additional ball every 1000 points
void addBall() {
  balls[nBalls] = new Ball();
  nBalls++;
 //println(nBalls);
}

void draw()
{
  //very slight motion blur
  rectMode(CORNER);
  fill(0);
  rect(0, 0, width, height);


  //conditionally draw game modes
  switch(gameState)
  {

    //THIS IS THE IN-GAME STATE
  case 2:
    noCursor();


    // Draw and update balls
    for (int i=0; i<nBalls; i++) balls[i].draw();
    for (int i=0; i<nBalls; i++) balls[i].update();
    for (int i=0; i<nBalls; i++) balls[i].bounce();

    //Draw and update squares
    for (int i=0; i<squares.length; i++) squares[i].draw();
    for (int i=0; i<squares.length; i++) squares[i].update();
    for (int i=0; i<squares.length; i++) squares[i].bounce();

    //Draw and update wiggly worm
    for (int i=0; i<joints.length; i++) joints[i].draw();

    // Recenter first joint at the mouse
    joints[0].update(mouseX, mouseY);

    // Recenter each following joint at preceding joint
    for (int i=1; i<joints.length; i++)
      joints[i].update(joints[i-1].x, joints[i-1].y);


    //update score each frame
    score++;

    //update, set high score if current score is greater than previous high score
    hiScore = score > hiScore ? score : hiScore;

    //check for collisions between worm head and bonus squares
    for (int j=0; j<squares.length; j++)
    {
      if (dist(mouseX, mouseY, squares[j].x, squares[j].y) <= 20)
      {
        if (squares[j].timer > 0)
        {
          //if there are any collisions, add 100 bonus points, extinguish+reinitialize square, show bonus text
          score += 100;
          squares[j].timer = 100;
          squares[j].dt = 30;
          squares[j].w += 20;
          squares[j].timerBonus = 100;
          squares[j].dtBonus = 0.5;
          fill(squares[j].c, (squares[j].timerBonus));
          textAlign(CENTER);
          textFont(font, 45);
          text("+100", (mouseX), (mouseY));
        }
      }
    }


    //increase level and number of balls every 2000 points
    if (score / 1000 > scoreUpdate)
    {
      addBall();
      scoreUpdate++;
    }

    //check for collisions between worm and balls
    //if there are any collisions, game over!
    for (int j=0; j<nBalls; j++)
      for (int i=0; i<joints.length; i++)
      {
        if (dist(joints[i].x, joints[i].y, balls[j].x, balls[j].y) <= joints[i].r + balls[j].r)
        {
          gameState = lost;
        }
      }

    //display score in left corner
    textAlign(LEFT);
    fill(255);
    textFont(font);
    text("SCORE: " + score, 20, (height - 30));

    //display high score in right corner
    textAlign(RIGHT);
    text("HIGH SCORE: " + hiScore, (width - 20), (height - 30));
    
    

    break;

    //END GAME STATE
  case 3:
    noCursor();

    //display "GAME OVER" messages
    textAlign(CENTER);
    fill(0, 200, joints[0].blue);

    textFont(font, 40);
    text("You killed Timmy, you asshole!", (width/2), (height/2) - 40);
    fill(255);
    textFont(font, 20);
    text("Click to restart game", width/2, height/2);
    textFont(font, 10);
    text("(Hint: Timmy doesn't like sudden movements)", width/2, height/2 + 100);

    //display score in left corner
    textAlign(LEFT);
    textFont(font, 20);
    text("SCORE: " + score, 20, (height - 30));
    

    //display high score in corner
    textAlign(RIGHT);
    text("HIGH SCORE: " + hiScore, (width - 20), (height - 30));

    break;

    //MENU STATE
  case 1:
    noCursor();

    //Draw and update wiggly worm
    for (int i=0; i<joints.length; i++) joints[i].draw();

    // Recenter first joint at mouse position
    joints[0].update(mouseX, mouseY);

    // Recenter each following joint at preceding joint
    for (int i=1; i<joints.length; i++)
      joints[i].update(joints[i-1].x, joints[i-1].y);

    //display start messages
    textAlign(CENTER);
    fill(fontColor);
    textFont(fontTitle, 60);
    text("WIGGLY WORM", width/2, height/2 - 80);

    textFont(font, 16);
    fill(255);
    text("Use the mouse to help Timmy the misunderstood tapeworm evade the evil antibiotics!", 
    width/2, height/2);
    text("Snack on delicious green nutrients for bonus points.", 
    width/2, height/2 + 20);

    textFont(font, 10);
    text("Click anywhere to begin", width/2, height/2 + 80);

    //display high score in corner
    textFont(font, 20);
    textAlign(RIGHT);
    text("HIGH SCORE: " + hiScore, (width - 20), (height - 30));

    break;
  }
}

//if in menu state, mouse click begins game
//if in end game state, mouse click restarts game
void mousePressed()
{
  if (gameState == menu)
  {
    gameState = playing;
  }
  else if (gameState == lost)
  {
    gameInit();
  }
}

class Ball {
  float x, y;   // current position
  float vx, vy;  // velocity
  float vr; //ball radius multiplier (increases over time)
  float r;   //radius
  float vMin;
  float vMax;
  color c; //ball color
  float spring = 0.2; //ball springiness (for collisions)
  boolean on = false;


  Ball() {
  }

  // Initialize ball offscreen (right of canvas)
  void initialize()
  {
    on = true;
    vMin = -5;
    vMax = -2;
    x = random(width+200, width+600); 
    y = random(0, height);
    vx = random(vMin, vMax); 
    vy = random(-2, 2);
    vr = 1;
    r = vr * random(10, 30);
    c = color(random(100, 255), 0, random(0, 100));
  }

  void draw()
  {
    if (!on) return;
    noStroke(); 
    fill(c, 200);
    ellipse(x, y, 2*r, 2*r);
  }

  void update()
  {
    // initialize if necessary
    if (!on) { 
      if (random(0, 1) < 0.5) initialize(); 
      return;
    }

    //move ball
    x += vx;
    y += vy;
    //increase ball velocity multiplier 
    //increase ball radius multiplier

    //reverse ball vy when it hits floor/ceiling
    if (y > height-r || y < r)
    {
      vy = -vy;
    }

    // When ball exits screen, re-initialize
    if (x < 0 ) {
      on = false;
    }
    
    vMin += -0.1;
  }

  //check for ball collisions
  void bounce() {
    for (int i = 0; i < nBalls; i ++) {
      // if this is myself, continue
      if (this == balls[i]) continue;
      // distance between two balls
      float d = dist(x, y, balls[i].x, balls[i].y);
      // minimum distance between two balls
      float md = r+balls[i].r;
      // if I collide with one of them
      if (d < md) {
        // push back in the opposite direction
        float dx = (x - balls[i].x)/d;
        float dy = (y - balls[i].y)/d;
        // check if perfectly overlapping
        if (dx == 0 && dy == 0) { 
          dx = random(-1, 1); 
          dy = random(-1, 1);
        }
        // compute the speed to add
        float s = min(10, spring*(md-d));
        vx += dx*s;
        vy += dy*s;
      }
    }
  }
}

class Square {
  float x, y;   // current position
  float vxx; //velocity multiplier (increases over time)
  float vx, vy;  // velocity
  float w;   //witdh
  color c; //color
  float timer;   // time left before square disappears
  float timerBonus;  //time left before "BONUS!" message disappears
  float dt;  // extinguishing speed
  float dtBonus;  //text extinguishing speed
  float spring = 0.05; //ball springiness (for collisions)
  boolean on = false;

  Square() {
  }

  // Initialize squares offscreen (right of canvas)
  void initialize()
  {
    on = true;
    x = random(width+400, width+800); 
    y = random(0, height);
    vx = random(-10, -4); 
    vy = random(-2, 2);
    w = random(10, 15);
    c = color(0, random(100, 200), random(100));
    timer = 255;
    timerBonus = 0.5;
    dt = random(0.1, 5);
  }

  void draw()
  {
    if (!on) return;
    fill(c, timer); 
    noStroke();
    rectMode(CENTER);
    rect(x, y, w, w);
  }

  void update()
  {
    // initialize if necessary
    if (!on) { 
      if (random(0, 1) < 0.5) initialize(); 
      return;
    }

    //move squares
    x += vx;
    y += vy;
    
    
    //decay transparency
    timer -= dt;
    timerBonus -= dtBonus;


    //reverse square vy when it hits floor/ceiling
    if (y > height-w || y < w)
    {
      vy = -vy;
    }

    // When square exits screen, re-initialize
    if (x < 0 || x > width+601 || timer < 0) {
      on = false;
    }
  }

  //check for square collisions
  void bounce() {
    for (int i = 0; i < squares.length; i ++) {
      // if this is myself, continue
      if (this == squares[i]) continue;
      // distance between two squares
      float d = dist(x, y, squares[i].x, squares[i].y);
      // minimum distance between two squares
      float md = w+squares[i].w;
      // if I collide with one of them
      if (d < md) {
        // push back in the opposite direction
        float dx = (x - squares[i].x)/d;
        float dy = (y - squares[i].y)/d;
        // check if perfectly overlapping
        if (dx == 0 && dy == 0) { 
          dx = random(-1, 1); 
          dy = random(-1, 1);
        }
        // compute the speed to add
        float s = min(10, spring*(md-d));
        vx += dx*s;
        vy += dy*s;
      }
    }
  }
}

//this class defines Timmy's body, which is comprised of joints, links, and his head

class WormJoint {
  float cx, cy;        // rest position
  float x, y;
  float vx=0, vy=0;    // velocity in the two directions   
  float r;        // joint radius
  float k = 0.06;      // spring constant
  float d = 0.75;      // damping
  float hg = 0.5;  // horizontal gravity
  float red = 50;    //color channels
  float green = 200;
  float blue = 200;
  float a;
  float da;

  // Initialize a worm joint at rest position (x0,y0)
  WormJoint(float x0, float y0, float r0)
  {
    x = x0;
    y = y0;
    r = r0;
    a = random(TWO_PI);
    da = radians(2);
  }

  void draw()
  {
    blue = 140 * (1+sin(a));
    //draw worm joints
    stroke(red, green, blue); 
    strokeWeight(4);
    line(cx, cy, x, y);
    fill(red, green, blue); 
    //draw worm eye connectors
    strokeWeight(2);
    line(mouseX, mouseY, mouseX+4, mouseY-12);
    line(mouseX, mouseY, mouseX-4, mouseY-12);
    //draw worm head
    noStroke();
    ellipse(mouseX, mouseY+2, 3*r, 3.5*r);
    ellipse(x, y, 2*r, 2*r);
    //draw worm eyes
    fill(255);
    ellipse(mouseX+4, mouseY-12, 1.5*r, 1.5*r);
    ellipse(mouseX-4, mouseY-12, 1.5*r, 1.5*r);
    fill(0);
    ellipse(mouseX+4, mouseY-12, r-2, r-2);
    ellipse(mouseX-4, mouseY-12, r-2, r-2);
    //draw worm mouth
    stroke(0);
    line(mouseX-2, mouseY+4, mouseX+2, mouseY+4);
  }

  // Update the spring, with a new center
  void update(float ncx, float ncy)
  {
    // set the new center
    cx = ncx; 
    cy = ncy;

    // usual spring stuff
    vx -= k * (x-cx); 
    vy -= k * (y-cy); 
    vx -= hg;
    vx *= d; 
    vy *= d;
    x += vx; 
    y += vy;
    a += da;

//    green += random(-8, 8);
//    blue += random(-8, 8);

    green = constrain(green, 100, 240);
    blue = constrain(blue, 100, 240);
  }
}



