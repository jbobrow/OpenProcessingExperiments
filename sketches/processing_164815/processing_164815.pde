
void setup () {
  size (300, 300);
  noStroke ();
  background (219, 245, 195, 10);
  
}

void draw () {

  background (219, 245, 195);
  if (mouseX < width/2) {
  fill (219, 260, 195, 255);
  
ellipse (random (150, 250), random (150, 250), 150, 150);

  }else if (mousePressed == true) {
   fill (200, 300, 195, 255);
    ellipse (150, 150, random (150, 250), random (150, 250));
  
  }else {
    
    fill (150, 150, 10, 255);
    ellipse (random (300), random (150), random (150), random (300));
 
  }
  
}



