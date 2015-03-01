
void setup() {
  size (400, 400);
  background (#7D09AF);
  smooth();
}

void draw () {
  if (mousePressed==true){
      
  strokeWeight(map(pmouseX,0,400,1,16 ));
  //colour(R,G,B. Alpha)
  stroke(map(mouseY,0,400,0,220),map(mouseX,0,400,0,256), 256,127);
  line (pmouseX, pmouseY, mouseX, mouseY );
  }
  
  
}
//do this when the mouse is pressed
void mousePressed (){
 strokeWeight(6);
 stroke(#00C5FF);
 ellipse(mouseX, mouseY, 50, 50);
 
  }
//do this when the key is pressed
void mouseReleased () {
   strokeWeight(6);
 stroke(#0E5B71);
 ellipse(mouseX, mouseY, 50, 50);

  
}
