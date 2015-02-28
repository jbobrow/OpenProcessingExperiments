
boolean isDrawing = false;

void setup(){
  
  size(800,500);
  background(255,255,0,10);
  smooth();
  
};

void draw(){
  
  if (isDrawing){
  
  noStroke();
  
  fill (0,200,100);
  ellipse (mouseX, mouseY,10,10);
  }
  
};

void mousePressed(){
  isDrawing = !isDrawing;
};
  

void mouseDragged() {
    isDrawing =!isDrawing; 
  };


void mouseReleased() {
  isDrawing = false;
  
};


