
size(800,800);
smooth();
background(255);

for(int s=0; s<=height; s+=10)
{

noFill();
bezier(85+s, 20+s,   10, 10+s,   90, 90+s,   15, 80+s);
fill(255);
int steps = 10;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = bezierPoint(85, 10, 90, 15, t);
  float y = bezierPoint(20, 10, 90, 80, t);
  ellipse(x+s, y+s,   5, 5+s);
}
}

