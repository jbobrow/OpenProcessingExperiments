
void setup() {
  size(400, 400);
}

void draw() {
  background(int(random(1,30)),int(random(1,30)),int(random(1,30)));
  
  for (int p = 0; p<height; p = p+ int(random(12,15))) {
    for (int n = 0; n<height; n = n+ int(random(12,15))) {
      int q = int(random(7));
      strokeWeight(int(random(1,3)));
      stroke(int(random(1,254)),int(random(1,254)),int(random(1,254)),int(random(1,254)));
      fill(int(random(1,254)),int(random(1,254)),int(random(1,254)),int(random(1,254)));
      ellipse(n, p, q+.035*mouseX, q+.035*mouseY);
      
    }
  }
 }

