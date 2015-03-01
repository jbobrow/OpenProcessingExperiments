
void setup() {
  size(600, 600);
  background(0);
  smooth();
}
float x;
float y;

void mousePressed(){
    ellipse(mouseY, mouseX, random(50), random(50));
}
    
void draw()
{
  fill(255);
  int x = 0;
  int y = 0;
  float angle = 0;


  for (x = 0; x <= width; x+=20) {
    for (y = 0; y <= height; y+=20) {
      pushMatrix();
      ellipse(x, y, mouseY/10, mouseX/10);
      popMatrix();
    }
  }  
  
   
}

