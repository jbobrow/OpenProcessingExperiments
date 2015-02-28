
int circleX = 100; 
int circleY = 100;
int that_shit_cray= 2; 
void setup() {
  size(600, 600);
}
 
void draw() {
  background(0);
  noStroke();
  circleX= circleX+that_shit_cray;
  circleY= circleY+that_shit_cray;
  fill(255,0,0,100);
  ellipse(300,300,circleX,circleY);
  fill(0,255,0,100);
  ellipse(500,300,circleX,circleY);
  fill(0,0,255,100);
  ellipse(100,300,circleX,circleY);
  
  if (circleX>width) { 
    that_shit_cray= -2;
  }
  if (circleX < 0) {
   
    that_shit_cray = 2;
  }
  
}
