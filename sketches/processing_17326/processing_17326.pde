
int xpos = 200;
int ypos = 300;

void setup() 

{
  size(400, 400);
  background(0);
}

void draw () {

  for (int j=0; j<400; j=j+7) {
    for (int i = 0; i<400; i=i+10) {
      xpos = i;
      ypos = j;
      noStroke();
      fill(xpos,mouseX,255);
      rect(xpos,ypos,10,10);
      stroke(0);
      fill(random(150));
      rect(xpos-10, ypos, 3, 3);
      fill(mouseY, random(255));
      rect(xpos-20, ypos, 7, 7);
    }
  }
}

