


void setup () {
  size (500, 500);

  smooth ();
  noStroke ();
}
  
void draw () {

    background (mouseX/2, mouseY/2, random (255));

    for (int x=1; x<50; x++) {
      for (int y=1; y<50; y++) {
        noStroke ();
        fill (random(35,255), random(0,10), random(120,255), random (255));
        rect (random(x*20), random(y*20), mouseX/2,mouseY/2);
      }
    }
    for (int i=1; i<12; i++) {
      stroke (255,255,255);
      strokeWeight (2);
      float ax = random (0,width);
      float ay = random (0,height);
      float bx = random (0,width);
      float by = random (0,height);
      float cx = random (0,width);
      float cy = random (0,height);
        
      noFill ();
      triangle (ax,ay, bx,by, cx,cy);
    }
        
  }

  
void mousePressed () {

}


