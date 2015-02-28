
size(800, 800);
smooth();

strokeWeight(2);
// for (start;test;update)
// for (start with this; stop when you get here; repeat this action)
for (int x=- 40; x<500+width;  x+= 30) {
  for (int y=  40; y<500+height; y+= 40) {
    //line(i-20,   0,  i^2,  50);
    line(x+40, y-100, x*5, y-150); 
    line(x-20, y-200, x^2, y-400);
  }
}

