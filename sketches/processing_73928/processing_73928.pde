
int lim = 100;
float [] position = new float[lim*3];
int num = 0;
int clicknum = 0;

void setup() {
  size(600, 500);
  smooth();
}

void draw() {
  background(175, 242, 233);
  fill(0, 200, 0);
  rect(0, 400, width, 100);
  
  strokeWeight(2);
  stroke(random(150, 250), random(100, 130), 0);
  for (float i = 0; i < 2*PI; i+=(PI/50)) {
     line(100, 50, 100 + 100*cos(i), 50 + 100*sin(i));
  }
  noStroke();
  fill(255, 255, 0);
  ellipse(100, 50, 100, 100);
  fill(255, 255, 255);
  ellipse(frameCount%(width+150), 50, 200, 50);
  ellipse(frameCount*0.9%(width+150), 100, 200, 60);
  
  stroke(0);
  strokeWeight(1);
  pushMatrix();
  translate(100, 250);
  rotate(PI/6);
  drawFox(0, 0, 1);
  popMatrix();
  
  drawFox(300, 400, 0);
  
  pushMatrix();
  translate(500, 250);
  rotate(-PI/4);
  drawFox(0, 0, 2);
  popMatrix();
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
