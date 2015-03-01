
float xoff = 0.0;
float xincrement = 0.01; 
float yoff = 50.0;
float yincrement = 0.01; 

void setup() {
  size(640, 360);
  background(0);
  noStroke();
}

void draw()
{
  
  float x = noise(xoff)*width;
  float y = noise(yoff)*height;
  
  xoff += xincrement;
  yoff += yincrement;
  
  fill(200);
  stroke(255);
  ellipse(x,y, 64, 64);
}
