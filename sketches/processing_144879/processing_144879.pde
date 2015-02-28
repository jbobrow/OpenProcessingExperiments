
/*******************************************************
COSMIC PINBALL V1.0
Chris Henrick
August 14th, 2013
Parsons MFA DT Bootcamp 2013
========================================================
with help from Jennifer Presto on the timer and adding a
  force vector using mousePressed() and mouseReleased()
********************************************************/


Ball pinball; // define a class named pinball
Bumper[] bumpers; // define a class named bumpers that's an array

int numBumpers; // number of bumpers

float mouseXstart, mouseYstart, mouseXend, mouseYend; // for tracking mouse position change in mouse dragged functions
float calcX, calcY; // difference in above positions

PVector force; // a new force to be added from dragging mouse

PFont font; // will store a font in this variable
int timer, lastSavedTime, timeCurrent, secondsPassed, timeMax; //variables for time

int gamePoints; // displaying points
int totalPoints; // display total points at end

//boolean gameStarted = false;

int gameStage; // assign numbers to each stage of game


// initialize stuff...
void setup(){
  size(800, 600);
  smooth();
  background(255);
  colorMode(HSB);
  
  gameStage = 0;
 
  font = loadFont("Archer-Book-24.vlw");
  
  numBumpers = int(random(4, 10));
  
  force = new PVector(0,0);
  
  lastSavedTime = millis();
  timeMax = 60;
  
  gamePoints = 0;
  totalPoints = 0;
  
  //gameStarted = false;
  
  pinball = new Ball();
  bumpers = new Bumper[numBumpers];
  
  // initialize the array
  for (int i = 0; i<numBumpers; i++){
    bumpers[i] = new Bumper(i);
    
 //println(bumpers[i].morePoints); //debug
  }
  
}


// draw forever
void draw(){
  
  noStroke();
  fill(0, 10);
  rect(0,0,width,height);
  
  
  if (gameStage == 0){
    startGame();
  }
  
  if (gameStage == 1){
    pinballStart();
  }
  
  if (gameStage == 2){
    gameOver();
  }

}


// global functions called when mouse interaction occurs to add force to the pinball by dragging the mouse...
void mousePressed(){
  mouseXstart = mouseX;
  mouseYstart = mouseY;
}

void mouseReleased(){
  mouseXend = mouseX;
  mouseYend = mouseY;
  calcX = 0.005 * (mouseXstart - mouseXend); //scale it down so that it doesn't go cray!
  calcY = 0.005 * (mouseYstart - mouseYend);
  pinball.addForce(calcX, calcY);
}

// detect when pinball collides with bumpers
void detectCollision(){
  
  for (int i=0; i<numBumpers; i++){
    float distance = dist(bumpers[i].posX, bumpers[i].posY, pinball.pos.x, pinball.pos.y);
    
    if (distance <= bumpers[i].size/2){
      pinball.userPoints += bumpers[i].morePoints; // upon collision add points
      pinball.pos.x -= pinball.vel.x*2.0;
      
      pinball.vel.x*= -0.95;
    }
    if (distance <= bumpers[i].size/2){
      pinball.pos.y -= pinball.vel.y*2.0;
      
      pinball.vel.y*= -0.95;
    }
  }
  
}

// count it down...
void clock(){
  
  if (gameStage == 1){
  
  fill(0);  
  rect(5, 15, 135, 35);
  
  fill(255);
  textFont(font);
  
  timer = timeMax - secondsPassed;
  String t = "time left :" + nf(timer, 2);
  text(t, 10, 40);
  }
}

// count those points...
void pointCounter(){
  
  if (gameStage == 1){
  
  fill(0);  
  rect(width - 205, 15, width, 35);
  
  gamePoints = pinball.userPoints;
  fill(255);
  textFont(font);
  
  String t = "points: " + gamePoints;
  text(t, width-200, 40);
  }
}

// games over
void gameOver(){
  
  gameStage = 2;
  
  background(255);
  fill(0);
  String end = "Game Over!";
  translate(0,0);
  text(end, 320, 250);
  pinball.active = false;
  
  totalPoints = gamePoints;
  String tp = "Total Points: " + totalPoints;
  text(tp, 320, 300);
  
  pinball.invoke();

}

