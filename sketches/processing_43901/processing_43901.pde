
int a=5;
int b=a*2;
int c=a*3;
int d=a*4;
int x, y;
boolean filler = true;


void setup() {
  size(600, 600);
  smooth();
  background(255);
}

void draw() {
  // square spiral strokeWeight
  strokeWeight(2);

  // left to right top lines
  if (a<height/2) {
    fill(0);
    line (a-5, a-5, width-a, a);
    a+=20;
  }
  // top to bottom right lines
  if (b<width/2) {
    fill(0);
    line (width-b+5, b-5, width-b, height-b);
    b+=20;
  }

  // right to left bottom lines
  if (c<height/2) {
    fill(0);
    line (width-c+5, height-c+5, c, height-c);
    c+=20;
  }

  // bottom to top left lines
  if (d<width/2) {
    fill(0);
    line (d-5, height-d+5, d, d);
    d+=20;
  }

  // horizontal line at height/2
  if (mousePressed==true) {

    if (filler) 
      fill(0);
    else
      noFill();

    ellipse(x, height/2, 20, 20);

    if (x<width/2) {
      x++;

      if (x==(width/2)-1) {
        fill(0);
        ellipseMode(CENTER);
        ellipse(width/2, height/2, 100, 100);
      }
    }
  }
}





