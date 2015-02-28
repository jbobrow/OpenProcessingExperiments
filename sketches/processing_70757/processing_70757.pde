
PImage[] images = new PImage[24];

void setup ()  {
  size (500, 500);
  background(255, 255, 255);
  smooth();
  noStroke();

  for (int i = 0; i < images.length; i++)
  {
    images[i] = loadImage( i + ".jpg" );
  }
}

void draw () {
  int rndImgNum = 8 + round(random(1, 16));
  int normImgNum = round(random(1, 8));
  if (mouseX < 250) {frameRate(2);}
  else {frameRate(mouseX/25);};
  for (int x=1; x<=3; x++) {
    for (int y=1; y<=3; y++) {
      if (mouseX > 25) {
        float rndImgFloat = random(1, mouseX/21);
        int rndImg = round(rndImgFloat);
        image(images[rndImg], x*100, y*100 );
      }
      else {
        float rndImgFloat = random(0, mouseX/21);
        int rndImg = round(rndImgFloat);
        image(images[rndImg], x*100, y*100 );
      }
    }
  }
}


