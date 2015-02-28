
void setup () {
  size (500, 500);
  smooth ();
  frameRate (10);
}

void draw () {
  background (255);
  noStroke ();
  float circleWidth = map (mouseX, 0, width, 10, random (100));
  float circleHeight = map (mouseY, 0, height, 10, random (100));
  float colY = map (mouseY, 0,height, 0,255);
  if (mouseX<250) {
    for (int x=1; x<25; x++) {
      for (int y=1; y<25; y++) {
        fill (mouseX, (mouseX*colY)/2, colY);
        ellipse (x*20, y*20, 10, 10);
      }
    }
  } 
  else {
    for (int i=1; i<25; i++) {
      for (int j=1; j<25; j++) {
        fill (random (255), random (255), random (255), random (255));
        ellipse (i*20, j*20, circleWidth, circleHeight);
      }
    }
  }
}
         
