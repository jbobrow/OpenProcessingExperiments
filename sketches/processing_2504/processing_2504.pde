
boolean isDrawing = false;





void setup(){
  
  size(500,500);
  background(255);
  smooth();
  
};

void draw(){
  
   if (isDrawing) {
    stroke(0,0,0);
    line(pmouseX, pmouseY, mouseX, mouseY);
    ellipse(mouseX,mouseY,5,5);
  
  }
  
};
  
  void mousePressed(){
    
    isDrawing=!isDrawing;
  
  
};

