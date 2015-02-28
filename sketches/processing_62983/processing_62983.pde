
//custom - pattern01

size(500,500);
smooth();
background(255);
 
for(int s=0; s<=height; s+=10)
{
 
noFill();
bezier(35+s, 200+s,   80, 59+s,   50, 60+s,   75, 20+s);
fill(255);
int steps = 90;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = bezierPoint(35, 20, 80, 60, t);
  float y = bezierPoint(90, 40, 70, 10, t);
  ellipse(x+t, y+s,   2, 10+s);
}
}


