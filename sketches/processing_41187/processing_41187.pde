
long x;
long y;
int a;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {

  if (mousePressed) {
    a=0;
    noStroke();
    fill(160,20);
    triangle(mouseX, mouseY, mouseX+x+2, mouseY+y+2, mouseX+x+y, mouseY+y+x);
  }
  else {
    if (a != 255) {
      a=a+1;
      noStroke();
      fill(255,a);
      rect(0,0,400,400);
    }
  }
  x=mouseX/2;
  y=mouseY/2;

  
}
                
