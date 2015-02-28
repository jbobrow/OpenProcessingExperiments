
int amo = 1350;

int[] xpos = new int[amo];
int[] ypos = new int[amo];
float[] csize = new float[amo];

void setup() { 
  size (700,400);  
  background (0);

  int i = 0;
  int x = 0;
  int y = 0;

  while (i < amo) {
    if(x >= 700) {
      x = 0;
      y = y + 15;
    }
    
    xpos[i] = 0 + x;
    ypos[i] = y;
    csize[i] = 15;
    
    x = x + 15;
    i = i + 1;
  }
}     

void draw() {
  background(0);  
  fill(0,129,255,100);
  noStroke(); 
  
  //Draws the graphic
  int j = 0;
  while (j < amo){
    ellipse(xpos[j],ypos[j], csize[j], csize[j]);
    j = j + 1;
  }
  
  //Checks size
  int i = 0;
  while (i < amo){
    
    float distance = dist(xpos[i], ypos[i], mouseX, mouseY);
    if(distance < csize[i]/2) {
      if(csize[i] <= 15) {
        csize[i] = csize[i] + 100;
      }
    } else {
      if(csize[i] > 15) {
        csize[i] = csize[i]*0.98;
      }
    }
    i = i + 1;
  }
}  

void mousePressed() {  
  int i = 0;
  while (i < amo){
    
    float distance = dist(xpos[i], ypos[i], mouseX, mouseY);
    if(distance < csize[i]/2) {
      csize[i] = 0;
    }
    i = i + 1;
  }

}

void mouseMoved() {  

} 


