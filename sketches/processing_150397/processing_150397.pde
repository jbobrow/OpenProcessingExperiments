
int[] xpos = new int[150];
int[] ypos = new int[150];

void setup() {
  size(800, 600, P3D);
  smooth();
  for (int i = 0; i < 150; i++) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
  noCursor();
}

void draw() {
   camera(mouseX*3, 100*3, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  background(255);
  for (int i = 0; i < ypos.length-1; i++) {
    xpos[i] = xpos[i+ 1]; 
    ypos[i] = ypos[i+1];
    ypos[i] -= (int)random(7);
    xpos[i] -= (int)random(-6, 6);
  }
  xpos[xpos.length-1]= mouseX;
  ypos[ypos.length-1]= mouseY;
  for (int i = 0; i < 150; i++) {
    noStroke();
    fill(155-i);
    if (mousePressed){
  
  fill(255 - i, 0, 0);
}
pushMatrix();
translate(xpos[i],ypos[i]);
    box(i);
    popMatrix();
  }
}



