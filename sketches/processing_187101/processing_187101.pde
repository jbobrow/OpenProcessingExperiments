
int x,y;
float xIntheBox;
float yIntheBox;
float cR, cG, cB;

void setup() {
  size (1200, 800);
}

void draw (){ 
  background (255);
  fill(255,24,42,40);
  rect(300, 100, 400, 150);
  

x= mouseX;
y= mouseY;

xIntheBox = map (x, 0, 1199, 310, 400);
yIntheBox = map (y, 0, 799, 110, 100+140);

ellipse (xIntheBox, yIntheBox, 20, 20);
}
