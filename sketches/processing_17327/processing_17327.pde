
int xpos = 200;
int ypos = 300;

void setup() 

{
  size(400, 400);
  background(0);
}

void draw () {

  for (int j=0; j<400; j=j+7) {
    for (int i = 0; i<400; i=i+20) {
      xpos = i;
      ypos = j;
      stroke(255);
      fill(xpos,mouseX,255);
      triangle(xpos,ypos,7,2,ypos,xpos);
      
      stroke(255);
      fill(mouseY,ypos,255,100);
      triangle(ypos,xpos,398,393,xpos,ypos);
    }
  }
}

