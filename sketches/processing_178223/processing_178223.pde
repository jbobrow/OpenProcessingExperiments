

float x1, y1, xr, yr;
  
  
void setup() {
   size(720,480);
  smooth();
}

void draw() {
  x1 = random(width); 
  y1 = random(height); 
  xr = random(width/2);
  yr = random(height/2);
  
  fill(random(255),random(255),random(255)); 
  ellipse(x1, y1, yr, yr);
}
