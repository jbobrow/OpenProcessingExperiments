
void setup () {
  size(480,480);
  smooth();
}

void draw() {
  //background(255);
  if (mousePressed==true) { //change the color when i click the mouse
  line(mouseX,mouseY,pmouseX,pmouseY);
  
  }
}
 void mouseReleased(){
   stroke(random(0,255),random(0,255),random(0,255),120);
 }
