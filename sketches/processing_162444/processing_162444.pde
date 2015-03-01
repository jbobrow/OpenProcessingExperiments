
int x=250;
int y=400;
int my=12;
int mx=20;
void setup() {
  size(500, 500);
  frameRate(55);
}
void draw() {
  background(255);
  line(x,y,20,20);
  line(x+200,y,20,20);
  drawEyeBall(x, y);
  drawEyeBall(x+200,y);
  if (mousePressed==true) {
    x+=mx;
    y+=my;
    if (y>height||y<0) {
      my*=-1;
    }
    if (x>width||x<0) {
     mx*=-1;
    x=width/2;
     x=height/2;
   }
  }
}
void drawEyeBall(int x, int y) {

  fill(255);
  ellipse(x, y, 100, 100);
  line(x, y+50, x-20, y+80);
  line(x, y+50, x+10, y+80);
  fill(0);
  ellipse(x-17, y+80, 10, 10);
  fill(0);
  ellipse(x+12, y+80, 10, 10);

  fill(0);
  ellipse(x, y, 40, 40);
}

