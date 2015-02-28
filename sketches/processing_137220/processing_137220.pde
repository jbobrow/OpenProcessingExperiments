
/* @pjs font="Segoe.vlw", font="Times.vlw", font="Lucida.vlw", font="Kristen.vlw", font="Juice.vlw", font="Garamond.vlw", font="DaunPenh.vlw"; */
int numFonts = 7;
PFont[] fonts = new PFont[numFonts];
int fontIndex = 0;
float timer2 = 0.0;

float timer = 0.0;
PImage City;
PImage Screen;
PImage Man;
int numFrames = 7;
PImage[] images = new PImage[numFrames];
int backgroundIndex = 0;

float Y = 0;
float Yspeed = 3;

void setup()
{
  size(500, 500);
  frameRate(30);
  
  fonts[0] = loadFont("Segoe.vlw");
  fonts[1] = loadFont("Times.vlw");
  fonts[2] = loadFont("Lucida.vlw");
  fonts[3] = loadFont("Kristen.vlw");
  fonts[4] = loadFont("Juice.vlw");
  fonts[5] = loadFont("Garamond.vlw");
  fonts[6] = loadFont("DaunPenh.vlw");
  
  Man = requestImage("man.jpg");
  City = requestImage("citystreet.jpg");
  Screen = requestImage("screen.JPG");
  
  images[0] = requestImage("Anonymous.jpg");
  images[1] = requestImage("champion.jpg");
  images[2] = requestImage("internet.jpg");
  images[3] = requestImage("starcraft.jpg");
  images[4] = requestImage("streaming.jpg");
  images[5] = requestImage("trollface.png");
  images[6] = requestImage("tauren.jpg");
  

}

void draw()
{
  
  image(Screen, 0, 0, width/2, height, 0, 0, width, height);
  image(City, 250, 0, width/2, height, 0, 0, 250, 400);
  image(Man, 325, 250, 100, 100);
  
  timer = timer + (1.0 / 30.0);
  timer2 = timer2 + (1.0 / 30.0);
  
  if (timer > 1)
  {
    backgroundIndex += 1;
    timer = 0;
  }
  if (backgroundIndex < 0 || backgroundIndex >= images.length)
  {
    backgroundIndex = 0;
  }
  image(images[backgroundIndex], 100, 250, 100, 100);
  
  pushMatrix();
  if (timer2 > 1)
  {
    fontIndex += 1;
    timer2 = 0;
  }
  if (fontIndex < 0 || fontIndex >= fonts.length)
  {
    fontIndex = 0;
  }
  textFont(fonts[fontIndex], 25);
  
  fill(0);
  text("Who knows ?", 25, 475);
  popMatrix();
  
  pushMatrix();
  textFont(fonts[1], 25);
  fill(255);
  text("You...", 350, 100);
  popMatrix();
  
  pushMatrix();
  
  if (Y > height)
  {
    Yspeed = -3;
  }
   if (Y < 0)
  {
    Yspeed = 3;
  }
  
  Y += Yspeed;
  
  textFont(fonts[1], 30);
  fill(255);
  text("<-->", 220, Y);
  popMatrix();
  
  

}


