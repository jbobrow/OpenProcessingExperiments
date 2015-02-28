
import java.lang.Math;
import java.io.*;

class AlphaControl {
  /*==========FIELDS==========*/
  PFont font = createFont("Arial", 16, true);
  
  float x;
  float y;
  
  float offsetX;
  float offsetY;
  
  boolean dragging = false;
  
  /*==========CONSTRUCTORS==========*/
  AlphaControl(){
    drawMain(); 
    
    x = 1030;
    y = 500 - 400 / 45 * 12;
    
    offsetX = 0;
    offsetY = 0;
  }
  
  /*==========METHODS==========*/
  void drawMain(){
    stroke(0);
    line(1040,100,1040,500);  
  }
  
  void draw(){
    stroke(255);
    fill(255);
    rect(1010, 0, 55, 700);
    
    drawMain();
    
    stroke(0);
    if(dragging){
      fill(255, 0, 10);
    }else{
      fill(255, 0, 0);
    }
    rect(x, y - 5, 20, 10); 
    
    fill(0);
    textFont(font, 16);
    text("" + String.format("%.1f", ((4500 - 9 * y) / 80)), 1025, 520);
    text("Alpha", 1030, 70);
  }

  void clicked(int mx, int my){
    if(mx >= x && mx <= x + 20 && my >= y && my <= y + 10){
      dragging = true;
      offsetX = x - mx;
      offsetY = y - my;
    }
  }
  
  void drag(int mx, int my){
    if(dragging){
      y = constrain(my + offsetY, 100, 499);
    }  
  }
  
  void stopDrag(){
    dragging = false;  
  }
  
  float getY(){
    return ((4500 - 9 * y) / 80); 
  }  
}


