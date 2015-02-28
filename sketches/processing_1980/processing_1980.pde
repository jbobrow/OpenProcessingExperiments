
boolean isDrawing = false;

void setup(){
  size(700,700);
  background(50);
  smooth();
  
};



void draw(){
  
  if (isDrawing){
    
    noStroke();
   
    
    fill (random (10, 100), random (100, 200), random (10, 100), 75);
    stroke (255, 250, 205, 50);
    ellipse(mouseX, mouseY, random (5,30), random (5,30));
    
    
  }
};

void mousePressed(){
  isDrawing = !isDrawing;
  
};

