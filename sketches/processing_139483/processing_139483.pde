
/*
Jaeseong Yi
 March 16 2014
 Creative Computing Section B
 assignment 1
 Benjamin Bacon
 */


int a = 0;
int a1=200;
int a2=400;
int a3=600;
int b1=200;
int b2=400;
int b3=600;
int c1 = int(random(0, 255));
int c2 = int(random(0, 255));
int c3 = int(random(0, 255));
int s = int(random(0, 100));
int v = int(random(0, 50));

size(800, 800);
background(c1, c2, c3);


while (a<=width) {

  stroke(c2, c3, c1);
  fill(c1, c2, c3);
  ellipse(a, a+10, s, s);
  a+=10;
}

while (a1<=width) {

  stroke(c2, c3, c1);
  fill(c1, c2, c3);
  ellipse(a1, a1-200, s, s);
  a1+=10;
}

while (a2<=width) {

  stroke(c2, c3, c1);
  fill(c1, c2, c3);
  ellipse(a2, a2-400, s, s);
  a2+=10;
}

while (a3<=width) {

  stroke(c2, c3, c1);
  fill(c1, c2, c3);
  ellipse(a3, a3-600, s, s);
  a3+=10;
}

while (b1<=height) {

  stroke(c2, c3, c1);
  fill(c1, c2, c3);
  ellipse(b1-200, b1, s, s);
  b1+=10;
}

while (b2<=height) {

  stroke(c2, c3, c1);
  fill(c1, c2, c3);
  ellipse(b2-400, b2, s, s);
  b2+=10;
}

while (b3<=height) {

  stroke(c2, c3, c1);
  fill(c1, c2, c3);
  ellipse(b3-600, b3, s, s);
  b3+=10;
}




