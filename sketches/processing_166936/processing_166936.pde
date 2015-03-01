
float[] xpos = new float[50];
float[] ypos = new float[50];
float z=500;

void setup() {
  size(800, 600);
  for (int i = 0; i < 50; i++) {

    xpos[i] = width/2;
    ypos[i] =z-random(400-80);
    ypos[i]-=2;
    xpos[i]=xpos[i]+random(-4,4);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < 49; i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1]-random(10);
  }

  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;

  for (int i = 0; i < 50; i++) {
    noStroke();
    fill(255-i*5);
    ellipse(xpos[i], ypos[i], i, i);
  }
}


