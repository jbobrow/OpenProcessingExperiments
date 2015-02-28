
// Wong Wing Tung (53077176)
// 20-9-2013

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
// Separated the images

void setup() {
  size(800,800); // Sets the window size to 800 x 800 pixel
  img1 = loadImage("CMS3 ASS2_DANCE ST1.jpg");
  img2 = loadImage("CMS3 ASS2_DANCE ST2.jpg");
  img3 = loadImage("CMS3 ASS2_DANCE ST3.jpg");
  img4 = loadImage("CMS3 ASS2_DANCE ST4.jpg");
  img5 = loadImage("CMS3 ASS2_DANCE COVER1.jpg");
  
}

void draw() {
  background(img5); // Sets the img5 as background
  stroke(255);
  line(400,0,400,800);
  line(0,400,800,400); // Fill a white color
  noStroke();
  fill(255);
  
  if (mouseX < 400 && mouseY < 400){
  image(img1, 0, 0, 400, 400);
  
  } else if (mouseX > 400 && mouseY < 400) {
  image(img2, 400, 0, 400, 400);
  
    } else if (mouseX > 400 && mouseY > 400) {
  image(img3, 400, 400, 400, 400);

  } else if (mouseX < 400 && mouseY > 400) {
  image(img4, 0, 400, 400, 400);
  }
}

