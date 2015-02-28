
size(800, 800);
smooth();

strokeWeight(2);
// for (start;test;update)
// for (start with this; stop when you get here; repeat this action)
for (int x=- 40; x<500+width;  x+= 300) {
  for (int y=  100; y<500+height; y+= 40) {
    //ellipse(y-20,   0,  x^2,  50);
    //ellipse(x-40, y++, x++, y/2); 
    ellipse(x-20, y-200, x, y+400);
  }
}

