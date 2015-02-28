
float xoff = 100;
float xincrement = 0.1; 

void setup() {
  size(800,500);
  background(560);
  frameRate(50);
  smooth();
  noStroke();
}
void draw()
{
  fill(0, 25);
  rect(120,45,width,height);
  
  float n = noise(xoff)*(width );
  
  xoff += xincrement;
  
  fill(222);
  rect(n,height/12,15,150);
  fill(222);
  rect(n,height/1.5,50,15);
  fill(150);
  ellipse(n,height/1,25,50);
}

