
void setup() {
  background(255,100);
  size(300, 300); 
  smooth();
  strokeWeight(0.2);
  stroke(255);
}

void draw() { 
  fill (247, 246, 238, 20);
  rect (0, 0, height, width);

  fill(8, 84, 95, 20);
  ellipse(10, 50, pmouseX, pmouseY);
  
  fill(244, 232, 208, 20);
  ellipse(290, 50, pmouseX, pmouseY);
  
  fill(244, 232, 208, 20);
  ellipse(10, 290, pmouseX, pmouseY);
  
  fill(8, 84, 95, 20);
  ellipse(290, 290, pmouseX, pmouseY);

  if (mousePressed) {

    fill(212, 150, 230, 10); 

    ellipse(150, 150, pmouseX, pmouseY);
  }
}


