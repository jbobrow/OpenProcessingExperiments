

void setup(){
  size (500,500);
  background (255);
}
void draw() {
  background(255);
  if (mousePressed == true) {
    ellipse (mouseX,mouseY,pmouseX,pmouseY);
  } 
  fill (245,20,20);
}


