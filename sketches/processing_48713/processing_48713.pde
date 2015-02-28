
import netscape.javascript.*;

int[] xpos = new int[100];
int[] ypos = new int[100];
void setup() {
    background(0); 
  colorMode(RGB);
  size(900,450);
  for (int i = 0; i < xpos.length; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
  noStroke();
  frameRate(60);
  smooth();
}
void draw() {
  for(int i = xpos.length - 2; i >= 0; i--) {
    xpos[i+1] = xpos[i];
    ypos[i+1] = ypos[i];
  }
  xpos[0] = mouseX;
  ypos[0] = mouseY;
  
  for(int i = 0; i < xpos.length; i++) {
    fill(mouseX,random(1,255),mouseY);
    int diameter = xpos.length + 10 - i;
    ellipse(xpos[i],ypos[i],diameter,diameter);
    
    if (mousePressed == true) {
     background  (0);
    }
  }
}
                                                
