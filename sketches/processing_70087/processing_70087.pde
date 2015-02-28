
int i;
int spaceX = 50;


void setup () {
  size(500, 500);
  smooth();
}

void draw() {
  background (255);
  
  for (i=0; i<=10; i++)
  {
    line(i*spaceX, 0, mouseX, mouseY);
    line(i*spaceX, 500, mouseX, mouseY);
  }
}
