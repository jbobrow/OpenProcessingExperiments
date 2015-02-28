
void setup(){
  size(500,500);  
}
 
void draw() {

  noFill();
  stroke(0,0,0, 30);
}
 void mouseDragged() {
  int x = random(20,200);
  int y = random(20,200);
  ellipse(mouseX, mouseY, x, 150);
}





