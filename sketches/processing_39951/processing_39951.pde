
size(800, 800);
smooth();

strokeWeight(2);
// for (start;test;update)
// for (start with this; stop when you get here; repeat this action)
for (int x=- 40; x<500+width;  x+= 2) {
  for (int y=  200; y<500+height; y+= 4) {
    point( x^2, x+50);
    point( y++, x-40); 
    point( x-20, y*2);
  }
}


