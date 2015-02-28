


void setup () {
  size (2000,2000);
  background (90,124,49);
}

void draw () {
  background (90,30,49);
 // float y = 100;
    
  for ( int x =0; x<3000; x+=30) {
    for (int y=0; y<1000; y+=30) {
    stroke (74,192,63);
    strokeWeight (6);
    smooth ();
    ellipse (x,y,25,25);
    fill (140,220,217);
    }
    
  }

//if (mousePressed) {
   //saveFrame ("pattern-###.tif");
}


