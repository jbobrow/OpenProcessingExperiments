
float step = pow(2, -12); 
float pct; 
color start, end; 
float r1, g1, b1, r2, g2, b2, r, g, b;

void setup() {
  size(500, 500); 
  pick();
}

void draw() {
    
  if (pct <= 1.0) {
    r = r1 + (r2 - r1) * pct;
    g = g1 + (g2 - g1) * pct;
    b = b1 + (b2 - b1) * pct;
    pct = pct + step;
    fill(color(r, g, b));
    rect(0, 0, width/2, height);
  } 
  else {
    pick();
  }  


}

void pick() {  
  pct = 0.0;
  r1 = random(255);
  g1 = random(255);
  b1 = random(255);
  start = color(r1, g1, b1); 
  fill(start);
  rect(0, 0, width/2, height);  
  r2 = random(255);
  g2 = random(255);
  b2 = random(255);
  end = color(r2, g2, b2); 
  fill(end);
  rect(width/2, 0, width/2, height);
}  



