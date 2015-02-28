
class Slider{
  float x, y;
  float minX, maxX;
  float drawSize=10;  //size fo the diamond
  String type;
  boolean dragging;  //is it currently being dragged
  
  //simple functions
  float getVal(){  return(map(x,minX,maxX,0,100));  }
  boolean getDrag(){ return dragging; }
  void startDrag(){ dragging=true;  }
  void endDrag(){ dragging=false;  }
  
  Slider(float _y, float startX, String t){
    minX=50;
    maxX=width-50;
    
    y=_y;
    x=startX+minX;
    type=t;
  }
  
  void update(){
   //if the slider is being dragged, move it with the mouse, but don't klet it go out of range
   if (dragging){
     x=constrain(mouseX,minX,maxX);
   }
    
    display();
  }
  
  void display(){
   stroke(255);
   fill(0);
   
   //line going across, leaving space for the diamond
   if(x>minX+drawSize)  line(minX,y,x-drawSize,y); 
   if(x<maxX-drawSize)  line(x+drawSize,y,maxX,y); 
   
   //diamond for the slider
   noFill();
   beginShape();
   vertex(x-drawSize,y);
   vertex(x,y-drawSize);
   vertex(x+drawSize,y);
   vertex(x,y+drawSize);
   endShape(CLOSE);
   
   //show the current val
   fill(255);
   textSize(10);
   text(int(getVal()),maxX-10,y-3);
   text(type,minX,y-3);
   
    
  }
  

  
  
  
  
}

