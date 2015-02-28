
void setup()
{
  size (600, 800);
  background (0, 255, 30);
  smooth ();
  textAlign(CENTER);
  frameRate (10);
  textSize (36);
}

void draw ()
{
  fill (16, 113, 59, 75);
  rect (0, 0, width, height);


  textSize(mouseY/10);
  fill(255, 0, 0);



  text("Merry Christmas! And A Happy New Year.!", random (width), random(height));
}


