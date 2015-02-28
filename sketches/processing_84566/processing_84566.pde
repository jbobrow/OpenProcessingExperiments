
size (400, 400);
background(255);
noFill();
for (int x=400; x>=0; x-=15) {
  for (int y=0; y<=400; y+=15) {
    if (x>=50 && y>=50) {
    noFill();
    line (200,200, x, y);
    }
    ellipse(x, y, 20, 20);  
  }
}
