
float r;


void setup () {
  size (600,300);
  translate( width/2, height/2);
  smooth();
  noStroke();
}

void draw () {

  fill (random (200,255));
  r= map (mouseX,0,width,10,320);

  rectMode (CENTER);

  if (mousePressed) {
    rect (width/2,height/2, width,r);
  }
  else {
    rect (150,150, r,height);
    rect (450,150, width/2-r,height);
  }


}




