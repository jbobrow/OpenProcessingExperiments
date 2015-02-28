
float[] x = new float[300];
float[] y = new float[300];
 
void setup() {
  size(250, 250); 
  smooth();
  rectMode(CENTER);
   
  for (int i=0; i < x.length; i++) {
    x[i] = random(width);
    y[i] = random(height);
  } 
}
 
void draw() {
  background(255);
  
fill(mouseX, mouseY, 255, 80);
   
  int numRect = int(map(mouseY, 0, height, 1, x.length));
   
  for (int i=0; i < numRect; i++) {
    pushMatrix();
      translate(x[i], y[i]);
      ellipse(0, 0, 100, 100);
    popMatrix();
  }
}
void keyPressed() {
  saveFrame("PS3_05image.jpeg");
}

