
// Circular Pattern

float R, angle, a, r, g, b;   // Radius, angle, alpha, RGB

void setup(){
  size(600,600);
  background(0);
  reset();
}

void draw(){
  strokeWeight(R/10);
  stroke(r,g,b,a);
  point(R*cos(angle) + 300, R*sin(angle) + 300);
  R++; angle++; a-=0.75;
  if (a<0) { reset(); } 
}

// Generate new parameters
void reset(){
  a=250;
  R=0;
  r=random(255);
  g=random(255);
  b=random(255);
  angle=random(360);  
}


