
//Aviva Silberstein  
//February 25, 2013
//Moving Objects




int circleA = 250; 
int circleB= 200; 
int circleC= 2;
void setup() {
  size(600, 600);
 
}

void draw() {
  background(0);
  noStroke();
  circleA= circleA+circleC;
  circleB= circleB+circleA;
  fill(216, 73, 227);
  ellipse(circleB, circleC, 200, 200);
  fill(174, 227, 195);
  ellipse(200, 200, circleA, circleB);
  fill(138, 117, 227);
  ellipse(500, 300, circleA, circleB);
  fill(218, 237, 77);
  ellipse(100, 100, circleA, circleB);
  fill(255,0,0,127);
  ellipse(circleA, circleA, 150, 150);
 
  


  circleA=circleA + circleC;
  if (circleA>width) { 
    circleC= -2;
  }
  if (circleA < 0) {
    circleC= 2;
  }
  
}
