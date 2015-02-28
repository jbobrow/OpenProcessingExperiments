
int smallPoint, largePoint;

void setup() {
  size(640, 360);
  background(51);
  noCursor();
  smallPoint = 4;
  largePoint = 20;
}

void draw() { 
  background(51);
  
  if(mouseY < height/2){
      float pointillize = map(mouseX, mouseY, width, smallPoint, largePoint);
  int x = int(random(width));
  int y = int(random(height));
  fill(255, 128);
  ellipse(x, y, 30, 30);
  }else{
    ellipse(mouseX, mouseY, 50, 50);
  }
  
  
  ellipse(mouseX,mouseY, 50, 50);
 
}
