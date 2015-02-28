
PImage img;
PImage img1;

int opacity;

void setup () {

  size (400, 400);
  img= loadImage ("van_gough_bacon_2.jpg");
  img1 = loadImage ("Bild 5.jpg");
}

void draw () {

  image (img, 0, 0);


  tint(0, 153, mouseX);
}


