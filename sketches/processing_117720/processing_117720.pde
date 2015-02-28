
int p1=0;
int p2=0;
int x=500;
int y=150;
int y2=160;
int z=3;
int z2=3;
int z3=3;
void setup() {
  size(1000, 700);
}

void draw() {
  background(0);
  fill(255);
  stroke(255);
  textSize(24);
  text("Computer: "+ p2, 400, 30);
  text("Player 1: " + p1, 600, 30);
  rect(900, mouseY-50, 30, 100);
  rect(100, y2, 30, 100);
  y2=y2+z3;
  if((y2+100>700) || (y2<0)) {
    y2=350;
  }
  if(y<350) {
    z3=-4;
  }
  if(y>350) {
    z3=4;
  }
  ellipse(x, y, 20, 20);
  x=x+z;
  y=y+z2;
  if((y>700) || (y<0)) {
    z2=z2*-1;
  }
  if((x>900) && (x<930) && (y>mouseY-50) && (y<mouseY+50)) {
    z=-3;
  }
  if((x>100) && (x<130) && (y>y2-50) && (y<y2+50)) {
    z=3;
  }
  if(x<0) {
    p1=p1+1;
    x=500;
    y=350;
    z=3;
  }
  if(x>1000) {
    p2=p2+1;
    x=500;
    y=350;
    z=-3;
  }
}


