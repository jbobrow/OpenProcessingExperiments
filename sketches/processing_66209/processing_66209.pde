
int x = 200;
int y = 100;
int prevY = 99;

void setup(){
  size(400, 400);
  background(147, 25, 25);
  noStroke();
  ellipseMode(CENTER);
}
void draw(){
  background(147, 25, 25);
  fill(27, 147, 147);
  ellipse(x, y, 20, 20);
  
  if(y>0 && y<400){
    if (prevY < y) {
    prevY = y;
    y++;
  }
    if (prevY > y) {
    prevY = y;
    y--;
  }
  }
  if (y==400){
    prevY = y;
    y--;
  }
  if (y==0){
    prevY = y;
    y++;
  }
}

