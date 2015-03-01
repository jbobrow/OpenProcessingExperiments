
void setup () {
size(800,800);
noStroke();
background(255);
}

void draw () {
 
 for (int b = 0; b < 700; b=b+5) {
    for ( int c = 0; c < 700; c=c+10) {
      fill(b, c, 255, 10);
      rect (c*500, b, random(0, 100), random (0, 100));
    }
  }
  
   for (int d = 0; d < 800; d=d++) {
    for ( int e = 0; e < 800; e=d++) {
      fill(e, d, 255, 10);
      ellipse (e, d, random(0, 250), random (0, 250));
    }
  }
  
  ///this one doesn't do anything? 
  for (int r = 0; r < 100; r=r++) {
    for ( int t = 0; t < 100; t=r++) {
      fill(t, r, 255, 10);
      ellipse (t, r, random(0, 250), random (0, 250));
    }
  }
   
}
