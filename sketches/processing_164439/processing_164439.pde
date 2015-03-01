
PImage bkg;
PImage paul;
PImage dance;
PImage pinkRibbon;
PImage keira;

void setup()
{
  size(1600,1200,P3D);
  bkg = loadImage("assissi.JPG");
  paul = loadImage("paulBunyan.jpg");
  dance = loadImage("thoughtOfYou.jpg");
  pinkRibbon = loadImage("pinkRibbon.jpg");
  keira = loadImage("keira.jpg");
}

void draw()
{
  bkgSetup();
  image(paul,200,200,225,300);
  image(dance,1100,700,256,144);
  image(pinkRibbon,200,700,150,200);
  image(keira,1100,200,180,240);
  dimenSphere();
  updatePixels();
}

void bkgSetup()
{
 loadPixels();
 bkg.loadPixels();
 for(int x = 0; x < bkg.width; x++)
  {
    for(int y = 0; y < (bkg.height)/(4/3); y++)
    {
      int loc = x + y * bkg.width;
      color c = bkg.pixels[loc];
        if ((mouseX < width/2) && (mouseY < height/2))
        {
          color adjust = color((red(c)*2.5)/1.5, green(c)/1.5, blue(c)/1.5);
          pixels[loc] = adjust;
        } else if ((mouseX < width/2) && (mouseY > height/2))
          {
            color adjust2 = color(red(c)/1.5, green(c)/1.5, (blue(c)*2.5)/1.5);
            pixels[loc] = adjust2;
          } else if ((mouseX > width/2) && (mouseY < height/2))
            {
              color adjust3 = color(red(c)/1.5, (green(c)*2.5)/1.5, blue(c)/1.5);
              pixels[loc] = adjust3;
            } else if ((mouseX > width/2) && (mouseY > height/2))
              {
                color adjust4 = color(red(c)/2, green(c)/2, blue(c)/2);
                pixels[loc] = adjust4;
              }
    }
  } 
}

void dimenSphere()
{
  strokeWeight(1);
  stroke(0,0,255);
  fill(244,0,0,90);
  translate(mouseX, mouseY, 200);
  sphere(60);
}


