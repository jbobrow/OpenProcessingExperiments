
void setup() {
  size (800, 800);
  frameRate(12);
}

void draw() {
  background (120);
  smooth();
  ellipseMode(CENTER);
  fill(0);
  ellipse (width/2, height/2, width/30, height/30);
  
  
  
  
  
  int radiusSeed=(width+height)/43;
  int thicknesSeed=(width+height)/60;
  
  //int angleSeed = (mouseX+mouseY)/5;  
  int angleSeed = 10;
  spiral(radiusSeed, thicknesSeed, angleSeed);
}





