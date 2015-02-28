
void setup() {
  size(480,300);
  smooth();
}


void draw() {
//draw a line with my mouse while while i have the button pressed.
  if(mousePressed == true){
    line(mouseX,mouseY,pmouseX,pmouseY);
    
    }
}
//When the button is released the color is changed
void mouseReleased(){
  stroke(random(0,255),random(0,255),random(0,255),random(0,255),120);
}
