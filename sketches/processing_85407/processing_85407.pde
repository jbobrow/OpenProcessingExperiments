
PImage[] myImageArray = new PImage[26];

void setup()
{
  size(640,360);
}

void draw()
{
  for (int i=0; i<myImageArray.length; i++){
  myImageArray[i] = loadImage(i + ".jpg");
}
 image(myImageArray[(int)random(26)], 0, 0);
}


