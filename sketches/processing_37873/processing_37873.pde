
// Draw circles at points along the curve y = x^4
void setup() {
  noFill();
  smooth();
  size(400, 400);
}

void draw() {
  background(255);
  for (int x = -width/2; x <= width/2; x += 5) {
    float n = norm(x, 0.0, 100.0); // Range 0.0 to 1.0
    float y = pow(n, mouseX/40.0); // Calculate curve
    
    y *= 100; // Scale y to range 0.0 to 100.0
    strokeWeight(abs(n * 5)); // Increase thickness
    ellipse(x + width/2, y + height/2, abs(n * 100), abs(n * 100));
  }
  println(mouseX/40.0);
}
                
