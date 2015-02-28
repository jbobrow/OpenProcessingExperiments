
PImage img;
PFont chiller;
int timer = 0;
int dim;

void setup()
{
  size(301,167);
  dim  = width/2;
  background(255);
  img = loadImage("Heavy metal.png");
  chiller = createFont("Chiller" ,32);
  noStroke();
  frameRate (30);
}


void draw()
{
  image(img, 0, 0);
  fill(255, 0, 0);
  for (int x = 0; x <= width; x+=dim)
  {
    drawGradient(x, height/2);
  }
  timer = timer +1;
  if (timer == 120)
  {
    timer = 0;
  }
  print(timer);
}
  void drawGradient(float x, float y)
  {
    if (timer >= 0 && timer <= 60 )
    {
  textFont(chiller);
  textAlign(150, 50);
  text("Against social norm", 10, 160);
    }
    
    if (timer >= 10 && timer <= 60 )
    {
  textFont(chiller);
  textAlign(150, 50);
  text("Nazism", 10, 60);
    }
    
    if (timer >= 15 && timer <= 60 )
    {
  textFont(chiller);
  textAlign(150, 50);
  text("Anarchism", 10, 85);
    }
    
    if (timer >= 20 && timer <= 60 )
    {
  textFont(chiller);
  textAlign(150, 50);
  text("Communism", 10, 110);
    }
    
    if (timer >= 25 && timer <= 60 )
    {
  textFont(chiller);
  textAlign(150, 50);
  text("Racism", 160, 60);
    }
    if (timer >= 30 && timer <= 60 )
    {
  textFont(chiller);
  textAlign(150, 55);
  text("Sexism", 160, 85);
    }
    
    if (timer >= 60)
    {
      filter(INVERT);
      fill(0,255,255);
    }
    if (timer >= 60)
   {
  textFont(chiller);
  textAlign(150, 50);
  text("Against social norm", 10, 60);
  }
    if (timer >= 70 )
    {
  textFont(chiller);
  textAlign(150, 50);
  text("Freedom", 80, 85);
    }
    if (timer >= 75 )
    {
  textFont(chiller);
  textAlign(150, 50);
  text("Expression", 120, 110);
    }
    if (timer >= 80)
    {
      textFont(chiller);
      textAlign(150, 50);
      text("Fun", 40, 110);
    }
   if (timer >= 85 )
    {
  textFont(chiller);
  textAlign(150, 50);
  text("Resonation", 70, 140);
    }
  }




