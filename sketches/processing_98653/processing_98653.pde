
int y = 0;
boolean moveup = true;

void setup() {
  size(640,640);
}

void draw() {
  background(255);
  rect(width/2,y,25,25);
  fill(#F71111);
  if(moveup) {
    y+=10;
  } else {
    y-=10;
  }
  if(y>width-15){
    moveup = false;
  } else if (y<15){
    moveup = true;
  }
  }
