
/* Gavin Atkinson 2010
 Prints 3 images in a pattern, tints them depending on mouse postiion
 */


PImage andrew;
PImage jackie;
PImage rio;

void setup() {
  size(1000, 600);
  background(0);
  smooth();
  andrew = loadImage("Andrew.png");
  jackie = loadImage("Jackie.png");
  rio = loadImage("Rio.png");
}

void draw() {
  background (0);
  tint(mouseX/5, mouseY/5, 256);

  //ypos
  for(int ypos = 0; ypos < 650; ypos = ypos + 100) {

    //xpos
    for(int xpos = 0; xpos < 1020; xpos = xpos + 100) {
      image(rio, xpos-30, ypos-30, 75, 75);
      image(andrew, xpos, ypos, 100, 100);
      image(jackie, xpos+5, ypos+5, 50, 50);
      if (mousePressed) {
        save("friends.jpg");
      }
    }
  }
}


