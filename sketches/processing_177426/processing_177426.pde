

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;


int frame;

void setup () {

  size (700, 480);

  frameRate (6);
  

  frame = 1;


  img1 = loadImage ("1.jpg");
  img2 = loadImage ("2.jpg");
  img3 = loadImage ("3.jpg");
  img4 = loadImage ("4.jpg");
  img5 = loadImage ("5.jpg");
  img6 = loadImage ("6.jpg");
  img7 = loadImage ("7.jpg");
}

void draw () {

  
  if (frame > 4) {
    frame = 1;
  }


  if (frame == 1) {
    image (img1, 0, 0);
  }
  if (frame == 2) {
    image (img2, 0, 0);
  }
  if (frame == 3) {
    image (img3, 0, 0);
  }
  if (frame == 4) {
    image (img4, 0, 0);
  }
  if (frame == 1) {
    image (img5, 0, 0);
  }
  if (frame == 1) {
    image (img6, 0, 0);
  }
  if (frame == 1) {
    image (img7, 0, 0);
  }



  frame = frame + 1;
}



