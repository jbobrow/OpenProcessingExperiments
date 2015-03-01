
boolean keyz[] = new boolean [4];
 
void setup() {
  size(400, 400);
  noStroke();
  smooth();
}
 
void draw() {
  background(80);
  for (int i = 0; i < keyz.length; i++) {
    if (keyz[i]) {
      rect(i*100, width/2, 100, 50);
    }
  }
}
 
void keyPressed() {
  if (key == 'a')  keyz[0] = true;
  if (key == 's')  keyz[1] = true;
  if (key == 'd')  keyz[2] = true;
  if (key == 'f')  keyz[3] = true;
}
 
void keyReleased() {
  if (key == 'a')  keyz[0] = false;
  if (key == 's')  keyz[1] = false;
  if (key == 'd')  keyz[2] = false;
  if (key == 'f')  keyz[3] = false;
}



