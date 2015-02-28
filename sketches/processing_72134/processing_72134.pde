
void setup () {
  size (600, 600);
  background (255);
}

void draw () {
  for (int x=0; x<20; x=x+1) {
  for (int y=1; y<20; y=y+1) {
  for (int z=1; z<700; z=z+100){
    smooth ();
    float bl = x*60;
    float gr = y*60;
    fill (50,gr,bl);    
    pushMatrix ();
    
    translate (100*x,z);
    strokeWeight (4);
    ellipse (0,0,40,40);
    strokeWeight (1);
    ellipse (0,0,20,20);
    ellipse (0,50,10,10);
    ellipse (50,0,10,10);
    flower ();
    popMatrix ();
   
    }
  }
}
}

void flower () {
  pushMatrix ();
  translate (50,50);
  petal ();
  pushMatrix ();
  rotate (PI/2);
  petal ();
  popMatrix ();
  rotate (PI);
  petal ();
  rotate (PI/2);
  petal ();
  popMatrix ();
}

void petal () {
  beginShape ();
  curveVertex (0, 0);
  curveVertex (0, 0);
  curveVertex (-10, -20);
  curveVertex (10, -20);
  curveVertex (0, 0);
  curveVertex (0, 0);
  endShape ();
}
