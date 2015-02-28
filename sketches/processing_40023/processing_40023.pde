
size (800, 800);
smooth ();

//Variables
int e= 50;

for (int y = -10; y<width; y += e-10) {
  for (int x= -10; x <height; x += e-10) {
    fill(random(255));
    stroke (5);
    ellipse (x, y, e, e);
  }
}


for (int y = -10; y<width; y += e) {
  for (int x= -10; x <height; x += e) {
    noFill();
    stroke (5);
    ellipse (x, y, e, e);
  }
}


