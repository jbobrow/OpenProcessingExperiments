
int x=0, y=0;
size(400, 400);
background(0);
smooth();
noStroke();
for (x=0;x<width+20;x=x+40) {
  for (y=0;y<=height+20;y=y+40) {
    fill(0);
    rect(x, y, 20, 20);
    fill(255);
    rect(x+20, y, 20, 20);
    fill(255);
    rect(x, y+20, 20, 20);
    fill(0);
    rect(x+20, y+20, 20, 20);
  }
}
