
void setup() {
  size(500,500);
  background(0);
  smooth();
}
 
void draw(){
    noStroke();
    fill(mouseX,mouseY,mouseY,mouseY);
    rect(mouseX,mouseY,mouseX,mouseY);
}
 
void mousePressed(){
  saveFrame("Farbecken.png");
}
 
void keyPressed(){
  background(255);
}


