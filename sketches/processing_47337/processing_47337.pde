
void setup () {
  size (300, 300);
  smooth (); 
  background (0);
  
  

}

void draw () {
    fill (255);
  strokeWeight (8);
  
  ellipse (150, 120, 100, 100);
  point (130, 110);
  point (180, 110);
  
  line (150, 140, 170, 140);
  
  line (mouseX, mouseY, 150, 140);
 
}


