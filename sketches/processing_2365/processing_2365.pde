
/*

Magali Jaume
June,2009
magali@magalijaume.com
confetti pencil

*/

boolean isDrawing = false;
void setup(){
  
  size(500,500);
  background(255);
  smooth();
  
};

void draw(){
  
  if (isDrawing){
    
  noStroke();
  fill(random (0,255), random (0,255),random(0,255) );
  ellipse(mouseX,mouseY,20,20);


  }
};

void mousePressed(){
  isDrawing = !isDrawing;
};

