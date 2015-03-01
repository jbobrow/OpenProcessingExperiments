
int x = 0;
int y = 0;
int a = random(250);
int b = random(250);
int c = random(250);
void setup() {
  background(a,b,c);
  size(700,700);
}

void draw() {
  noStroke();
  if(mouseY > 350) {
    x++;
    y++;
  } else {
    x--;
    y--;
  }
  if(x < 0 && y < 0) {
   x = 50;
   y = 50;
   }
   background(a,b,c);
  ellipseMode(CENTER);
  fill(mouseX,mouseX-mouseY,mouseX+mouseY);
  ellipse(350,350,x,y);
}
