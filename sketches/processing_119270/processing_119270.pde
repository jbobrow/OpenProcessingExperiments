
void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(255);
  
  pushMatrix();
  fill(255);
stroke(0);
rotate(radians(-10));
rect(250,270,140,20);
popMatrix();
pushMatrix();
fill(255);
stroke(0);
rotate(radians(10));
rect(110,180,140,20);
popMatrix();


  fill(0);
  float  x1 = map(mouseX, 0, width, 450, 50);
  ellipse(x1, 150, 100, 100);  
  float x2 = map(mouseX, 0, width, 50, 450);
  ellipse(x2, 300, 200, 200); 
fill(#3ec60f);
stroke(0);
triangle(300, 110, 200, 110, 250, 20);

fill(#b3b3b3);
stroke(0);
rect(150,400,80,30);
rect(270,400,80,30);



}


