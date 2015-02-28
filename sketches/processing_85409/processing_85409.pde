
PImage[] myImageArray = new PImage[26];

void setup()
{
  for (int i=0; i<myImageArray.length; i++){
  myImageArray[i] = loadImage(i + ".jpg");
}
  size(720,480);
  frameRate(3);
}

void draw()
{
 image(myImageArray[(int)random(26)], 0, 0);
}


