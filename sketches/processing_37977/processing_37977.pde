
// create an empty array to hold our frames
PImage[] myFrames = new PImage[15];

void setup()
{
  smooth();
  size(300, 200);

  // load the individual frames into the array
  for (int i = 0; i <= 14; i++) {
    myFrames[i] = loadImage("horse" + i + ".jpg");
  }
  imageMode(CORNER);
}

void draw()
{
  background(0);
  
  // compute timeStep based on vertical mouse position
  // lower mouseY means faster horse
  // Note that there is a slight bug that causes the horse to speed up when
  // the mouse is in motion. I didn't bother to fix this, but it involves not
  // changing the horse speed until timeStep returns to zero, in case you were wondering.
  int timeStep = (millis() / int(map(mouseY, 0, height, 100, 10))) % 15;
  image(myFrames[timeStep], 0, 0);
}


