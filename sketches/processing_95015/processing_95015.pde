
int x=50;
int y=50;
void setup() {
  size (100, 100);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  //hat
  fill(0);
  triangle(x-40, y-10, x+40, y-10, x+40, y-20);
  quad (x-10, y-35, x+30, y-35, x+30, y-10, x-20, y-10);
  //face
  fill(251, 192, 166);
  triangle(x-20, y-10, x-20, y+20, x-30, y+20);
  quad(x-20, y-10, x-20, y+44, x+30, y+17, x+30, y-10);
  //eye
  fill(255);
  ellipse (x-16, y+2, 10, 10);
  //iris
  //remap x coordinate
  if (mouseX < x-16) {
    float eyeX=map(mouseX, 0, width, x-16-4, x-16);
    fill(0);
    ellipse(eyeX, y+2, 3, 3); 
  } else if (mouseX > x-16) {
    float eyeX=map(mouseX, 0, width, x-16, x-16+4);
    fill(0);
    ellipse(eyeX, y+2, 3, 3);
  } else {
    fill(0);
    ellipse(x-16, y+2, 3, 3);
    //eyelid
  } if (mousePressed) {
    arc (x-16, y+2, 10, 10, -PI,0);
}
    
}
