
/*@pjs preload="inu.png";*/
PImage img;
int x=20;
int xx=20;
int y=20;
int yy=20;

size(400,400);
background(166,82,63);

img = loadImage("inu.png");
tint(224,132,132);
image(img,310,330,30,30);
img = loadImage("inu.png");
tint(224,132,132);
image(img,335,300,30,30);
img = loadImage("inu.png");
tint(224,132,132);
image(img,310,270,30,30);

while(x < 400) {
  strokeWeight(10); 
  stroke(136,111,67);
  noFill();
  ellipse(x,20, 20,20);
  x = x + 20;
}

while(xx < 400) {
  strokeWeight(10); 
  stroke(136,111,67);
  noFill();
  ellipse(xx,380, 20,20);
  xx = xx + 20;
}

while(y < 400) {
  strokeWeight(10); 
  stroke(136,111,67);
  noFill();
  ellipse(20,y, 20,20);
  y = y + 20;
}

while(yy < 400) {
  strokeWeight(10); 
  stroke(136,111,67);
  noFill();
  ellipse(380,yy, 20,20);
  yy = yy + 20;
}


