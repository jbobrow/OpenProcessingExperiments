
/*
 Andor Salga
*/
 
void setup() {
  for (int i= 500; i>0; i=i-2) {
 
  ellipse(300, 300, i, i);
  stroke((1/2)+(mouseX/3),255,255);

}


  size(1000, 1000);
  noSmooth();
  strokeWeight(4);
  noFill();
  rectMode(CENTER);
  colorMode(HSB);
}
 
void draw() {
  background(255);

  for (int x = -100; x < width; x += 98  ) {
    for (int y = 0; y < height; y += 98) {
      pushMatrix();
      translate(x + frameCount % 98, y);
 
      for (int i = 10; i < 100; i += 16) {
        rect(0, 0, i, i);
      }
 
      popMatrix();
    }
  }
}







