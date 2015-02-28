
int counter;

void setup() {
  size (500, 500);
  smooth();
  background (0);
}

void draw() {
  smooth();
  noStroke();
  fill(#E1FF03);
  ellipse(250, 250, 250, 250);

  noStroke();
  fill(0);
  ellipse (300, 200, 20, 20);
  ellipse (200, 200, 20, 20);
  ellipse (250, 300, 40, 50);
  
  fill(#E1FF03,255);
  ellipse (250,300,40,20);

  strokeWeight(10);
  fill(255, 0, 0, 100);
  triangle(225, 225, 275, 225, 250, 250);
  
  rect(125,125,125,125);
  rect(250,250,125,125);
  
  fill(#03FF2A,100);
  rect(250,125,125,125);
  rect(125,250,125,125);
  
}
