
PImage Hund_1; 
PImage Hund_2;
PImage Maus;

void setup()
{
  size (1000, 700);
  Hund_1=loadImage("Hund_1.jpg");
  Hund_2=loadImage ("Hund_2.jpg");
  Maus = loadImage ("Tennisball.png");
  smooth();
}
void draw()
{
  image (Hund_1, 0, 0);

  println (mouseX); 
  image (Maus, mouseX, mouseY);

  if (mousePressed )
  {
    image (Hund_2, 0, 0);
  }
}



