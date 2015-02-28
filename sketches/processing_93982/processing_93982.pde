
import java.lang.Math;
import java.io.*;

class DateControl {
  /*==========FIELDS==========*/
  PFont font2 = createFont("Arial", 16, true);
  
  float x;
  float y;
  
  float offsetX;
  float offsetY;
  
  boolean dragging = false;
  
  /*==========CONSTRUCTORS==========*/
  DateControl(){
    drawMain(); 
    
    x = 100 + 800 / 121 * 16;
    y = 640;
    
    offsetX = 0;
    offsetY = 0;
  }
  
  /*==========METHODS==========*/
  void drawMain(){
    stroke(0);
    line(100, 650 , 900, 650);  
  }
  
  void draw(){
    rectMode(CORNER);
    stroke(255);
    fill(255);
    rect(0, 600, 1050, 150);
    
    drawMain();
    
    stroke(0);
    if(dragging){
      fill(255, 0, 10);
    }else{
      fill(255, 0, 0);
    }
    rect(x - 5, y, 10, 20); 
    
    fill(0);
    stroke(0);
    textFont(font2, 16);
    text(months[getMonth() - 1] + " " + years[getYear() - 1], 950, 650);
  }

  void clicked(int mx, int my){
    if(mx >= x && mx <= x + 10 && my >= y && my <= y + 20){
      dragging = true;
      offsetX = x - mx;
      offsetY = y - my;
    }
  }
  
  void drag(int mx, int my){
    if(dragging){
      x = constrain(mx + offsetY, 107, 900);
    }  
  }
  
  void stopDrag(){
    dragging = false;  
  }
  
  float getX(){
    return (x - 100) * ((float)121 / 800);
  }  
  
  int getYear(){
    return (int)((getX() - 1) / 12) + 1;  
  }
  
  int getMonth(){
    return ((int)getX() % 12 == 0 ? 12 : (int)getX() % 12);  
  }
}


