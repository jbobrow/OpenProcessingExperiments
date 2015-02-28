
void setup(){
  size (250,250);
  smooth ();
  background(255);
   
}
void draw (){
 fill(155, 29, 58, 10);
  smooth();
  noStroke();
  ellipse (mouseX, mouseY, 50, 50);
  ellipse (mouseY, mouseX, 50, 50);

}
  void keyPressed() {
  background(#F76BAD);
}

void mouseReleased(){
  background(255);
}



