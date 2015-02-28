
// click to activate
// changes growsquare's color
// saves square's current dim
// shrinks square, instead of grow from 0

class Button {
  
  int xPos, yPos;
  int butDim;
  
  // constructor
  // takes x and y positions as input
  public Button(int x, int y){
    xPos = x;
    yPos = y;
    butDim = 20;
  }
  
  // update
  public void update(){
    
  }
  
  // display
  public void display(){
    rectMode(CENTER);
    rect(xPos, yPos, butDim, butDim);
  }
  
  
}

