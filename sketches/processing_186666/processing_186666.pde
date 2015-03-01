
void setup() {
  size(500, 500);
  noStroke();
  noLoop();
  rectMode(CENTER);
  background(255);
}


void draw() {
  circles(100, 100, 275, 200, 125);
  circles(450, 400, 250, 175, 100);
  circles(400, 100, 300, 200, 100);
  circles(125, 450, 250, 175, 100);
  circles(300, 100, 300, 200, 100);
  circles(450, 200, 250, 150, 50);
  circles(100, 300, 350, 250, 150);
  circles(0, 500, 250, 150, 50);
  circles(250, 250, 200, 150, 100);
  circles(50, 50, 150, 100, 50);
  circles(400, 300, 225, 175, 125);
  circles(350, 450, 250, 175, 100);
  circles(260, 390, 100, 75, 50);
  circles(100, 230, 100, 75, 50);
  
  pushMatrix();
  square(400, 300, 150, 100, 50, 15, 200);
  popMatrix();
  
  pushMatrix();
  square(500, 0, 300, 200, 100, 0, 150);
  popMatrix();
  
  pushMatrix();
  square(200, 400, 200, 125, 50, 20, 125);
  popMatrix();
  
  pushMatrix();
  square(10, 30, 100, 75, 50, 30, 150);
  popMatrix();
  
  pushMatrix();
  square(150, -150, 150, 100, 50, 70, 210); 
  popMatrix();
  
  pushMatrix();
  square(150, 300, 150, 100, 50, 0, 175);
  popMatrix();
}


void circles(int x, int y, int size1, int size2, int size3) { 
  fill(0, 255, 60);
  ellipse(x, y, size1, size1);

  fill(0, 144, 255);
  ellipse(x, y, size2, size2);

  fill(186, 0, 255);
  ellipse(x, y, size3, size3);
}

void square(int x, int y, int size1, int size2, int size3, int r, int opac) {
  
  rotate(radians(r));
  fill(255, 0, 0, opac);
  rect(x, y, size1, size1);

  fill(255, 140, 0, opac);
  rect(x, y, size2, size2);
  
  fill(255, 255, 0, opac);
  rect(x, y, size3, size3);
}



