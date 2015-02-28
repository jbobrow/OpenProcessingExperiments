
// series of two for() loops
// one draws completely, then the other

void setup() {
  size(200, 200);
  colorMode(HSB, width, 180, width);
}

void draw() {
  background(0);
  for (int x=20; x<180; x+=5) {
    stroke(mouseX,x,width);
    line(x, 20, x*7, 180);
  }
  
   for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*.2, y);
  }
  
   for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*.4, y);
  }
  
  for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*.6, y);
  }
  
   for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*.9, y);
  }
  for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*1.1, y);
  }
  
  for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*1.3, y);
  }
   for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*1.5, y);
  }
  
  for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*1.7, y);
  }
  
   for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*1.9, y);
  }
  
   for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*2.1, y);
  }
  
   for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*2.3, y);
  }
  
   for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*2.5, y);
  }
  
  for (int y=5; y<200; y+=10) {
    stroke(mouseY,y*10,width);
    point(y*2.7, y);
  }

}


