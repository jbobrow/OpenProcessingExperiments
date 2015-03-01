

int i = 0;
void setup () {
  size (300, 300);
noStroke ();
colorMode (RGB);
}

void draw () {
   for (int i = 0; i <6; i++) {
   }
    if (mousePressed == true) {
    fill (random (255), random (255), random (255), random (255));
    ellipse (mouseX + i, mouseY, 10, 10);
  }else {
    fill (random (255), random (255), random (255), 10);
    rect (mouseX, mouseY, 100, 100);
  }
 
  }


 


