
void setup()
{
  size(600, 600);
}


void draw() {  
  background(70);
  for (int i= 30; i<600; i+=100 ) {
    for (int j=30; j<600; j+=100) {
      float r=60;
      float x=20;
      float y=20;

      if (dist(mouseX, mouseY, x+i, y+j) < r/2)
      {
        fill(250, 90, 20);
        r=80;
      }
      else {
        fill(20, 100, 220);
      }
      ellipse(x+i, y+j, r, r);
    }
  }
}



