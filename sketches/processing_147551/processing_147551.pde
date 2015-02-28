
PFont fontVector, fontBitmap;
float d_max, d;
String greet = "Hello World!";

void setup() {
  size(600, 600);
  smooth();
  // Uso font vettoriale
  fontVector = createFont("Didot", 32);
  // Uso font bitmap 
  fontBitmap = loadFont("Didot-32.vlw");
  d_max = sqrt(sq(width/2) + sq(height/2));
}

void draw() {
  background(102);
  d = dist(mouseX, mouseY, width/2, height/2);
  if (mouseY < height/2) textFont(fontVector); else textFont(fontBitmap);
  textSize(map(d, 0, d_max, 0, 100));
  text(greet, mouseX, mouseY);
}



