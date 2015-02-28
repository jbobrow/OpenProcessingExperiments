
float a = 0.0;
float s = 0.0;

void setup() {
  size(640, 360);
  noStroke();
  rectMode(CENTER);
  frameRate(30);
}

void draw() {
  
  background(0,127,255);
  
  a = a + 0.05;
  s = cos(a)*2;
  
  
  
  translate(width/2, height/2);
  scale(s); 
  fill(0,140,255);
  ellipse(0, 0, 50, 50);
 
  translate(width/2, height/2);
  scale(s); 
  fill(0,200,255);
  ellipse(0, 0, 100, 100);  
  
  
  translate(200, 75);
  fill(0, 45, 200, 40);
  scale(s);
  ellipse(0, 0, 50, 50);  

  translate(25, 25);
  fill(0, 45, 200, 40);
  scale(s/2);
  ellipse(0, 0, 200, 200);

  translate(75, 50);
  fill(0, 45, 200, 40);
  scale(s+30);
  ellipse(0, 0, 50, 50);  
}

