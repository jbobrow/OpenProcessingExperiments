
float x1;
float x2;
float x3;


void setup() {
  size(600, 600);
  background(0);
  strokeWeight(20);
}

void draw() {
  background(0);
  line(100,500,400,500);

   fill(random(225),random(225),0);
  rect(300,300,300,300);
  rect(0,300,300,300);
  rect(300,0,300,300);
  rect(0,0,300,300);
  fill(225,225,0);
  ellipse(300,300,400,400);
  fill(random(225),random(225),0);
  float  x1 = map(second(), 0, 59, 0, 400);
  fill(x1,x1,0);
  ellipse(300, 300, x1, x1); 
 float  x2 = map(second(), 0, 59, 0, 160);
  fill(x2,random(225),0);
  ellipse(500, 100, x2, x2); 
  fill(225,225,225);
  float  x3 = map(second(), 0, 59, 0, 160);
  fill(x3,random(225),0);
  ellipse(100, 100, x3, x3); 
  fill(225,225,225);
  float x4 = map(minute(), 0, 59, 0, 100);
  ellipse(300, 300, x4, x4);  
}
