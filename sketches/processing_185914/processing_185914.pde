
void setup() 
{
  size(1000, 640); 
  noStroke();

}

void draw() {  
 background(255) ;
 

  ellipse(mouseX, mouseY, mouseY/2 +10, mouseY/2 +10);
  fill(0,0,255);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  ellipse(inverseX, inverseY, (inverseY/2 +10), (inverseY/2 +10));
  fill (0,255,0);
}

