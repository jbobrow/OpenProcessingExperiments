
int x=0;
void setup () {
  size(1000,1000);
  background(0);
  noStroke();
  colorMode(HSB);
}
void draw () {
fill(random(255),255,255);
  rect(x, random(1,100), x, random(1,200));
  fill(random(255),255,255);
  rect(random(width-x), random(300,400), random(x), random(1,200));
 fill(random(255),255,255);
  rect(x, 500, x, 200);
  fill(random(255),255,255);
  rect(width-x, 700, x, 200);
  fill(random(255),255,255);
  rect(x, 900, x, 200);
  fill(random(255),255,255);
  rect(width-x, 1100, x, 200);
  fill(random(255),255,255);
  rect(x, 1300, x, 200);
  fill(random(255),255,255);
  rect(width-x, 1500, x, 200);
 fill(random(255),255,255);
  rect(x, 1700, x, 200);
  fill(random(255),255,255);
  rect(random(width-x), 1900, random(x), 200);
  x+=2;
}



