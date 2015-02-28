
size(200, 200);
background(0);
int i;
stroke(0);
for (i=-100;i<210;i+=10) {
  noStroke();
  colorMode(HSB);

  rect(i+100, i*i/100+100, 10, 10);
  rect(-i+100, -i*i/100+100, 10, 10);
  rect(i*i/100+100, i+100, 10, 10);
  rect(i*i/-100+100, i+100, 10, -10);
}
