
int x = 0;
int y = 0;
int z = 0;
int a = 0;

void setup() {
  background(0,0,250);
  size(700,700);
}

void draw() {
    x++;
    y++;
  z =random(700);
  a =random(700);
  noFill();
  ellipseMode(CENTER);
  ellipse(a,z,x,y);
  if(mousePressed) {
    background(0,0,250);
  }
}
