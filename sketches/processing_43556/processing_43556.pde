
void setup () {
  
  size (400, 400);
  smooth();
  frameRate (50);
  
}

  void draw (){
   
   background (0, 0, 0);
   
    
  if(mousePressed) {
         
      fill (250);
      ellipse  (pmouseX, pmouseY, 50, 50);
      ellipseMode (CENTER);
  }
  else { 
 rectMode (CENTER);

 fill (255);
rect  (mouseX, mouseY, 50, 50);
  }


} 
                
