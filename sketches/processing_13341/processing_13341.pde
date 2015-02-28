
float currX = 0.0;
float currY = 0.0;
float easing = 0.04;

void setup()
{
  size(640, 480);
  noStroke();
  smooth();
}

void draw()
{
  background(252, 246, 230);
  float targetX = mouseX;
  float targetY = mouseY;
  float dx = (targetX - currX);
  float dy = (targetY - currY);
  currX += (dx * easing);
  currY += (dy * easing);
  currX = constrain (currX, 270, 360);
  currY = constrain (currY, 200, 280);

// eye content
fill(253, 245, 167);
stroke(234, 232, 206);
ellipse(320, 240, 305, 250);

// eye iris
fill(22, 33, 72);
ellipse(currX, currY, 180, 160);

if (mousePressed == true) {
  fill(214, 60, 60);
  ellipse(currX, currY, 180, 160);
}
  
// top lid
noStroke();
fill(236, 127, 178);
beginShape();
vertex(170, 228);
bezierVertex(120, 20, 550, 30, 470, 260);
bezierVertex(470, 120, 170, 120, 170, 228);
endShape();

// bottom lid
beginShape();
fill(236, 127, 178);
vertex(194, 307);
bezierVertex(155, 270, 220, 400, 260, 350);
endShape();

beginShape();
fill(236, 127, 178);
vertex(194, 307);
bezierVertex(340, 400, 440, 330, 460, 290);
bezierVertex(400, 440, 250, 390, 194, 307);
endShape();

// interaction
if (mousePressed == false) {
  beginShape();
  vertex(170, 228);
  bezierVertex(130, 40, 550, 60, 470, 260);
  bezierVertex(470, 150, 170, 120, 170, 228);
  endShape();
  
  beginShape();
  vertex(194, 307);
  bezierVertex(300, 350, 430, 320, 460, 290);
  bezierVertex(360, 460, 220, 350, 194, 307);
  endShape();
}

if (mousePressed == true) {
  fill(114, 97, 65);
  beginShape();
  vertex(170, 228);
  bezierVertex(120, 20, 550, 30, 470, 260);
  bezierVertex(470, 120, 170, 120, 170, 228);
  endShape();

  beginShape();
  vertex(194, 307);
  bezierVertex(155, 270, 220, 400, 260, 350);
  endShape();

  beginShape();
  vertex(194, 307);
  bezierVertex(340, 400, 440, 330, 460, 290);
  bezierVertex(400, 440, 250, 390, 194, 307);
  endShape();
}

}

