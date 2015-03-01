
float[] xpos = new float[50];
float[] ypos = new float[50];

void setup() {
  size(800, 600);
  smooth();

  for (int i = 0; i < 50; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
  //noCursor();
}

void draw() {
  background(255);
  for (int i = 0; i < 49; i++) {
    xpos[i] = xpos[i+1] + (random(-15, 15));
    ypos[i] = ypos[i+1] - 5;
  }

  xpos[xpos.length-1] = width/2;
  ypos[ypos.length-1] = height- 100;

  for (int i = 0; i < 50; i++) {
    noStroke();
    fill(255-i*3.5,0,0);
    ellipse(xpos[i], ypos[i]-=10, i*2, i*2);
  }
}
