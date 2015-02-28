
void setup () {
  size (500, 500);
  background (0);
  smooth();
}

void draw () {
  strokeWeight (2);
  fill (50, 205, 50);
    ellipse (250, 250, 350, 350);
    ellipse (150, 100, 50, 50);
    ellipse (360, 100, 50, 50);
    arc (250, 340, 100, 130, PI, TWO_PI);
  fill (255);
    ellipse (250, 210, 90, 90);
  fill (0);
    ellipse (250, 210, 45, 45);

  if (mousePressed) {
    fill (50, 205, 50);
    strokeWeight (2);
    ellipse (250, 210, 90, 90);
  }
  else if (mouseX > 250 && mouseY < 210) {
    fill (255);
    ellipse (250, 210, 90, 90);
    fill (255, 0, 0);
    ellipse (250, 210, 45, 45);
    
  }
 

}


