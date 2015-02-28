
// Hallo, die Kreise sollten eigentlich "bouncen" und zwar in spiegelverkehrter Richtung der Maus...

float easing = 0.05;
float x;
float y;
void setup(){
  size(500,500);
  background(0);
  
}

void draw(){
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  
}
//void kreuz(int x, int y){
 //line(x,y, x+10, y);
  //line(x,y,x,y+10);
 // line(x, y, x-10, y);
 // line(x, y, x, y-10);
//}

void variableEllipse(int x, int y, int px, int py) {
  noStroke();
  float speed = abs(x-px) + abs(y-py);
  fill(55);
  
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
 ellipse(x, y, speed, speed);
}

 
  
