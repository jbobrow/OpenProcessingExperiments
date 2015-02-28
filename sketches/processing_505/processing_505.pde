
void setup () {
size (400,400);
background (0);
}

void draw () {
  for (int x=0; x<400; x++) {
  for (int y=0; y<400; y++) {
    fill (0, 95*y, 95+y);
    rect (x*x*2,y*5*x,x*y*8,y*x*4);
 
}
 }
}

