
float a = 0; 
float b = 0; 
float c = 10; 
float d = 10; 
float e = 40; 
float f = 40; 
float g = 100; 
float h = 50; 
 
void setup() { 
  size(600, 600); 
  background(0); 
  smooth(); 
  loop(); 
} 
 
void draw() { 
  stroke(240, 166, f, 50); 
  fill(a, b, c, 2); 
  bezier(a, b, c, d, e, f, g, h); 
  bezier(width - a, b, c, d, e, f, g, h); 
  bezier(a, height - b, c, d, e, f, g, h); 
  bezier(width - a, height - b, c, d, e, f, g, h); 
  a = a + random(-1, 3); 
  b = b + random(-1, 2); 
  c += 0.01; 
  d += 0.05; 
  e += random(-1,2); 
  f += 0.1; 
  g -= 1; 
  h += 1; 
  if (a > width) { 
    a = 0; 
    c = random(width); 
  } 
  if (b > height) { 
    b = 0; 
    d = random(width); 
  } 
} 
 
void keyPressed() { 
  noLoop(); 
} 
 
void mousePressed() { 
  loop(); 
} 


