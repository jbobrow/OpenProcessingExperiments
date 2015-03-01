
private PImage RotatingImage;
private int rotateCounter;

/**
* This is an exampe of a rotating image. Please take the time to
* learn from it, if you will. Take the code, because anyone can
* make this anyway.
*
* By the way, you may have seen rotating circles, but this is
* different! It shows you how to rotate an image using the
* position as the center.
* 
* @author Art Margatroid
*/

public void setup()
{
  size(200, 200);

  RotatingImage = loadImage("RedSpinner.png");
}

public void draw()
{
  background(0);

  DrawRotatingObject(100, 100);
  DrawRotatingObject(50, 50);
  DrawRotatingObject(80, 50);

  if (rotateCounter < 360)
  {
    ++rotateCounter;
  }
  else
  {
    rotateCounter = 0;
  }
}

public void DrawRotatingObject(float PositionX, float PositionY)
{
  // Translates it to specific location.
  //
  translate(PositionX, PositionX);

  // Rotates the object at an angle
  //
  rotate((float) (Math.toRadians(rotateCounter)));

  // Displays the image, with the image pushed back to put the center at the center. 
  //
  image(RotatingImage, -(RotatingImage.width / 2), -(RotatingImage.height / 2));

  // Last two lines reverse the effects so that the code can be reusable for
  // your own projects.
  //
  rotate((float) -(Math.toRadians(rotateCounter)));
  translate(-PositionX, -PositionX);
}


