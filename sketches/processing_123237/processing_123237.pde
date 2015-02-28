
float x;
float y;
float size;

void setup(){
  size (500, 500);
  stroke(255);
  y = height * 0.5;
  x = width * 0.5;
  size = 10;
  frameRate(100);
  
}
void draw(){
  background(0);
 
  size = size + 10;
  
  fill(0);
  ellipse(x, y, size, size);
  ellipse(x, y, size * 0.5, size * 0.5);
  ellipse(x, y, size * 0.25, size * 0.25);
}



