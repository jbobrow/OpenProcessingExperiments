
size(500, 300);
// smooth the lines out
smooth();
fill(90);
// background color red
background(0);
// remove outlines
noStroke();



int number = 31;

ellipseMode(CORNER);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i*2.5, j, 0);
    point(i, j);
  }
}

PImage img;
img=loadImage("picture.jpg");

for (int i = 0; i<15; i++) {
  for (int j = 0; j<number; j++) {
    if ((i+j) % 2 == 0) {
      fill(cos(i)*number + sin(j)*number, cos(number), cos(i)*number*sin(j)*number);
    }
    else {
      fill((cos(i)*50*sin(j)*1)%255);
    }
    image(img, i*20, 0);
 
  }
}


