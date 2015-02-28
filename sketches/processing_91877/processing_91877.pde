
//Loris Uzan
//3/5/2013

int a=0;
int b=1;
float c=0;
float d=0.2;

void setup () {
  size(600, 600);
  strokeWeight(2);
  frameRate(30);
  smooth();
}

void draw () {
  background(255);
  stroke(0);
  for (int x=20; x<width; x+=20) {
    line(0, 0, x, height);
    line(width, 0, x, height);
    line(mouseX, mouseY+a, x, height);
    line(mouseX, mouseY+a, x, height);
    if (mousePressed) {
      a+=b;
      if (mouseY+a>height) {
        b=-1;
      }
      if (mouseY+a<0) {
        b=1;
      }
    }
  }
  for (int x=20; x<width; x+=20) {
    line(0, 600, x, 0);
    line(width, 600, x, 0);
    line(mouseX, mouseY+a, x, 0);
    line(mouseX, mouseY+a, x, 0);
    if (mousePressed) {
      a+=b;
      if (mouseY+a>height) {
        b=-1;
      }
      if (mouseY+a<0) {
        b=1;
      }
    }
    
    c=c+d;
    fill(255, 0, 0, c);
    ellipse(mouseX, mouseY+a, 100, 100);
    if (c>255) {
      d=-0.1;
    }
    if (c<0) {
      d=0.1;
    }
    fill(255, 0, 0);
    ellipse(mouseX, mouseY+a, 40, 40);
  }
}



