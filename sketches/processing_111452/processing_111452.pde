
/* @pjs preload="festival.jpg"; */
PImage img;
void setup() {
  size(600, 600);
  img=loadImage("festival.jpg");
  noStroke();
  image(img, 4, 20);
  filter(THRESHOLD,0.85);
  frameRate(30);
}
void draw() {
  int ix= int(random(img.width));
  int iy = int(random(img.height));
  color c = img.get(ix,iy);
  fill(c, 100,20,10);
  int xgrid=int(random(-30, 50)) * 25;
  int ygrid =int(random(-3, 50)) * 25;
  rect (xgrid, ygrid, 200, 400);
  ellipse(xgrid,ygrid, 500,500);
}


