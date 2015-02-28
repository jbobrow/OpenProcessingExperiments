
PImage pic;

void setup ()
{
  size (600,600,P3D);
  pic = loadImage ("image.jpg");
  imageMode (CENTER);
}

void draw ()
{
  background (0);
  translate (300,300,-200);
  rotateX (radians (frameCount));
  rotateY (radians (frameCount));
  rotateZ (radians (frameCount));
  image (pic, 0,0,100,100);
}



