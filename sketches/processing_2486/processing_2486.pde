
/* 
 
Cindy Ng 
June 14,2009 
cindy.ng@cindysng.com
rainbow
 
*/ 

boolean isDrawing = false; 
void setup() { 
   
  size(400,400); 
  background(255); 
  smooth(); 
   
}; 
 
void draw(){ 
   
  if (isDrawing){ 
     
  noStroke();
  fill(random (50,350), random (50,350),random(50,230) ); 
  rect(mouseX,mouseY,10,50); 
  
 
  } 
}; 
 
void mousePressed(){ 
  isDrawing = !isDrawing; 
}; 

void keyPressed() {  
  background(random(150,255));  
 
}; 


