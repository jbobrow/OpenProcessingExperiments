
int num = 720;
int[] dx = new int[num];
int[] dy = new int[num];

void setup() {
  size(1280, 720);
  frameRate(30);
  smooth();
  for (int i = 0; i < num; i++) {
    dx[i] = i * 20;
    dy[i] = i * 20;
  }
}

void draw() {
  //background(255);
  strokeWeight(2);
  smooth();
  for (int i = 0; i < num; i++) {
    dx[i] = dx [i] -1;
    dy[i] = dy [i] -1;
    line(dx[i], 720, dy[i], 0);
  if (dy[i] < 0) {
    dy[i] = dy[i] + 100;
    dx[i] = dx[i] + 100;
  }
  translate(-5,-5);
  shapeMode(CENTER);
  noStroke();
  fill(255);
  // The idea is to get the mouse to break the lines eventually.
  // And also make a note evertime it hits a line.
  ellipse(mouseX, mouseY, 30, 30);
  stroke(0);
  resetMatrix();
  }
}
