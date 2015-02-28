
/*
squares & Lines of sun
Magali Jaume
June,2009
magali@magalijaume.com

*/


boolean isDrawing=false;

void setup(){
  
  size(900,600);
  background(255);
  smooth();
};

void draw() {
  if (isDrawing){
    variableRect (mouseX, mouseY,pmouseX,pmouseY);{
  
    
    variableLine (mouseX, mouseY,pmouseX,pmouseY);
   
  }
  }
};

void variableRect( int x, int y, int px, int py) { 
  float speed=abs(x-px) + abs(y-py);
    noStroke();
    rect(x,y,speed,speed);
    fill(random(255),random(255),random(255),50);
};

void variableLine( int x, int y, int px, int py) { 
  float speed=abs(y-px) + abs(x-py);
    stroke(249,242,175);
    line(pmouseX,pmouseY, speed,speed);
  
};

void mousePressed(){
  isDrawing = !isDrawing;
};

