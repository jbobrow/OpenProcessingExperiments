
class Boundary{
  
  int width, height, xpos, ypos;
  int centerx, centery;
  
  Boundary(int x, int y){
    width = x;
    height = y; 
    centerx = width/2;
    centery = height/2;
    xpos = 0;
    ypos = 200;
    
  }
  
  void drawBoundary(){
    noStroke();
    fill(color(175,225,255)); 
    rect(xpos, ypos, width, height);
    
  }
  
  int getxpos(){
    return xpos;
  } // end getXPos();

  int getypos(){
    return ypos;
  } // end getYPos();

  int getWidth(){
    return width;
  } 
  
  int getHeight(){
    return height;
  }

  void setXPos(int ixpos){
    xpos = ixpos;
  } // end setXPos

    void setYPos(int iypos){
    ypos = iypos;
  } // end setYPos
  
  
}

