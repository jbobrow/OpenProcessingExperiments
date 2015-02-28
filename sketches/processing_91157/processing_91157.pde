
void setup(){
  size(480, 240);
  smooth();
}
 
void draw() {
  //draw a line with my mouse while I have button pressed
  if (mousePressed == true){
    line(mouseX,mouseY, pmouseX, pmouseY);
  }
}
  void mouseReleased(){ //change line color
   stroke(random(0,255),random(0,255),random(0,255),120);
  }
