
void setup() {
  size (600, 500);
  smooth();
}

void draw() {

  background (50);

  fill(44, 151, 255);
  ellipse (width/2, height/2, 500, 500);


  pushMatrix();



  float noise1 = noise((millis()/10000.0)%width);
  float noise2 = noise(millis()/2000.0);


  float x1 = map(noise1, 0, 1, -10, 250);
  float y1 = map(noise2, 0, 1, -10, 100);
  float xFin = map (noise1, 0, 1, -20, 20);
  float yFin = map (noise2, 0, 1, -25, 25);

  translate (x1, y1);

  fill (196, 226, 255);
  for (int b=0; b<12; b++) {

    float bubSize = 2 + random (5, 25);
    float ybub = random (40, 280);
    float xbub = 100 + random(-10, 10);
    ellipse (xbub, ybub, bubSize, bubSize);
  }

  fill (255, 151, 44);
  beginShape();
  //ellipse (xVal, yVal, body*random(2, 5), body);
  vertex(100, 300);
  bezierVertex(150, 250, 200, 200, 300, 300);
  vertex (300, 300);
  bezierVertex(300, 100, 350, 400, 100, 300);
  vertex(150, 300);
  endShape(CLOSE);

  float dif = random (1,4);
  float eyeSize = random (10, 20);


  for (float e=eyeSize; e>0; e=e-dif) {
    
    fill (255, 0, 0);
    ellipse (150, 280, e, e);
  }

  translate (xFin, yFin);
  fill (255, 0, 0, 100);
  triangle (190, 290, 210, 280, 210, 300);




  popMatrix();
}
