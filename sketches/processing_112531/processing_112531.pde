
float a = 0.0;
float s = 0.0;

void setup() {
  size(640, 360);
  noStroke();
  rectMode(CENTER);
  frameRate(12);
}

void draw() {
  
  background(200);
  
  a = a + 0.04;
  s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s); 
  fill(600,0,200);
  ellipse(0, 0, 50, 50); 
  
  translate(50, 0);
  fill(0,125,200);
  scale(s);
  ellipse(0, 0, 65, 65);       
}
