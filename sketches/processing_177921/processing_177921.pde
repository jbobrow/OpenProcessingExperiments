
PImage herz;
PImage eulen_bg;

void setup()
{
  size(750, 512);
  herz = loadImage("herz_cropped2.png");
  eulen_bg = loadImage("eule_auf_weiss_ohne_herz2.jpg");
}

void draw()
{
  background(255);
  image(eulen_bg, 0, 0);

  pushMatrix();
  fill(255);
  ellipse(142, 297, 65, 65);
  ellipse(217, 355, 65, 65);
  ellipse(580, 380, 65, 65);
  ellipse(660, 325, 65, 65);
  fill(0);
  ellipse(122+mouseX*0.05, 290+mouseY*0.05, 10, 10);
  ellipse(197+mouseX*0.05, 348+mouseY*0.05, 10, 10);
  ellipse(560+mouseX*0.05, 373+mouseY*0.05, 10, 10);
  ellipse(640+mouseX*0.05, 318+mouseY*0.05, 10, 10);
  popMatrix();



  if (mouseX>=300 && mouseX <= 500 && mouseY>= 200 && mouseY <=300)
  {
    if (mousePressed == true)
    {
      tint(255, random(255), 204);
      image (herz, 0, 0);
      noTint();
    } else
    {

      tint(255, 126);
      image(herz, 0, 0);
      noTint();
    }
  }
  }




