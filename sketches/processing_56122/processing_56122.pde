
void setup() {
  size(500, 500);
  
}

void draw() {
  background(255);
  
  drawTri1(width/2, height/2, width);
  drawTri2(width/2, height/2, width);
}

void drawTri1(float x, float y, float a) {
  color c1 = color(random(255), random(255), random(255));
  noStroke();
  fill( c1, 50);
  triangle(x-a/2, y, x+a/2, y, x, y-a/2*1.73);
  if (a > 10) {
    pushMatrix();
    //rotate(theta);

    fill(0, 116, 255, 40);
    drawTri1( x + a/2, y, a/2);
    fill(255, 0, 94, 40);
    drawTri1( x - a/2, y, a/2);
    fill(0, 116, 255, 40);
    drawTri1( x, y + a/2, a/2);
    fill(255, 0, 94, 40);
    drawTri1( x, y - a/2, a/2);
    popMatrix();
  }
}

void drawTri2(float x, float y, float a) {
  color c1 = color(random(255), random(255), random(255));
  noStroke();
  fill( c1, 50);
  triangle(x-a/2, y, x+a/2, y, x, y+a/2*1.73);
  if (a > 10) {
    pushMatrix();
    //rotate(theta);

    fill(255, 0, 94, 40);
    drawTri2( x + a/2, y, a/2);
    fill(0, 116, 255, 40);
    drawTri2( x - a/2, y, a/2);
    fill(255, 0, 94, 40);
    drawTri2( x, y + a/2, a/2);
    fill(0, 116, 255, 40);
    drawTri2( x, y - a/2, a/2);
    popMatrix();
  }
}
