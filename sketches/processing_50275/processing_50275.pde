
int[] xpos = new int[50];
int[] ypos = new int[50];

void setup() {
  size(500, 500);
  smooth();

  for (int i = 0; i < 50; i++) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
  noCursor();
}

void draw(){
  background(0,0,0);
  for (int i = 0; i < 49; i++) {
    xpos[i] = xpos[i+1]; 
    ypos[i] = ypos[i+1];
    ypos[i]-=(int) random(7);
    xpos[i]-=(int) random(-4,4);   
  }

  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;

  for (int i = 0; i < 50; i++) {
    noStroke();
    fill(400-i*70);
    ellipse(xpos[i], ypos[i], i, i);
  }
}

