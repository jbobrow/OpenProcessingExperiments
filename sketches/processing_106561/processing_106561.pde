
int x=20;
int y=20;

int dx=0;
int dy=5;

void setup() {  //setup function called initially, only once
  size(250, 250);
}

void draw() {  //draw function loops 

background (255,255,255)

fill (255,215,0)
ellipse (x,y,20,20);

if (y>250) {dy=-dy}
y=y+dy

if (y<0) {dy=-dy}
 


if
(mousePressed) {
mouseX=x
mouseY=y
}
}