// not actually start of game, just beginning message
void startGame(){
  
  gameStage = 0;
 
  background (255);
  
  String top = "CRAY CRAY PINBALL V1.0";
  String mid = "Drag and release the mouse to control the pinball";
  String start = "Press any key to Start.";
  
  fill(0);
  textFont(font);
  
  text(top, width/2-300, height/2 - 40);
  text(mid, width/2-300, height/2);
  text(start, width/2-300, height/2 + 40);
  

}

// the actual game
void pinballStart(){
  
  gameStage = 1;
  
  println(secondsPassed);
      
    // count down from timeMax
    if (millis() - lastSavedTime > 1000){
      secondsPassed ++;
      lastSavedTime = millis();
    }
        
    // draw the bumpers
    for (int i = 0; i<numBumpers; i++){
      bumpers[i].display();
      bumpers[i].showPoints();
    }

      // get the user's pinball in there!
    if (keyPressed){
        pinball.invoke();
    }
    
    pinball.display();
    pinball.update();
    pinball.checkBounds();
      
    detectCollision();
  
  // if start time exceeds total time or pinball falls off bottom then end game
  if (secondsPassed >= timeMax || pinball.pos.y > height + pinball.diam/2){
    gameOver();
  }
  
  clock();
  pointCounter();
  
}
  

void keyPressed(){
  
  if (gameStage == 0){
    gameStage = 1;
  }
   
  if (gameStage == 2){
    gameStage = 0;
  }
}

//boolean sketchFullScreen{

class Ball{
  
  // vectors for position, acceleration, velocity
  PVector pos;
  PVector acc;
  PVector vel;
  PVector grv;
  
  // variable for the diameter
  int diam;
  int buff;
  int userPoints;
  
  boolean active;
    
  // pinball constructor
  Ball(){
    pos = new PVector((width*0.9), random(height));
    acc = new PVector(0, -0.5);
    vel = new PVector(0, 0);
    grv = new PVector(0, 0.02);

    diam = 30;
    buff = diam/2;
    
    userPoints = 0;
    
    active = false;
    
  }
  
  // combine properties of different vectors
  void update(){
      if (active){
      vel.add(acc);
      acc.mult(0);
      vel.mult(0.999);
      pos.add(vel);
      pos.add(grv);
    }
  }
  
  // here is where a mouseDragged and mouseReleased functions
  // could add a new force to the pinball
  void addForce(float x, float y){
    PVector force = new PVector(x, y);
    acc.add(force);

  }
  
  // draw the ball
  void display(){
    if (active){
        noStroke();
        fill(random(255), random(255), random(255));
        ellipse(pos.x, pos.y, diam, diam);
    }
  }
  
  void invoke(){
    active = true;
    pos.x = width*0.9;
    pos.y = random(height);
  }
  
  // some bouncy ball rebounding
  void checkBounds(){
    if (pos.x > width-buff) {
      vel.x *= -1;
    } else if (pos.x < buff) {
      vel.x *= -1;
    }
    
    if (pos.y > height+buff) {
      active = false;
    } else if (pos.y < buff) {
      vel.y *= -1;
    }
  }
}
class Bumper{
  
  int size, index;
  float posX, posY;
  
  String label;
  
  int[] points = {100, 200, 300, 400, 500};
  int morePoints;
  
  boolean works;
  
  Bumper(int tempIndex){
    
    posX = random(0, width*.8);
    posY = random(height);
    
    size = int(random(50, 100));
    
    index = tempIndex;
    
    works = false;
    
    morePoints = points[int(random(points.length))];
   

  }
  
  void display(){
    strokeWeight(5);
    stroke(random(360));
    float time = millis()/300.0; // add variable for time
    float sine = sin(time); //get sine wave value

    float hue = map(sine, -1, 1, 0, 360); // apply sine value to variables for hue, sat, bri
    float sat = map(sine, -1, 1, 0, 100);
    float bri = map(sine, -1, 1, 0, 100);
    
    fill(random(hue), 150, 2000);
    ellipse(posX, posY, size, size);
  }

  void showPoints(){
    fill(255);
    textFont(font);
    label = nf(morePoints, 3);
    text(label, posX-20, posY+10);
  }


}


