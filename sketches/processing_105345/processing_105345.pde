
//define x,y,r,l

int r=10;
int l=500;
int a, b;
int vx, vy;



void setup() {
  size(500, 500);
  vx=int(random(0, 500));
  vy=int(random(0, 500));
  a=-1;
  b=-1;
}

void draw() {
  background(255);
  ellipse(vx, vy, r, r);
  vx=vx+a;
  vy=vy+b;

  if (vy==r/2 && b==-1 ) {
    b=1;
  }

  else if (vy==l-r/2 && b==1) {
    b=-1*b;
  }
  else if (vx==r/2 && a==-1 ) {
    a=-1*a;
  }

  else if (vx==l-r/2 && a==1) {
    a=-1*a;
  }
}



