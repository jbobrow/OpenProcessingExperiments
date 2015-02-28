
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/132618*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int x=0;
void setup () {
  size(1000,1000);
  background(0);
  noStroke();
  colorMode(HSB);
}
void draw () {
fill(random(255),255,255);
  ellipse(x, 100, x, 200);
  fill(random(255),255,255);
  ellipse(width-x, 300, x, 200);
 fill(random(255),255,255);
  ellipse(x, 500, x, 200);
  fill(random(255),255,255);
  ellipse(width-x, 700, x, 200);
  fill(random(255),255,255);
  ellipse(x, 900, x, 200);
  fill(random(255),255,255);
  ellipse(width-x, 1100, x, 200);
  fill(random(255),255,255);
  ellipse(x, 1300, x, 200);
  fill(random(255),255,255);
  ellipse(width-x, 1500, x, 200);
 fill(random(255),255,255);
  ellipse(x, 1700, x, 200);
  fill(random(255),255,255);
  ellipse(width-x, 1900, x, 200);
  x+=2;
}


