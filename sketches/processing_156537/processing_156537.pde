
float cols; 
float diam; 
float gap; 
PVector m; 

void setup() {
  size(400, 400); 
  background(255); 
  noStroke(); 
  smooth(); 

  cols = 5; 
  diam = 30; 
  gap = (width - cols*diam) / (cols + 1); 
  m = new PVector(width/2, height/2);
}

void draw() {
  background(0); 

  float factor = (cos(radians(frameCount))); 
  PVector s, k, g; 

  fill(255); 
  for (float y = gap+diam/2; y < height; y += gap+diam) {
    for (float x = gap+diam/2; x < width; x += gap+diam) {
      fill(255); 
      ellipse(x, y, diam, diam); 
    }
  }

  fill(0); 
  float ymax; 
  for (float y = gap+diam/2; y < height; y += gap+diam) {
    for (float x = gap+diam/2; x < width; x += gap+diam) {
      if (factor >= 0) {
        ymax = height;
      } else {
        ymax = 0;         
      }
      s = new PVector(x, y); 
      g = new PVector(x, ymax); 
      k = PVector.lerp(s, g, 1 - abs(factor));
      fill(lerp(0, 150, 1-abs(factor))); 
      ellipse(k.x, k.y, diam+2, diam+2);
    }
  }
}



