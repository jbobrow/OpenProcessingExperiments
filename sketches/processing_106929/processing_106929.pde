
void setup() {  //setup function called initially, only once
  size(350,250);
  }
 
void draw() { 
   line(20+mouseX,20+mouseY,100,100);
ellipse( 20+mouseX,20+mouseY,20,20);
  if (mousePressed) {
      fill(34,123,11);
}
      else {
      fill(13,34,13);
}
      }
