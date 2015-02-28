


void setup(){
  
  size( 640,480);
 
  smooth();
  
}


void draw(){
  
   background(0);
  
  if  (mousePressed ==true) {
    fill(90,226,229);
  } 
 
  if (mousePressed == false) {
    
    noFill();
  }
  
  
 stroke(255,0,0);
 
 
  
  ellipse(mouseX,mouseY, 75,75);
  
  ellipse(mouseY,mouseX, 75,75);
  
  ellipse(mouseY/4, mouseX/4, 75,75);
 
 ellipse (mouseX/4, mouseY/4, 75,75);
 


} 
  
 


