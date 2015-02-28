
int xpos=0;
int ypos=0;

float c =80;

void setup()
{
  size(360, 360);
  background(0);
}


void draw() {
  for (int j=0; j<400; j=j+40) {
    ypos=j;

    for (int i=0; i<400; i=i+40) {
      xpos=i;
      
      fill(i,mouseX,mouseY,20);
      stroke(255);
      ellipse(xpos,ypos,c,c);
    }
  }
}
                
