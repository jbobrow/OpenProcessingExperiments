
void setup() {
  size(650,450);
   smooth();
}
float circleA = 100;
float circleB = 50;
float speedA = 10;
float speedB = 5;
void draw() {
  if(circleA < 0 || circleA > width) 
    speedA = -speedA;
  if(circleB > height)
    speedB = -speedB;  
  else 
    speedB += 1;  
  
  circleA = circleA + speedA;
  circleB = circleB + speedB;
  background(0,0,100);
  rect(mouseX-100,height-10,120,10);
  ellipse(circleA, circleB, 50, 50);
  fill(500,250,0);
  
}



