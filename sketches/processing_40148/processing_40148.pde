
// the size/ number/ spacing of circles are random
// keep clicking around to change the randomness
// maybe you'll be able to guess the picture
// move the location of where you click to change the background color

PImage pic;

void setup() {
  size(300, 300); 
  pic = loadImage("bean.jpg");
  background(170, 160, 150);
  //background(pic);  //reveal if you want to see the picture
  noStroke();
  smooth();
}


void draw() {
}


void mouseClicked() {

  color mouseColor = pic.get(mouseX, mouseY); 
  background(mouseColor); //background color depends on color of image where mouse is clicked

  int dotsize = int(random(1, 30));
  //spacing relative to dotsize, which is random each click
  for (int y = 0; y <= width; y+=dotsize) { 
    for (int x = 0; x<= height; x+=dotsize) {

      color picColor = pic.get(x, y); //color is color from image
      fill(picColor);
      //size of circle is random within 'dotsize', so no overlapping circles
      myCircle ( x, y, random(dotsize));
    }
  }
}


void myCircle (float x, float y, float z) {
  ellipse(x, y, z, z);
}


