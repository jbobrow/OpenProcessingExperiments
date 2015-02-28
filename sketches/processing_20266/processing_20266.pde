
void setup() {
  size(500, 500);
  background(20);
  smooth();
}

void draw() {
  PImage img = loadImage("bg5.jpg");  
  image(img, 0, 0);
  for (int d = 450; d > 0; d -= 15) {
    fill((d+d) * 0.1, 20, 60, 13);
    stroke(20, 200);
    ellipse(250, 250, d, d);
  }
  for (int d = 450; d > 0; d -= 15) {
    fill((d+d) * 0.1, 20, 60, 13);
    noStroke(); 
    rect(25, 25, d, d);
  }
} 


