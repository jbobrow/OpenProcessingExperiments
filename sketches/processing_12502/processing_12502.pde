
int rectSize;
int numOfRects;
int canvasSize;
Ball b;
ArrayList visibleCells;
float cellTime;

void setup(){
  canvasSize = 800;
  frameRate(30);
  smooth();
  
  size(canvasSize, canvasSize);
  
  rectSize = 25;
  numOfRects = canvasSize / rectSize;
  
  b = new Ball(canvasSize);
  
  visibleCells = new ArrayList();
  cellTime = 10000;
}

void draw(){
  background(0);
  b.move(constrain(mouseX, 0, canvasSize), constrain(mouseY, 0, canvasSize));
  checkBallPos();
  drawCells();
  b.display();
}


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
       cellExists = true;
       break;
     }
  }
  
  if (!cellExists){
    visibleCells.add(new Cell(xloc, yloc, rectSize, cellTime));
  }
}

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

class Cell{
  int xpos;
  int ypos;
  int cellSize;
  int currColorLoc;
  color[] colours = {color(0, 0, 0), color(111, 1, 124), color(38, 36, 255), color(51, 152, 2), color(254, 255, 54), color(234, 133, 24), color(234, 52, 25), color(255, 255, 255)};
  color col;
  float time;
  float startTime;
  float existTime;

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
  
  void drawCell(float millsec){
    rectMode(CORNER);
    col = getColor(millsec);
    stroke(col);
    fill(col);
    rect(xpos, ypos, cellSize, cellSize);
  }
  
  private color getColor(float diffTime){
    float colTime = (existTime / colours.length) * (currColorLoc + 1);
    
    if (diffTime > (startTime + colTime)){
      currColorLoc++;
    }
    //println(diffTime / colTime);
    return blendColor(colours[min(currColorLoc, 7)], colours[min(currColorLoc + 1, 7)], BLEND);//colours[];
  }
  
  boolean finished(float millsec){
    if (millsec >= time){
      return true;
    }
    else{
      return false;
    }
  }
  
  int getXpos(){
    return xpos;
  }
  
  int getYpos(){
    return ypos;
  }
}

class Ball{
  private float xpos;
  private float ypos;
  private float xspeed;
  private float yspeed;
  private float speed;
  private float radius;
  private int canvasSize;
  private color c;
  
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
  
  void display(){
    ellipseMode(CENTER);
    stroke(c);
    fill(c);
    ellipse(xpos, ypos, radius, radius);
  }
  
  /*void move(){
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
  }*/
  
  void move(float x, float y){
    xpos = x;
    ypos = y;
  }
  
  float getXPos(){
    return xpos;
  }
  
  float getYPos(){
    return ypos;
  }
}

