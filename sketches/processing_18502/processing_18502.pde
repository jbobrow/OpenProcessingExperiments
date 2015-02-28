
void setup() {
  size (300,300);
}

void draw () {
  background (255);
  smooth ();

  int x=120;

  //red circle
  fill (255,0,0);
  ellipse (x,150,50,50);

  //yellow shape
  fill (255,255,0);
  ellipse (x+50,150,50,50);

  //blue shape
  fill (0,0,255);
  ellipse (x*2,150,50,50);

  //green shape
  fill (0,255,0);
  ellipse (x-50,150,50,50);

  //orange shape
  fill (255,165,0);
  ellipse (x/2,150,50,50);

  //purple shape
  fill (223,0,255);
  ellipse (mouseX, 150,50,50);
}


