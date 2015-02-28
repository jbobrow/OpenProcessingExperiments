
//int space=5;

size(800, 800);
smooth();
background(255);
noFill();

for (int x=0; x<width; x=+5) {
  for (int y=0; y<width; y=+5) {
 stroke(0);
 bezier(30-x, 20-y,  80+x, 5+y,  80, 75,  30*x, 75*y);
translate(10, 10);
// rotate (10);
 
  }
}

