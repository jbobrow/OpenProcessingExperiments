
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
    
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
    ypos[i] = ypos[i] - 5;
    xpos[i] = xpos[i] + random(-3,3);
  }
 
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;

  for (int i = 0; i < 50; i++) {
    
    noStroke();
    fill(255-i*5, 0, 0);
    ellipse(xpos[i], ypos[i], i, i);
  }
}

