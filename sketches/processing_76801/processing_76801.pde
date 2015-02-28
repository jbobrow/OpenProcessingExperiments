
class Puzzle{
  
  int value, xpos, ypos, w, h;
  color col;
 
 Puzzle(int val, int xval, int yval, int wide, int high, color c){
  value = val;
  xpos = xval;
  ypos = yval;
  col = c;
  w = wide;
  h = high;
 }

  void storePos(int xval, int yval){
    xpos = xval;
    ypos = yval;
  }
  
  int sendValue(){
    return value;
  }
  
  int sendX(){
    return xpos;
  }
  
  int sendY(){
    return ypos;
  }
  
  void create(){
    noStroke();
    fill(col);
    rect(xpos,ypos,w,h);
    fill(255);
    text(value+1, xpos, ypos);
  }
  
}

