
void setup() {
  size (400, 400);
  background (#CEFFF8);
  smooth();
}

void draw () {
  if (mousePressed==true){
      
  strokeWeight(map(pmouseX,0,400,1,16 ));
  stroke(map(mouseY,0,400,0,220) );
  line (pmouseX, pmouseY, mouseX, mouseY );
  }
  
  
}
//do this when the mouse is pressed
void mousePressed (){
 strokeWeight(6);
 fill(#A2FFBC);
 ellipse(mouseX, mouseY, 50, 50);
 
  }
//do this when the key is pressed
void mouseReleased () {
    mousePressed = false;

  
}
