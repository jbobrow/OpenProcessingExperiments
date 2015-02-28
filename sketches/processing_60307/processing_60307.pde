
class Ship
  {
    int xLoc;
    int yLoc;
    
    Ship(int x, int y)
      {
        xLoc = x;
        yLoc = y;
      }
      
    void drawShip()
      {
        stroke(255);
        fill(120);
        rect(xLoc+5,yLoc-5,10,5);
        rect(xLoc,yLoc,20,10);
      }
  }

