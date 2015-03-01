
void setup () {
  size (300, 300);
background (0);
noStroke ();
colorMode (RGB);
}

void draw () {
  if (mousePressed == true) {
    fill (random (255), random (255), random (255), random (255));
  }else {
    fill (random (255), random (255), random (255), 10);
  }
  for (int i = 0; i <6; i++) {
    ellipse (mouseX +i*i, mouseY, 50, 50);
  }
}

 



