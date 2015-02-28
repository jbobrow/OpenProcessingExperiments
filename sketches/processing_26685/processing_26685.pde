
int[] xpos = new int[300]; 
int[] ypos = new int[300];

void setup() {
  size(500,500);
  
  smooth();
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < xpos.length-1; i ++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  xpos[xpos.length-1] = mouseX; 
  ypos[ypos.length-1] = mouseY;
  
  for (int i = 0; i < xpos.length; i ++ ) {
    
    noStroke();
    fill(random(200,255),random (250),0,random (250));
    ellipse(xpos[i],ypos[i], random(1,15), random (1,15));
    frameRate(100);
  }
}

