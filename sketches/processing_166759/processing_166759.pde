
int[] xpos = new int[50];
int[] ypos = new int[50];

void setup() {
  size(400, 400);
  smooth();

  for (int i = 0; i < 50; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
  //noCursor();
}

void draw() {
  background(250);
  for (int i = 0; i < 49; i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
    ypos[i] -= 5;
    xpos[i] += random (-10,10);
  }

  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;

  for (int i = 0; i < 50; i++) {
    noStroke();
    fill(200-i*350,87,40,30);
    ellipse(xpos[i], ypos[i], i, i);
  }
}

