
int x;
int y;
int a;
int b;
int count = 0;

void setup() {
  size(400, 300);
  x = width/2;
  y = height/2;
  a = width/2;
  b = height/2;
  background(0);
  stroke(14,121,149,100);
  fill(104,14,149,100);
}

void draw() {
  if (count <= 3500) {
  ellipse(x,y,2,2);
  ellipse(a,b,2,2);
  ellipse(x,b,2,2);
  ellipse(a,y,2,2);
  float choice = random(4);
  if (choice <= 1) {
    x = x+2;
    a = a-2;
  }
  if ((choice > 1) && (choice <= 2)) {
    x = x-2;
    a = a+2;
  }
  if ((choice > 2) && (choice <= 3)) {
    y = y+2;
    b = b-2;
  }
  if ((choice > 3) && (choice <= 4)) {
    y = y-2;
    b = b+2;
  }
  count++;
 } else {
   background(0);
   x=width/2;
   y=height/2;
   a=width/2;
   b=height/2;
   count=0;
  }
}


