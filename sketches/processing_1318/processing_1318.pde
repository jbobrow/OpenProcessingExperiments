
int C;
int col;
int M;
void setup() {
 
  size(800,800);
  background(0); 
  colorMode(HSB);
  C = 0;  
  col = 0;
 M = 256;
noCursor();
}
  void draw() {
 C = (C+1) % 256;
  col = (col+1) % 256;
   M = (M-1) ;
    noStroke();
   smooth();
   fill(M,255,255,25);
   ellipse(mouseX, mouseY, 25, 25);
   fill(col,255,255,25);
   ellipse(mouseY, mouseX, 25, 25);
   if(mousePressed)
   background(0); 
   if(keyPressed)
    if (key == 'c' || key == 'c')
noLoop();
    if (key == 'v' || key == 'v')
redraw();
 if(M == 0) {
   M = 256;
   
}
 
 
  }

