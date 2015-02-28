
int a = 0;
int b = 0;
int c = 600;
int d = 600;

void setup() {
  size (600,600);
  background (0);
  frameRate(75);
}

void draw() {
  if (mousePressed) {
  fill(255);
  ellipse (mouseX,mouseY,55,55);
  ellipse (mouseX-30,mouseY-30,40,40);
  ellipse (mouseX+30,mouseY-30,40,40);
  }

fill(random(0, 255), random(0, 255), random(0, 255));
rect (a,0,40,40);
   a = a+1;
rect (c,200,40,40);
   c = c-1;
rect (b,400,40,40);
   b = b+1;
rect (d,560,40,40);
   d = d-1;
loop();
}


