
float x;
float y;
float easing = 0.05;
 
void setup() {
  size(610,610);
  noStroke(); 
}
 
void draw() {
  background(250,0,150);
   
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
 fill(255,255,255);
  ellipse(x,y,150,150);
 fill(1,1,1);
ellipse(x,y,60,60);
fill(127,0,0);
ellipse(x,y,30,30);
if(mousePressed){
background(1,1,1);
fill(255,200,200);
ellipse(x,y,150,150);
fill(1,1,1);
rect(x,y,75,5);
rect(x,y,-75,5);
 
}
 
}

