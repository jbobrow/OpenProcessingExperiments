
size(400,400);
noFill();
for (int x=400; x>=0; x-=10) {
  for (int y=0; y<=400; y+=10) {
    strokeWeight(x/160);
    ellipse(x, y, 20, 20);  
  }
}
