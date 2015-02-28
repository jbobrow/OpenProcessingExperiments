
float x = 0;
float y = 0;
float a = 0;
float b = 0;
float c = 0;
float s = random(50);
int i = 255;

void setup() {
  size(600, 600);
}


void draw() {
  background(0);
  b = random(0, 200);
  c = random(0, 2);
  noFill();
  strokeWeight(c);
  stroke(255);
  rect(300, 300, b, b); 

  stroke(s, 250);
  rectMode(CENTER);
  x = random(0, 600);
  y = random(0, 600);
  a = random(0, 50); 
  fill(frameCount%i); 
  rect(x, y, a, a*random(2));


  translate(width/4, height/4);
  shearX(PI/4.0);
  rect(x, y, random(30), random(30));
}
