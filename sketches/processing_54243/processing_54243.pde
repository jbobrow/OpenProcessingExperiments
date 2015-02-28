
void setup() {
  smooth();
  size(500, 500);
}

void draw() {
  background(180);
    // Boden
  line(0, 450, 499, 450);
  frosty(0, 0, 0, 1);  
  frosty(100, -100, 30, 0.5);
  frosty(frameCount % 700 + 50, 600, 180, 0.8);
  
}

void frosty(int x, int y, float winkel, float size) {
  pushMatrix();
  
  translate(x, y);
  rotate(radians(winkel));
  scale(size);
  
  stroke(0, 0, 0);
  fill(255, 255, 255);


  // Körper
  ellipse(250, 400, 100, 100);
  ellipse(250, 400, 4, 4);
  ellipse(250, 385, 4, 4);
  ellipse(250, 370, 4, 4);

  // Kopf
  ellipse(250, 325, 50, 50);

  // Augen
  fill(0, 0, 0);
  ellipse(240, 320, 4, 4);
  ellipse(260, 320, 4, 4);

  // Nase
  noStroke();
  fill(200, 150, 0);
  ellipse(250, 330, 6, 6);

  // Hut
  fill(0, 0, 0);
  stroke(0);
  strokeWeight(2);
  line(220, 308, 280, 308);
  rect(230, 293, 40, 15);

  strokeWeight(1);
  noFill();
  
  popMatrix();
}


