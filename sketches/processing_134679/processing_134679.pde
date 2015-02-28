
void setup() { 
  size(500, 500);
 
} 
void draw() { 

  rect(mouseX, mouseY, pmouseX-mouseY,mouseY-mouseX ); 
  fill( random(0, 255), random(0, 255), random(0, 255), random(0, 255) );


  frameRate(15);
} 



