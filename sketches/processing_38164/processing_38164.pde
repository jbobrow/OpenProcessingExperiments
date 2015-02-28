
size(300, 300);
background(0);

int spacing = 25;
int margin = 25;
int elementSize = 25;

for (int y=margin; y <(height-margin); y+=spacing) {
  for (int x=margin; x < width-margin; x+=spacing) {
    ellipseMode(CENTER);
    noFill();
    stroke(18, 255, 3);
    ellipse (x, y, x+(elementSize), y+(elementSize));

    stroke(250, 13, 211);
    line(x, y, width, height);
  }
}

