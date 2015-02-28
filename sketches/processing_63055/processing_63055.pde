

size (400, 400);
smooth();
background(#E53010);

for (int y = 0; y<height; y+=33) {
  for (int x  = 0; x <width; x +=55) {

    stroke(#FF00C4);
    strokeWeight(y/33);
    point (x/5, y+1);
    point (x/3, y);
    point (x/2, y-x);
    point (x/3, x-y);


    strokeWeight(x/13);
    stroke(#E5CEC0);
    point (y, 2*x);
    point (y*1.2, y-x);
    point (y/2, y-x);
    point (x/3, y-x);
  }
}


