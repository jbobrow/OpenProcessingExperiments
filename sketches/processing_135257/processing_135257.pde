
int i = 20;
int tortuga = 1;
void setup(){
  noCursor();
  size(600,600);
  colorMode(HSB); 
}

void draw() {
  i=i+tortuga;
  if(i>200 || i < 0){
  tortuga = tortuga*(-1);
  }
  
  fill(i,99,50);
  ellipse(mouseX, mouseY,50, 50);
  fill(i,90,62);
  ellipse(mouseY, mouseX,50, 50);
  ellipse(height-mouseY, width-mouseX,50, 50);
  fill(i,68,59);
  ellipse(width-mouseX,height-mouseY,50, 50);
  ellipse(height-mouseY, mouseX,50, 50);
  fill(i,89,88);
  ellipse(mouseX,height-mouseY,50, 50);
  ellipse(mouseY, width-mouseX,50, 50);
  fill(46,89,i);
  ellipse(width-mouseX,mouseY,50, 50);
}

