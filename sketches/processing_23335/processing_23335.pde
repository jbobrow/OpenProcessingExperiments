
void setup() {
  size(200,200);
  smooth();
}


void draw() {
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  stroke(255);
  fill(250,160,63);
  rect(100,100,30,75);

//head
stroke(255);
fill(250,234,58);
ellipse(mouseX,mouseY,60,60);

//eyes
fill(0);
rect(85,63,20,5);
fill(0);
rect(115,63,20,5);

//mouth
fill(0);
ellipse(100,85,5,10);

//leg
fill(0);
stroke(0);
rect(90,148,5,20);
rect(110,148,5,20);

//hat
fill(0);
rect(100,42,50,2);
fill(0);
rect(100,35,20,15);

//hand
fill(0);
rect(50,100,3,10);
fill(0);
rect(150,100,3,10);
}


