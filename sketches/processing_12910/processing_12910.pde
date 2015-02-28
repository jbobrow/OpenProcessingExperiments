
int rectSize;
int numOfRects;
int canvasSize;
ArrayList balls;
ArrayList visibleCells;
float cellTime;
int MaxBalls;
int backgroundPulseTime1;
int backgroundPulseTime2;
color backgroundcolour;

//Sets up the Scene
void setup(){
  canvasSize = 800;
  frameRate(30);
  smooth();
  MaxBalls = 6;
  
  backgroundcolour = color(0, 0, 0);
  
  size(canvasSize, canvasSize);
  
  rectSize = 25;
  numOfRects = canvasSize / rectSize;
  balls = new ArrayList();
  
  balls.add(new Ball(canvasSize));
  
  visibleCells = new ArrayList();
  cellTime = 18000;
}

// Draws the balls into the scene and controls their movement
void draw(){
  Ball b;
  
  //Colours the background. Performs the "heartbeat".
  int numOfBalls;
  int currentTime = millis();

  if (currentTime % 5000 >= 0 && currentTime % 5000 <= 50){
    backgroundPulseTime1 = currentTime + 100;
    backgroundPulseTime2 = currentTime + 200;
  }
  
  if (currentTime <= backgroundPulseTime1 || (currentTime > backgroundPulseTime2 && currentTime <= backgroundPulseTime2 + 100)){
    backgroundcolour = color(140, 0, 0);
  }
  else{
    backgroundcolour = color(0, 0, 0);
  }
  
  background(backgroundcolour);
  
  //Checks the new position of all the balls onscreen and adds the cells which are brought to life under the balls.
  numOfBalls = balls.size();
  
  for(int i = numOfBalls - 1; i >= 0; i--){
    b = (Ball) balls.get(i);
    b.move();
    checkBallPos(b);
  }
  
  drawCells();
  
  for(int i = numOfBalls - 1; i >= 0; i--){
    b = (Ball) balls.get(i);
    b.display();    
  }
  
  if (millis() > (10000 * numOfBalls) && numOfBalls < MaxBalls){
    balls.add(new Ball(canvasSize));
  }
}


//Function for checking ball position so it doesnt go flying off the canvas and adds new cells under the ball to be drawn
void checkBallPos(Ball b){
  int xloc;
  int yloc;
  int minXLoc;
  int minYLoc;
  int maxXLoc;
  int maxYLoc;  
  boolean cellExists;
  Cell c;
  
  cellExists = false;
  xloc = int(b.getXPos() / rectSize) * rectSize;
  yloc = int(b.getYPos() / rectSize) * rectSize;
  minXLoc = xloc - 12;
  minYLoc = yloc - 12;
  maxXLoc = xloc + 12;
  maxYLoc = yloc + 12;
  
  for(int i = 0; i < visibleCells.size(); i++){
     c = (Cell) visibleCells.get(i);
     
     if (c.getXpos() == xloc && c.getYpos() == yloc){
       c.resetTimer();
       cellExists = true;
       break;
     }
  }
  
  if (!cellExists){
    visibleCells.add(new Cell(xloc, yloc, rectSize, cellTime));
  }
}

//Draws the cells the balls have traveled over them and removes them after a certain time.
void drawCells(){
  Cell c;
  float currTime = millis();
  
  for(int i = visibleCells.size() - 1; i >= 0; i--){
    c = (Cell) visibleCells.get(i);
    
    if(c.finished(currTime)){
      c.drawCell(currTime);
      visibleCells.remove(i);
    }
    else{
      c.drawCell(currTime);
    }
  }
}

//This is the cell class. It holds all the information in the cell, including the Life Time, Position and colour of each cell.
class Cell{
  int xpos;
  int ypos;
  int cellSize;
  int currColorLoc;
  color[] colours = {color(0, 0, 0), color(111, 1, 124), color(38, 36, 255), color(51, 152, 2), color(254, 255, 54), color(234, 133, 24), color(234, 52, 25), color(0, 0, 0)};
  color col;
  float time;
  float startTime;
  float existTime;

  //Setup of the default Cell when it is created.
  Cell(int x, int y, int cSize, float cTime){
    xpos = x;
    ypos = y;
    cellSize = cSize;
    currColorLoc = 0;
    startTime = millis();
    existTime = cTime;
    time = startTime + existTime;
    col = colours[currColorLoc];
  }
  
  //Checks the colour of the cell and draws it onscreen.
  void drawCell(float millsec){
    rectMode(CORNER);
    col = getColor(millsec);
    stroke(col);
    fill(col);
    rect(xpos, ypos, cellSize, cellSize);
  }
  
  //Gets the current colour of the cell, and blends it towards the next colour.
  private color getColor(float diffTime){
    float colTime = (existTime / colours.length) * (currColorLoc + 1);
    
    if (diffTime > (startTime + colTime)){
      currColorLoc++;
    }
    
    return lerpColor(col, colours[min(currColorLoc + 1, colours.length - 1)], 0.03);
  }
  
  //if the cell is brought back to life, reset the colour and life time of the cell
  void resetTimer(){
    currColorLoc = 0;
    col = colours[currColorLoc];
    time = millis() + existTime;
    startTime = millis();
  }
  
  //Checks if the cells life time is over
  boolean finished(float millsec){
    if (millsec >= time){
      return true;
    }
    else{
      return false;
    }
  }
  
  //Returns cell X Position
  int getXpos(){
    return xpos;
  }
  
  //Returns cell Y Position
  int getYpos(){
    return ypos;
  }
}


//Controls ball movement and how it travels over the campus based on its position and speed.
class Ball{
  private float xpos;
  private float ypos;
  private float xspeed;
  private float yspeed;
  private float speed;
  private float radius;
  private int canvasSize;
  private color c;
  
  //setup default ball
  Ball(int cSize){
    c = color(255, 192, 83);
    radius = 25;
    canvasSize = cSize;
    
    xpos = random(canvasSize);
    
    if(xpos > (canvasSize - (radius / 2))){
       xpos = canvasSize - (radius / 2);
    }
    
    ypos = random(canvasSize);
    
    if(ypos > (canvasSize - (radius / 2))){
       ypos = canvasSize - (radius / 2);
    }
    
    speed = 4;
    
    xspeed = random(-1, 1) * speed;
    yspeed = random(-1, 1) * speed;
  }
  
  //Draws the ball to the new random position
  void display(){
    ellipseMode(CENTER);
    stroke(c);
    fill(c);
    ellipse(xpos, ypos, radius, radius);
  }
  
  //Moves the ball in a straight line, based upon the speed and direction. If it hits a wall, select a new random direction.
  void move(){
    float tmppos;
    xpos += xspeed;
    
    tmppos = constrain(xpos, 0, canvasSize - (radius / 2));
    if(xpos != tmppos){
      xpos = tmppos;
      xspeed = random(-1, 1) * speed;
    }
    
    ypos += yspeed;
    
    tmppos = constrain(ypos, 0, canvasSize - (radius / 2));
    if(ypos != tmppos){
      ypos = tmppos;
      yspeed = random(-1, 1) * speed;
    }
  }
  
  //returns the current X Position of the ball
  float getXPos(){
    return xpos;
  }
  
  //returns the current Y Position of the ball
  float getYPos(){
    return ypos;
  }
}

