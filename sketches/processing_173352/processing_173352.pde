
int height= 600;
int width= 600;

void setup() {
  size(height, width);
  smooth();
  frameRate(10);
  
  background(255,255,255,0);
}

void draw() {


  
  for (float i=60; i<=width-30; i+=60) {
    for (float j=-30; j<=height; j+=80) {

      if (frameCount>=40) {
        ivy_red(i, j);
      } else {
        ivy_green(i, j);
      }
      if (i==width-30 || j==height) {
        break;
      }
    }
  }

}

void ivy_green(float Lx, float Ly) {
  stroke(0, 255, 0, 40);
  fill(0, 255, 0, 40);
  beginShape();
  vertex(Lx, Ly);
  bezierVertex(Lx+30, Ly+30, Lx+40, Ly+50, Lx, Ly+80);
  bezierVertex(Lx-15, Ly+20, Lx-30, Ly+40, Lx, Ly);
  endShape();
}

void ivy_red(float Lx, float Ly) {
  stroke(255, 0, 0, 40);
  fill(255, 0, 0, 40);
  beginShape();
  vertex(Lx, Ly);
  bezierVertex(Lx+30, Ly+30, Lx+40, Ly+50, Lx, Ly+80);
  bezierVertex(Lx-15, Ly+20, Lx-30, Ly+40, Lx, Ly);
  endShape();
}
