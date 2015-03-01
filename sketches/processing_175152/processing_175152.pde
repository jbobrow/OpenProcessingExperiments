
int circleX=200;
int circleY=200;

void setup () {
size(400,400);
}

void draw () {
ellipse(circleX,circleY,50,50);
if(keyPressed && keyCode == UP) {
cicleY+=1;
  }
if(keyPressed && keyCode == DOWN) {
cicleY=circleY-3;
  }
if(keyPressed && keyCode == RIGHT) {
cicleX=circleX-1;
  }
if(keyPressed && keyCode == LEFT) {
cicleX+=1;
  }
}
