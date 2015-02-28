

int SIZE = 500;
float[] coords = new float[2 * SIZE];
float r;

void setup() {
  size(500, 500);
  noStroke();
  noCursor();
  frameRate(24);
  
  for(int i = 0; i < 100; i++) {
    coords[i] = (int)random(width);
  }
}

void draw() {
  background(random(30, 40));
  
  for(int j = 0; j < height; j += 16) {
      fill(j / 2 + sin(r) * 20 + random(4) + 50);
      rect(0, j, width, height);
  }
  
  r += 0.1;
  if(r > TWO_PI) r = 0;
  
  fill(255, 100);
  
  for(int i = 0; i < SIZE; i += 4) {
      triangle(
        coords[i], 
        coords[i + 1], 
        coords[i + 2], 
        coords[i + 3],
        mouseX,
        mouseY);  
  }
  
  for(int i = 0; i < 100; i += 2) {
    
    coords[i] += random(-10, 10);
    coords[i + 1] += random(-10, 10);
    
    if(coords[i] < 0) coords[i] = 0;
    if(coords[i] > width) coords[i] = width;
    if(coords[i + 1] < 0) coords[i + 1] = 0;
    if(coords[i + 1] > width) coords[i + 1] = width;
    
    if(coords[i] < mouseX) coords[i] += 2;
    if(coords[i] > mouseX) coords[i] -= 2;
    if(coords[i + 1] < mouseY) coords[i + 1] += 2;
    if(coords[i + 1] > mouseY) coords[i + 1] -= 2;
    
  }
  
  for(int i = 0; i < 10; i++) {
    fill(250, 20);
    rect(
    16 * (int)random(width / 16), 
    16 * (int)random(height / 16), 16, 16);
  } 
 
    fill(255, 150);
    float radius = random(64);
    ellipse(mouseX - 4, mouseY - 4, radius, radius);

 
}


void mousePressed() {
  
  for(int i = 0; i < 100; i += 2) {
    if(coords[i] > mouseX) coords[i] += 20;
    if(coords[i] < mouseX) coords[i] -= 20;
    if(coords[i + 1] > mouseY) coords[i + 1] += 20;
    if(coords[i + 1] < mouseY) coords[i + 1] -= 20;
  }
  
}

