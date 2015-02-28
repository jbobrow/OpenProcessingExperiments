
int x=50;
void setup () {
  size(1000,1000);
  background(0);
  noStroke();
  colorMode(HSB);
}
void draw () {
fill(random(20,65),255,255);
  ellipse(x, 50, x, 100);
  fill(random(20,65),255,255);
  ellipse(width-x, 150, x, 100);
 fill(random(20,65),255,255);
  ellipse(x, 250, x, 100);
  fill(random(20,65),255,255);
  ellipse(width-x, 350, x, 100);
  fill(random(20,65),255,255);
  ellipse(x, 450, x, 100);
  fill(random(20,65),255,255);
  ellipse(width-x, 550, x,100);
  fill(random(20,65),255,255);
  ellipse(x, 650, x, 100);
  fill(random(20,65),255,255);
  ellipse(width-x, 750, x,100);
 fill(random(20,65),255,255);
  ellipse(x, 850, x, 100);
  fill(random(20,65),255,255);
  ellipse(width-x, 950, x, 100);
  x+=2;
}
