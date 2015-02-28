
float[] xpos=new float[50];
float[] ypos=new float[xpos.length];

void setup() {
  size(500, 500);
  for (int i=0; i<xpos.length; i++) {
    xpos[i]=0;
    ypos[i]=0;
  }
}

void draw() {
  background(0);
  for (int i = 0; i < xpos.length-1; i++) {
    xpos[i] = xpos[i+1]; 
    ypos[i] = ypos[i+1];
    ypos[i]=ypos[i]-5;
    xpos[i]=xpos[i]+random(-2, 2);
  }
  xpos[xpos.length-1]=mouseX;
  ypos[ypos.length-1]=mouseY;
  for (int i = 0; i < xpos.length; i++) {
    noStroke();
    fill(255-i*5);
    ellipse(xpos[i], ypos[i], i+10, i+10);
  }
}



