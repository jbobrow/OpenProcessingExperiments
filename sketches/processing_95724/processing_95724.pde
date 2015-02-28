
int w = 20;
int h = 20;
float x = map (mouseX, 0, width, 100, 100);
float y = map (mouseY, 0, width, 100, 280);
 
 void setup () {
 size(600,400);
 smooth();
}
 
 void draw() {
 background(#DEA472);
 ellipseMode(CENTER);
  
//eyeball
 fill(255);
 noStroke();
 ellipse(150, 150, 175, 175);
 ellipse(450, 150, 175, 175);
 
 
//pupils
  float x = map (mouseX, 0, width, 100, 185);
  float y = map (mouseY, 0, width, 100, 280);
  fill (0, 0, 0, 180);
  ellipse (x, y, w, h);
  fill (0, 0, 0, 180);
  ellipse (x+300, y, w, h);
 }
 
 
 void mousePressed() {
  if (w>10) {
    w = w + 20;
    h = h + 20;
  }
    if (w>200)  {
    w = 20;
    h = 20;
  }
  }



