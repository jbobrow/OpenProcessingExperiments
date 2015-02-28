
int z;
int x;
int a;
int b;
int m;
int n;

void setup() {
  size(300, 300);
  smooth();
  background (250, 211, 15);
  noFill();

  for(z=30; z < width; z=z+30) {
    for(x=30; x < height; x=x+30) {
      ellipse(z, x, 60, 60);
    }
  }
  
  for(z=30; z < width; z=z+60) {
    for(x=30; x < height; x=x+60) {
      ellipse(z, x, 60, 60);
    }
  }
  
  for(a=0; a <= width; a=a+60) {
    for(b=0; b <= height; b=b+60) {
      ellipse(a, b, 90, 90);
    }
  }
  
}

void draw() {

  int r = mouseY;
  
  for(m=60; m < width; m=m+60) {
    for(n=30; n < height; n=n+60) {
      ellipse(m, n, 6, 6);
    }
  }
   
  if ((r < 150) && (mousePressed)) {
    fill(250, 211, 15);
  } else {
     fill(0);
  } 
  
}

