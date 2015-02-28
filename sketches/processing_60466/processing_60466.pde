
void setup() {
  size(500, 500);
  smooth();  
  noStroke();
}


void draw() {
  background(250);
  rect(200, 200, 50, 50);
  fill(0, 0, 250);
  
  rotate(radians(20) );
  translate(50, 0);
  rect(30, 90, 50, 50);
  fill(250, 0, 0);
  
  rotate(radians(80) );
  translate(50, 0);
  rect(0, 0, 30, 30);
  fill(0, 250, 0);
  
/*  rotate(radians(50) );
  translate(80, 0);
  rect(40, 60, 30, 30);
  fill(0, 100, 100);
  */  
}

