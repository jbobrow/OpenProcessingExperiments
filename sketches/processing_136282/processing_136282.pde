
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/132618*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int x=50;
void setup () {
  size(1000,1000);
  background(255);
  noStroke();
  smooth();
  colorMode(HSB);
}
void draw () {
fill(random(0,255));
  ellipse(x, 50, x, 100);
  fill(random(0,255));
  ellipse(width-x, 150, x, 350);
    fill(random(0,255));
  ellipse(width-x, 150, x, 10);
 fill(random(0,255));
  ellipse(x, 250, x, 100);
  fill(random(0,255));
  ellipse(width-x, 350, x, 100);
      fill(random(0,255));
  ellipse(width-x, 150, x, 10);
  fill(random(0,255));
  ellipse(x, 450, x, 100);
  fill(random(0,255));
  ellipse(width-x, 550, x,15);
  fill(random(0,255));
  ellipse(x, 650, x, 100);
  fill(random(0,255));
  ellipse(width-x, 750, x, 250);
 fill(random(0,255));
  ellipse(x, 850, x, 100);
  fill(random(0,255));
  ellipse(width-x, 950, x, 10);
  x+=100;
}


