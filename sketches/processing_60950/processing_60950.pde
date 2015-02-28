
// *******************************************************************************************
//
// DCR_120429_markupcity_10.pde
// Code by DOCTORCROWD / Stefano Massa / 2012
// This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
// (CC BY-SA 3.0)
//
// *******************************************************************************************

int i,f,j;
int angle=270;
float g=50;

void setup() {
  size(1500,800);
  smooth();

}

void draw () {
  background(10);
  noStroke();
  float rcx = mouseX/10000.0;
  float rcy = mouseY/10000.0;
    for(f=0; f<width; f+=g) {
      for(j=0; j<height; j+=g) {
        fill((f*255/width),(j*255/height),0,f/20+150);
        int click = int(random(5));
        int gg = (int)random(g)+1;
        beginShape();
          vertex(f+f*rcx,j);
          vertex(f+g,j+j*rcy);
          vertex(f-f*rcx+g,j+g);
          vertex(f,j+j*4*rcy);        
        endShape();
       } 
     }
  
  signature();
} 

void signature() {
  noStroke();
  fill(0);
  rect(width-188,height-34,170,20);
  fill(255);
  text("doctorcrowd.github.com", width-180, height-20);
}

// ENJOY

