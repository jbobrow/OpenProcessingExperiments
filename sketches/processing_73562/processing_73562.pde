
int x= 200;
int y=200;
int r=60;

void setup () {
  size (400,400);
ellipseMode(RADIUS);
}

void draw () {
  background (200);
  float d= dist (mouseX,mouseY, x,y);
  if (d <r) {
    fill (255,0,0);
  } else{
    fill (255);
    
  }
  
  ellipse (x,y,r,r);
}
