
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(50, 155, 1400);
  for(int i = 0; i < 600; i += 100) {
    for(int j = 10; j < 600; j += 120) {
      drawFox(i, j+70, i%3);
    }
  }
}
void drawFox(float px, float py, float click) {
  //right legs
  stroke(100, 0, 0);
  switch(int(click)) {
    case 0:
      fill(120, 0, 0);
      break;
    case 1:
      fill(200);
      break;
    case 2:
      fill(190, 145, 10);
      break;
  }
  pushMatrix();
  translate(px - 20, py - 25);
  drawFoxfeet(0, 0);
  translate(40, 10);
  scale(-1, 1);
  drawFoxfeet(0, 0);
  popMatrix();

  switch(int(click)) {
    case 0:
      fill(200, 0, 0);
      break;
    case 1:
      fill(255);
      break;
    case 2:
      fill(255, 200, 0);
      break;
  }
  drawFoxbody(px, py);
  drawFoxfeet(px, py);
  pushMatrix();
  translate(px + 10, py + 10);
  scale(-1, 1);
  drawFoxfeet(0, 0);
  popMatrix();
  
  switch(int(click)) {
    case 0:
      fill(255, 255, 180);
      stroke(255, 255, 100);
      break;
    case 1:
      fill(255, 255, 255);
      break;
    case 2:
      fill(0);
      stroke(0);
      break;
  }
  
  drawTail(px, py);
  fill(0, 0, 0);
  noStroke();
  ellipse(px - 60, py - 50, 5, 5);
  ellipse(px - 85, py - 65, 5, 5);
  ellipse(px - 118, py - 68, 5, 5);
}

void drawFoxbody(float px, float py) {
  beginShape();
  vertex(px + 70, py - 20);
  bezierVertex(px + 30, py - 50, px + 10, py + 20, 
  px - 40, py - 50);
  vertex(px - 30, py - 70);
  vertex(px - 50, py - 60);
  bezierVertex(px - 50, py - 70, px - 65, py - 85, 
  px - 80, py - 75);
  vertex(px - 70, py - 90);
  vertex(px - 80, py - 80);
  bezierVertex(px - 90, py - 70, px - 90, py - 60, 
  px - 120, py - 70);
  bezierVertex(px - 100, py - 20, px - 80, py - 20, 
  px - 70, py - 20);
  bezierVertex(px - 60, py + 50, px + 70, py + 50, 
  px + 80, py);
  bezierVertex(px + 150, py + 10, px + 70, py - 70, 
  px + 120, py - 90);
  bezierVertex(px + 30, py - 80, px + 95, py - 20, px + 70, py - 20);
  endShape();
}

void drawFoxfeet(float px, float py) {
  beginShape();
  vertex(px - 50, py + 10);
  bezierVertex(px - 60, py + 30, px - 80, py + 30, px - 90, py + 20);
  bezierVertex(px - 70, py + 50, px - 25, py + 30, px - 25, py + 15);
  endShape();
}

void drawTail(float px, float py) {
  beginShape();
  vertex(px + 72, py - 45);
  vertex(px + 78, py - 40);
  vertex(px + 82, py - 50);
  vertex(px + 90, py - 45);
  vertex(px + 95, py - 55);
  vertex(px + 103, py - 50);
  bezierVertex(px + 105, py - 55, px + 100, py - 80, 
               px + 122, py - 91);
  bezierVertex(px + 30, py - 85, px + 80, py - 35, px + 70, py - 45);
  endShape();
}
