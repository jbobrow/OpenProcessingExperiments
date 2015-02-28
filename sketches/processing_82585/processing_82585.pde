
void setup() { 
  size(800,600);   
  
}

void draw() {
 
 background(0); 
  
 drawEyes(); 
  
}

void drawEyes() { 

  fill(255); 
  
  drawEye(200,400); 
  drawEye(400,600); 
  drawEye(600,800); 
  drawEye(0,100); 
  
 }

void drawEye(float minX, float maxX) { 
  
   ellipse(map(mouseX,0,800,minX,maxX), map(mouseY,0,600,250,350), 50, 50); 
 
  
}
