
void setup(){
  size (250,250);
  strokeWeight (.5);
  smooth ();
  background(#8b7f77);
   
}
void draw (){
  stroke (15, 3, 32, 16);
  line (mouseX, mouseY, 50, 50);
  line (mouseY, mouseX, 100, 100);
}
 
void mousePressed(){
  saveFrame();
}
  void keyPressed() {
  background(#f8e186);
}


