
// Spring
// What is the spring?
// Regrowing plants geow in pollution land. Sylph are happy in the grass.
// lin wenyu  (ken3101462@gmail.com)


float xstart, xnoise, ystart, ynoise;
void setup() {
  size(800, 600, P3D);
  //background(13, 51, 255);
  sphereDetail(8);
  noStroke();
  xstart = random(5);
  ystart = random(5);
}

void draw() {

  background(244, 255, 190);
  xstart += 0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.3;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      drawPoint2(x, y, noise(xnoise, ynoise));
      drawPoint1(x, y, noise(xnoise, ynoise));//grass
    }
  }
  // sylph 
  drawlights1(mouseX-20, mouseY);
  drawlights1(mouseX-10, mouseY-10);
  drawlights1(mouseX-25, mouseY-15);
  drawlights1(mouseX-30, mouseY-20);
  drawlights1(mouseX+70, mouseY-2);
  drawlights2(mouseX-30, mouseY);
  drawlights2(mouseX-40, mouseY-10);
  drawlights2(mouseX-45, mouseY-25);
  drawlights2(mouseX-40, mouseY-40);
  drawlights2(mouseX-60, mouseY-50);
  drawlights2(mouseX-50, mouseY-80);
  drawlights2(mouseX-60, mouseY-150);
  drawlights2(mouseX-60, mouseY+30);
  drawlights2(mouseX+60, mouseY+50);
  drawlights2(mouseX+60, mouseY-5);
  drawlights3(mouseX+60, mouseY);
  
    drawlights1(mouseY-20, mouseX);
  drawlights1(mouseY-10, mouseX-10);
  drawlights1(mouseY-25, mouseX-15);
  drawlights1(mouseY-30, mouseX-20);
  drawlights1(mouseY+70, mouseX-2);
  drawlights2(mouseY-30, mouseX);
  drawlights2(mouseY-40, mouseX-10);
  drawlights2(mouseY-45, mouseX-25);
  drawlights2(mouseY-40, mouseX-40);
  drawlights2(mouseY-60, mouseX-50);
  drawlights2(mouseY-50, mouseX-80);
  drawlights2(mouseY-60, mouseX-150);
  drawlights2(mouseY-60, mouseX+30);
  drawlights2(mouseY+60, mouseX+50);
  drawlights2(mouseY+60, mouseX-5);
  drawlights3(mouseY+60, mouseX);
}

//grass
void drawPoint1(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y+115, y);
  rotate(noiseFactor * radians(220));
  float edgeSize = noiseFactor * 35;
  float grey =  noiseFactor*3;
  float alph = 150 + (noiseFactor*220);
  scale(0.5);
  strokeWeight(grey);
  stroke(random(120, 130), random(180, 255), random(20, 30), alph);
  line(0, 0, edgeSize/2, edgeSize*2);
  popMatrix();
}

void drawPoint2(float x, float y, float noiseFactor) {
  float c1 =  (noiseFactor * 120);
  float c2 =  (noiseFactor * 180);
  float c3 =  (noiseFactor * 80);
  pushMatrix();
  translate(x, 680-y, 500-y);
  rotateY(100);
  strokeWeight(1); 
  stroke(c1, c2, c3);  
  line(0, 0, 10*random(5), 100);
  popMatrix();
}

// sylph
void drawlights1(float x, float y) {
  pushMatrix();
  translate(x, y+115, y);
  stroke(255, 50);
  strokeWeight(random(6));
  fill(255, 249, 177, random(30, 200));
  sphere(random(2, 5));
  sphere(random(3, 6));
  popMatrix();
}

// sylph
void drawlights2(float x, float y) {
  pushMatrix();
  translate(x, y+115, y);
  stroke(255, 50);
  strokeWeight(random(6));
  fill(255, 249, 177, random(30, 200));
  sphere(random(1, 2));
  sphere(random(2, 4));
  popMatrix();
}

// sylph
void drawlights3(float x, float y) {
  pushMatrix();
  translate(x, y+115, y);
  stroke(255, 50);
  strokeWeight(random(6));
  fill(255, 249, 177, random(30, 200));
  sphere(random(1, 2));
  sphere(random(2));
  popMatrix();
}



