
/*
Pearlyn Lii
 ID 3 - Spring 2013
 1/31/13
 */

//setup -----

size(800, 800);
smooth();
noFill();
background(21, 18, 37);
stroke(255);

//draw -----

strokeWeight(2);
for (int a=0;a<height;a+=120) {
  for (int b=0;b<width;b+=120) {
    rect(b, a, 0, 0);
  }
}

strokeWeight(0.5);
for (int a=0;a<height;a+=50) {
  for (int b=0;b<width;b+=50) {
    triangle(b, a, width, 0, a, b);
    rotate(radians(60));
  }
}

strokeWeight(0.2);
for (int a=1;a<height;a+=20) {
  for (int b=2;b<width;b+=20) {
    line(b, a, 0, height);
  }
}

strokeWeight(0.3);
for (int a=0;a<height;a+=60) {
  for (int b=0;b<width;b+=60) {
   triangle(a, b, b/2, a, 20, b);
  }
}

stroke(0);
strokeWeight(0.8);
for (int a=10;a<height;a+=30) {
  for (int b=5;b<width;b+=10) {
    triangle(a, b, width, 0, b, b);
  }
}

stroke(0);
strokeWeight(0.8);
for (int a=1;a<height;a+=30) {
  for (int b=5;b<width;b+=10) {
    point(a, b);
    point(b, a);
  }}


