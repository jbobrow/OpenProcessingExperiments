
size(200, 200);
background(255);
int i;
stroke(0);
for (i=-100;i<210;i+=15) {
  fill(0);
  noStroke();
  ellipse(i+100, i*i/120+100, 5, 5);

  if (i<70 && i>0) {
    fill(0, 0, 0, i);
    ellipse((i+30)*1.5, 75, 35, 35);
  }
}





