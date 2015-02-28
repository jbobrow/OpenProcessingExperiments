
int x;
int y;

int r;
int g;
int b;

boolean colorchange;



void setup () {
  noStroke ();
  
  size (400,400);
  background (255);
  r=200;
  g=255;
  b=230;

colorchange= false;

}

void draw () {
  x= mouseX;
  y= mouseY;
  
  fill (r,g,b);
  


if (mousePressed==true) {


  ellipse (x,y, x/2, y/2);
  if (!colorchange) {
  r--;
  g--;
  b--;
   }
  }
}
