
// Sierpinski triangle
// Click and drag to zoom in/out

PVector corners[];
PVector p;

float scale = 1.0;  
float scaleSpeed = 0.0;

final int circleCount = 200;
final float colorSaturation = 0.5;

float mouseYPrev;
boolean dragging = false;

void setup() {
  float w = 600;
  float h = sqrt(3.0 * pow(w, 2) / 4.0);
  size(600, int(h));
  // Create three corners of a triangle
  corners = new PVector[3];
  corners[0] = new PVector(width / 2.0, 0);
  corners[1] = new PVector(0, height);
  corners[2] = new PVector(width, height);
  // And one random point
  p = new PVector(random(width), random(height));
  background(0);
}

color getColor(PVector p) {
  float intensity = noise(p.x * 0.01, p.y * 0.01, millis() * 0.005);
  int temp = int(256 * intensity);
  int r = 255;
  int g = 0;
  while (temp > 0 && g < 255) {
    g++;
    temp--;
  }
  return color(colorSaturation * r + (1.0 - colorSaturation) * 128, 
               colorSaturation * g + (1.0 - colorSaturation) * 128, 
               (1.0 - colorSaturation) * 128);
}

void zoom(boolean decelerate) {
  // Zoom in/out
  scale = (scale + 1.0 + scaleSpeed) % 1.0 + 1.0;  
  if (decelerate) {
    // Decelerate
    scaleSpeed *= 0.99;
  }
}

void zoom() {
  zoom(true);
}

void draw() {  
  // Fade out old image
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  // Scale the triangle
  float w = scale * width;
  float h = scale * height;
  corners[1].x = width / 2.0 - w / 2.0;
  corners[1].y = h;  
  corners[2].x = width / 2.0 + w / 2.0;
  corners[2].y = h;
  // Draw circles
  for (int i = 0; i < int(scale * circleCount); i++) {
    PVector corner = corners[int(random(3))];
    p.x = (p.x + corner.x) / 2.0;
    p.y = (p.y + corner.y) / 2.0; 
    stroke(getColor(p));
    float r = random(1, 10);
    ellipse(p.x, p.y, r, r);
  } 
  
  if (!dragging) {
    zoom();
  }
}

void mousePressed() {
  mouseYPrev = mouseY;
  dragging = true;
}
void mouseReleased() {
  dragging = false;
}
void mouseDragged() {
  scaleSpeed = (mouseY - mouseYPrev) / (float) height;
  zoom(false);
  mouseYPrev = mouseY;
}


