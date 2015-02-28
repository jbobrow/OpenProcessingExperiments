
float[][] from = {{150, 150}, {250, 400}, {50, 400}};
float[][] to = {{400, 150}, {500, 400}, {300, 400}};
float[][] model = {{180, 180}, {280, 430}, {80, 430}};
float[][] target = new float[3][2];

boolean moving = false;
int which = 0;
int selected = 0;
float fontSize = 16;

void setup() {
  size(600, 600);
  textFont(createFont("", fontSize));
  textAlign(CENTER, CENTER);
  ellipseMode(CENTER);
  strokeWeight(2);
  smooth();
}

void draw() {
  if(moving) {
    float[] cur = new float[]{mouseX, mouseY};
    if(which == 0)
      from[selected] = cur;
    else if(which == 1)
      to[selected] = cur;
    else if(which == 2)
      model[selected] = cur;
  }
  
  background(255);
  drawTriangle(from, color(255, 0, 0));
  drawTriangle(to, color(0, 0, 255));
  drawTriangle(model, color(0, 255, 0));
  
  target[0] = affineTransform(model[0], from, to);
  target[1] = affineTransform(model[1], from, to);
  target[2] = affineTransform(model[2], from, to);
  drawTriangle(target, color(255, 0, 255));
}

void drawTriangle(float[][] tri, color c) {
  noFill();
  stroke(c);
  beginShape(TRIANGLES);
  for(int i = 0; i < 3; i++)
    vertex(tri[i][0], tri[i][1]);
  endShape();
  
  noStroke();
  for(int i = 0; i < 3; i++) {
    fill(255);
    ellipse(tri[i][0], tri[i][1], fontSize, fontSize);
    fill(c);
    text(i, tri[i][0], tri[i][1]);
  }
}

void mousePressed() {
  moving = false;
  for(int i = 0; i < 3; i++) {
    if(dist(mouseX, mouseY, from[i][0], from[i][1]) < fontSize) {
      which = 0;
      selected = i;
      moving = true;
      break;
    }
    if(dist(mouseX, mouseY, to[i][0], to[i][1]) < fontSize) {
      which = 1;
      selected = i;
      moving = true;
      break;
    }
    if(dist(mouseX, mouseY, model[i][0], model[i][1]) < fontSize) {
      which = 2;
      selected = i;
      moving = true;
      break;
    }
  }
}

void mouseReleased() {
  moving = false;
}

// http://stackoverflow.com/questions/1114257/transform-a-triangle-to-another-triangle
float[] affineTransform(float[] p, float[][] a, float[][] b) {
  float r1 = ((b[0][0]-b[1][0])*(a[0][1]-a[2][1])-(b[0][0]-b[2][0])*(a[0][1]-a[1][1]))/
              ((a[0][0]-a[1][0])*(a[0][1]-a[2][1])-(a[0][0]-a[2][0])*(a[0][1]-a[1][1]));
  float r2 = ((b[0][0]-b[1][0])*(a[0][0]-a[2][0])-(b[0][0]-b[2][0])*(a[0][0]-a[1][0]))/
              ((a[0][1]-a[1][1])*(a[0][0]-a[2][0])-(a[0][1]-a[2][1])*(a[0][0]-a[1][0]));
  float r3 = b[0][0]-r1*a[0][0]-r2*a[0][1];
  float r4 = ((b[0][1]-b[1][1])*(a[0][1]-a[2][1])-(b[0][1]-b[2][1])*(a[0][1]-a[1][1]))/
              ((a[0][0]-a[1][0])*(a[0][1]-a[2][1])-(a[0][0]-a[2][0])*(a[0][1]-a[1][1]));
  float r5 = ((b[0][1]-b[1][1])*(a[0][0]-a[2][0])-(b[0][1]-b[2][1])*(a[0][0]-a[1][0]))/
              ((a[0][1]-a[1][1])*(a[0][0]-a[2][0])-(a[0][1]-a[2][1])*(a[0][0]-a[1][0]));
  float r6 = b[0][1]-r4*a[0][0]-r5*a[0][1];
  float x = r1 * p[0] + r2 * p[1] + r3;
  float y = r4 * p[0] + r5 * p[1] + r6;
  return new float[]{x, y};
}

