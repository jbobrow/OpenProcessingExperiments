
float x,y;
float targetX, targetY;

void setup(){
  size(500,500);
  background(0);
}

void draw(){

  background(0);
  
  
  targetX = mouseX;
  targetY = mouseY;
  
  x += (targetX - x) * 0.07;
  y += (targetY - y) * 0.07;
 
  ellipse(x, y, 30, 30);
}


