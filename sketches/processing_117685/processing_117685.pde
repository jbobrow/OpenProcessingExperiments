
void setup() {
  size(480, 800);
}

int x=100;
int y2=0;
int z=1;
int z2=1;
int x2=240;
int y=400;
int s=0;

void draw() {
  background(255);
  drawBug();
  drawSpider();
  x=x+z;
  y2=y2+z2;
  if((x>480) || (x<0)) {
    z=z*-1;
  }
  if(y2>800) {
    y2=0;
  }
  fill(0);
  text("Score: "+ s, 10, 20);
  if(s<5) {
    text("Tap the bug", 10, 40);
  }
  z2=s;
}

void mousePressed() {
  line(mouseX, mouseY, x2, y);
  if((mouseX>x-12) && (mouseX<x+12) && (mouseY>y2-12) && (mouseY<y2+12)) {
    s=s+1;
  }
}

void drawSpider() {
  fill(0);
  ellipse(x2, y, 50, 50);
  stroke(0);
  line(x2-15, y-20, x2-50, y-40);
  line(x2-15, y, x2-50, y);
  line(x2-15, y+20, x2-50, y+40);
  line(x2+15, y-20, x2+50, y-40);
  line(x2+15, y, x2+50, y);
  line(x2+15, y+20, x2+50, y+40);
}

void drawBug() {
  fill(255);
  ellipse(x-20, y2, 30, 10);
  ellipse(x+20, y2, 30, 10);
  fill(255, 0, 0);
  ellipse(x, y2, 25, 25);
}



