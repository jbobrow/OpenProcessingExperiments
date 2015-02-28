
float x=0;
boolean rev = true;

void setup () {
  
  size (400,400);
  
  smooth ();
}

void draw () {
  
  background (0,255,255);
 fill (random (255),random (255), random (255));
  
  ellipse (200,x,50,50);
  
  if (x==0+25) {
    rev = true;
  }
  else if (x==width-25) {
    rev = false;
  }
  
  if (rev) {
    x+=5;
  }
  if (rev == false) {
    x-=5;
  }  
  
  
}

