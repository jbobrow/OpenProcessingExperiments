
void setup () {
  size (800, 600); // window
  background (247, 230, 30); // background yellow
  leaf (0, 0);
  leaf (100, 0);
  leaf (200, 0);
  leaf (300, 0);
  leaf (400, 0);
  leaf (500, 0);
  leaf (600, 0);
  leaf (700, 0);
  leaf (800, 0);
  leaf (0, 200);
  leaf (100, 200);
  leaf (200, 200);
  leaf (300, 200);
  leaf (400, 200);
  leaf (500, 200);
  leaf (600, 200);
  leaf (700, 200);
  leaf (800, 200);
  leaf (0, 400);
  leaf (100, 400);
  leaf (200, 400);
  leaf (300, 400);
  leaf (400, 400);
  leaf (500, 400);
  leaf (600, 400);
  leaf (700, 400);
  leaf (800, 400); // leaves texture 
}
  
 
void draw () {
  if (mousePressed) {
    if (mouseButton == LEFT) {
      orangeflower (mouseX, mouseY);
    } else {
      violetflower (mouseX, mouseY);
    }
  }
} // response to mouse buttons
void orangeflower (int x, int y) {
  pushMatrix ();
  translate (x, y);
  strokeWeight (0);
  // first flower, orange part
  fill (255, 102, 0);
  beginShape();
  vertex (-48, -16);
  vertex (-16, -16);
  vertex (-16, -32);
  vertex (0, -16);
  vertex (16, -48);
  vertex (16, 16);
  vertex (-16, -16);
  vertex (0, 8);
  vertex (-48, -16);
  endShape ();

  // first flower, bottle green part
  fill (40, 160, 63);
  beginShape ();
  vertex (-16, -16);
  vertex (16, 16);
  vertex (16, -8);
  vertex (24, 0);
  vertex (48, -16);
  vertex (32, 8);
  vertex (48, 16);
  vertex (32, 24);
  vertex (48, 48);
  vertex (24, 32);
  vertex (16, 48);
  vertex (8, 32);
  vertex (-16, 48);
  vertex (0, 24);
  vertex (-16, 16);
  vertex (0, 8);
  vertex (-16, -16);
  endShape ();
  popMatrix ();
} // orange flower function
void violetflower (int x, int y) {
  pushMatrix ();
  translate (x, y);
  strokeWeight (0);
  // second flower, dark violet part
  fill (79, 7, 129);
  //fill (118, 56, 185);
  arc (-16, -16, 64, 32, radians (180), radians (270));
  arc (-16, -16, 32, 32, radians (270), radians (360));
  arc (16, -16, 32, 32, radians (180), radians (270));
  triangle (-48, -16, 16, -16, 16, 16);

  // second flower, aqua blue part
  fill (103, 227, 203);
  beginShape();
  vertex (-16, -16);
  vertex (16, 16);
  vertex (16, -8);
  vertex (32, 0);
  vertex (32, -16);
  vertex (48, 16);
  vertex (40, 32);
  vertex (48, 32);
  vertex (48, 48);
  vertex (32, 48);
  vertex (32, 40);
  vertex (16, 48);
  vertex (-16, 32);
  vertex (0, 32);
  vertex (-16, -16);
  endShape();
  popMatrix ();
} // violet flower function
void leaf (int x, int y) {
  // leaf
  pushMatrix ();
  translate (x, y);
  fill (250, 237, 96, 128);
  noStroke ();
  beginShape ();
  vertex (0, 50);
  vertex (100, 0);
  vertex (50, 50);
  vertex (150, 0);
  vertex (50, 100);
  vertex (200, 0);
  vertex (100, 150);
  vertex (200, 50);
  vertex (150, 150);
  vertex (200, 100);
  vertex (150, 200);
  vertex (25, 175);
  vertex (25, 200);
  vertex (0, 200);
  vertex (0, 175);
  vertex (25, 175);
  vertex (0, 50);
  endShape (); 
  popMatrix ();
} // leaf function


