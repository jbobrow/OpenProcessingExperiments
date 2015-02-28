
float r = 0;
float x = 0;
void draw_rectangle(float x, float y, float rotsped) {
  translate(x,y);
  rotate(rotsped);
  rect(0,0,50,50);
  resetMatrix();
}



void setup() {
  size(400,400);
 
background(255);
 
  rectMode(CENTER);
  
  noStroke();
  smooth();
  fill(0);
}


void draw() {
  background(255);
  fill(255,0,255);
  draw_rectangle(100,100,r/2);
  fill(255,0,0);
  draw_rectangle(300,100,r);
  fill(0);
  draw_rectangle(100,300,r*2);
  fill(0,0,255);
  draw_rectangle(300,300,r*4);
 
  
  
r = r + 0.02;
}

