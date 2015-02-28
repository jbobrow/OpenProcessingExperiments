
void setup(){
 size(500,450); 
  smooth();
  strokeWeight(6); //llne thickness
}

void draw(){
  if (mousePressed) {
   line(mouseX,mouseY,pmouseX,pmouseY); 
  }
}       
                
