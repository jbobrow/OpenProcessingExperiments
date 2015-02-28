
float a = 1000;
float s = 520;

void setup() {
  size(640, 360);
  noStroke();
  rectMode(CENTER);
  frameRate(50);
}

void draw() {
  
  background(#0000FF);
  
  a = a + 0.04;
  s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s); 
  fill(#00FF00);
  rect(0, 0, 150, 150); 
  
  translate(105, 0);
  fill(#FFFF00);
  scale(s);
  rect(0, 0, 150, 150);       
}
