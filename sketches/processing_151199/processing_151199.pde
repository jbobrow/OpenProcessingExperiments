
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/18971*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

PImage img1, img2, img3, img4, img5;
float x;

void setup () {
  size (780,523);
  img1 = loadImage ("1dali.png");
  img2 = loadImage ("2dali.png");
  img3 = loadImage ("3dali.png");
  img4 = loadImage ("4dali.png");
  img5 = loadImage ("5dali.png");
  imageMode (CENTER);
}

void draw () {
  float x = mouseX-300;
  translate (width/2,height/2);
  image (img5, x/100, 0);
  image (img4, x/200, 0);
  image (img3, x/50, 0);
  image (img2, x/25, 0);
  pushMatrix ();
  translate (-16,0);
  image (img1, x/15, 0);
  popMatrix ();
}


