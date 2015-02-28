
int rectSize;
int numOfRects;
int canvasSize;
Ball b;
ArrayList visibleCells;
float cellTime;
int backgroundPulseTime1;
int backgroundPulseTime2;
color backgroundcolour;

//Setup the Scene
void setup(){
  canvasSize = 800;
  frameRate(30);
  smooth();
  
  size(canvasSize, canvasSize);
  
  rectSize = 25;
  numOfRects = canvasSize / rectSize;
  
  //create a new ball(at the mouse position) to be displayed onscreen
  b = new Ball(canvasSize);
  
  visibleCells = new ArrayList();
  
  //set the cell life time.
  cellTime = 18000;
}

//Draws all the onscreen elements at each refresh.
void draw(){
  
  //Colours the background. Performs the "heartbeat".
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
  
  //Checks the new position of the ball (mouse) and adds the cells which are brought to life.
  b.move(constrain(mouseX, 0, canvasSize), constrain(mouseY, 0, canvasSize));
  checkBallPos();
  drawCells();
  b.display();
}

//Checks the position of the mouse and adds any cells under the mouse to the Cell Array
void checkBallPos(){
  int xloc;
  int yloc;
  boolean cellExists;
  Cell c;
  
  cellExists = false;
  xloc = int(b.getXPos() / rectSize) * rectSize;
  yloc = int(b.getYPos() / rectSize) * rectSize;
  
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

//Draw each of the cells in the Cell Arrray.
void drawCells(){
  Cell c;
  float currTime = millis();
  
  for(int i = visibleCells.size() - 1; i >= 0; i--){
    c = (Cell) visibleCells.get(i);
    
    if(c.finished(currTime)){
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
    col = colours[currColorLoc];//color(255, 255, 255);
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

//The class which holds all the information and drawing properties of the ball (mouse).
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
    
    xpos = constrain(mouseX, 0, canvasSize);
    ypos = constrain(mouseY, 0, canvasSize);//random(canvasSize);
  }
  
  //Draws the ball to the new mouse position
  void display(){
    ellipseMode(CENTER);
    stroke(c);
    fill(c);
    ellipse(xpos, ypos, radius, radius);
  }
  
  //sets the new position of the mouse
  void move(float x, float y){
    xpos = x;
    ypos = y;
  }
  
  //returns the current x Position of the ball (mouse)
  float getXPos(){
    return xpos;
  }
  
  //returns the current y Position of the ball (mouse)
  float getYPos(){
    return ypos;
  }
}

