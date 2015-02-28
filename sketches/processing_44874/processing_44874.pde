
float spin = 0.0;

void setup() 
{
  size(820, 650, P3D);
  }
 int value = 0;
 
void draw() 
{
  background(5, 22, 85);
    fill (value);
  for (int y = 50; y <= height-20; y += 10) {
  for (int x = 50; x <= width-20; x += 10) {
    ellipse(x, y, 5, 5);
  }
  spin += 0.005;
  
  
  translate(width/4, height/4, 0);
  rotateX(PI/9);
  rotateY(PI/4 + spin);
  ellipse (75, 80, 150, 100);
  sphere (80);
}
}

void mouseClicked () {
  if (value == 0) {
    value = 85;
  } else {
    value = 255;
  }
}








 


