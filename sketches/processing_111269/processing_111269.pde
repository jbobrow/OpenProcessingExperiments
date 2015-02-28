
/* @pjs preload="kitty.jpg"; */
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
PImage img;
img=loadImage("kitty.jpg");

for (int i = 0; i<15; i++) {
  for (int j = 0; j<number; j++) {
    if ((i+j) % 2 == 0) {
      fill(cos(i)*number + sin(j)*number, cos(number), cos(i)*number*sin(j)*number);
    }
    else {
      fill((cos(i)*50*sin(j)*1)%255);
    }
    image(img, i*20, 0);
    tint(155,50,120,225);
   
  }
}



