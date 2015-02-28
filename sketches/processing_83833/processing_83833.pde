
//Credit to the learning processing book for helping with the button class

class Button  {    
  
  float x;   
  float y;   
  float w;   
  float h;
  boolean on;    

  Button(float nX, float nY){    
    x  = nX;   
    y  = nY;
    w = 100;
    h = 25;  
    on = false;
  }    

//test for button press
  void pressed(int mX, int mY){
    if (mX > x && mX < x + w && mY > y && mY < y + h){
      if (on == false){
        on = true;
      } else {
        on = false;
      }
    }
  }

//draws button 
  void display(){
    rectMode(CORNER);
    noStroke();
    if (on == true) {
      fill(255, 0, 0);
    } else {
      fill(0);
    }
    rect(x, y, w, h);
  }
} 

