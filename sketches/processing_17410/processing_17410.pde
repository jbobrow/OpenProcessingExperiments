
Cell [][] grid;

int cols = 20;
int rows = 20;

void setup(){
  size(600,600);
  grid = new Cell[cols][rows];
  for(int i= 0; i < cols; i++){
    for(int j=0; j < rows; j++){
      grid[i][j] = new Cell(i*random(10,20), j*random(10,30), 90, 80, i+j);
    }
  }
}

void draw(){
  background(0);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }  
}

//A Cell object

class Cell {
  float x,y;
  float w,h;
  float angle;
  
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  }
  
  void oscillate(){
    angle += 0.05;
  }
  
  void display(){
   
    stroke(255,10);
    fill(80+127*cos(angle),10);
    rect(x,y,w*random(1,1),h);
  }
}
