
size(800, 800);
smooth();

strokeWeight(2);
// for (start;test;update)
// for (start with this; stop when you get here; repeat this action)
for (int x=- 40; x<500+width;  x+= 40) {
  for (int y=  500; y<500+height; y+= 80) {
    rect( x^3, x+50, x+40 ,y+20);
    rect( y+10, x-40, 12*x, 5*y); 
    //rect( x-20, y*2, ,);
  }
}


