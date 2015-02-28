
// *** Physical Map Generator (phmg_a2x1) by Atoro 
// *** Maps should look realistic with distinguishable geographic features, 
// *** such as mountains, valleys, lakes, seas, bays, peninsulas, etc.
// *** Whenever the keyboard button is pressed, the new map is generating.
color[] cp = {
  color(0, 126, 192), 
  color(24, 154, 208), 
  color(58, 168, 214), 
  color(94, 186, 220), 
  color(128, 199, 228), 
  color(163, 216, 235), 
  color(197, 229, 243), 
  color(232, 244, 250), 
  color(135, 209, 63), 
  color(203, 227, 107), 
  color(255, 227, 153), 
  color(255, 205, 127), 
  color(234, 136, 70), 
  color(209, 104, 47), 
  color(187, 76, 15), 
  color(148, 56, 0)
}; 
void setup() {
  size(800, 600);
}
void draw() {
  noiseSeed(int(random(10000000))); 
  loadPixels(); 
  float d0 = random(100, 200);   
  float d1 = random(25, 75); 
  for (int j = 0; j < height; j++) {
    for (int i = 0; i < width; i++) {
      float n0 = noise(i/d0, j/d0, 0); 
      float n1 = noise(i/d1, j/d1, 10); 
      float n = 1 - (n0*0.75 + n1*0.25); 
      int k = int(n*cp.length); 
      pixels[j*width + i] = cp[k];
    }
  } 
  updatePixels();
  noLoop();
  // save("maps/Map_a2x1_ID" + int(random(10000000)) + ".png");
}
void keyPressed() {
  loop();
}
