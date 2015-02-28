
float x;
float y;
float easing = 0.05;

void setup() {
  size(300, 300); 
  noStroke(); 
}
 
 void draw() { 
  background(77,77,255); 

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
rect(270,13,15,60);
rect(-10, 20, 60, 15);
rect(15,35,10,250);
rect(15,275,70,10);
rect(75,33,10,250);
rect(75,33,200,10);
rect(150,35,10,250);
rect(200,35,10,250);
rect(205,275,70,10);
fill(0);
rect(270,250,40,40);
fill(0);
  line(30, 20, 85, 75);
  ellipse(x,y,5,5);


}
