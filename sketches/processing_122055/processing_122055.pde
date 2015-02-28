
PImage img1;
PImage img2;

void setup() {
  size (1000, 1000) ;
  img1 = loadImage("Tansey1.jpg"); /// loads a tansey image
  img2 = loadImage("Tansey2.jpg"); /// loads 2nd tansey image
}

void draw() {
  if (mousePressed){  ///// Adds an extra factor of dimensionality
    tint (mouseY, mouseX, 150, 150);
    image (img1, pmouseX, pmouseY, mouseX * 2, mouseY *2);
    tint (mouseY, mouseX, 150, 150);
    image (img2, pmouseY, pmouseX, mouseY *2, mouseX *2);
  }
    
  tint (mouseY, mouseX, 150, 150); /// otherwise the two works mirror each other..
  image (img1, mouseX, mouseY, mouseY, mouseX);
  tint (mouseY, mouseX, 150, 150);
  image (img2, mouseY, mouseX, mouseX, mouseY);
}

// Yay.


