
float h = 0;
float s = 0;
float b = 0;

float h2 = 0;
float s2 = 0;
float b2 = 0;

void setup() {
  size(360, 400);
  colorMode(HSB);
  rectMode(CENTER);
}

void draw() {
  
  h = mouseX;
  s = mouseY/4;
  b = mouseY/4;
  
  fill(h,s,b);
  rect(width/2, height/2, width, height);
  
  h2 = h/2; 
  s2 = s/2;
  b2 = b/1.5;
  
  fill(h2, s2, b2);
  rect(width/2, height/2, 80, 100);
}



