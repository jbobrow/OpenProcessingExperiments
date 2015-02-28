
//pattern : ellipse01

void setup () {
  size (500, 500);
  smooth ();
  stroke (255);
  noFill ();
}
void draw () {
  background (220, 230, 20);

  /* float bg_renewal= map (mouseX, 0, wijth, 0, 255);
   background (bg_renewal, 50);
   */
  float z=100;


  for (float i= 0 ; i<=width; i+=z) {
    for (float j= 0; j<=height; j+=z) {
      strokeWeight (2);
      ellipse (i, j, z, z);
    }
  }

  for (float i= (z/2) ; i<=width; i+=z) {
    for (float j= (z/2); j<=height; j+=z) {
      strokeWeight (2);
      ellipse (i, j, z, z);
    }
  }

  for (float i=z/2 ; i<=width; i+=z) {
    for (float j= 0; j<=height; j+=z) {
      strokeWeight (1);
      fill (255, 40);
      ellipse (i, j, z, z);
    }
  }
  
  for (float i=0 ; i<=width; i+=z) {
    for (float j= z/2; j<=height; j+=z) {
      strokeWeight (1);
      fill (255, 40);
      ellipse (i, j, z, z);
    }
  }
}



