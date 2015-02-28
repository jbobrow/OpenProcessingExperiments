
//Dots - pattern02

size(500, 500);
smooth();
 
strokeWeight(4);

for (int x=- 10; x<500+width;  x+= 12) {
  for (int y=  10; y<100+height; y+= 5) {

    point( y++, x-20);
    point( x-20, y*100);
    point (x/2, y-0);

  }
}


