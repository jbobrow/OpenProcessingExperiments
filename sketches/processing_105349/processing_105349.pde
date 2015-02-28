
//define x,y,r,l

int r=10;
int l=500;
float x=250;
float y=250;
int a;

void setup() {
  size(500, 500);
  a=-1;
}

void draw() {
  background(255);
  ellipse(x, y, r, r);
  y=y+a;
  
  if (y==r/2 && a==-1 ) {
    a=-1*a;
  }

  else if (y==l-r/2 && a==1) {
    a=-1*a;
  }
 
}



