
void setup(){
  size(300,300);
  background(50,100,150);
}
void draw(){
  strokeWeight (3); 
  stroke (100,150,150,200);
  line (mouseX, mouseY,mouseX, mouseY);
  line (mouseY, mouseX,mouseY, mouseX);
}
