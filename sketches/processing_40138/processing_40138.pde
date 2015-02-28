
//note: textWidth function returns float width of any character/string
String Jill = "Jill";
PFont hillFont;
PFont JackFont;
PFont JillFont;
PFont waterFont;
PFont collideFont;
PFont crownFont;
int animFrames;
int JackX = 0; int JackY = 0;
int JillX = 0; int JillY=0;
float JackWidth = 44;
float JillWidth = 28;
float hillWidth = 52;
boolean Jackcollide = false;
boolean Jillcollide = false;
float JillTumbleAngle = 0;
boolean broken =false;
void setup()
{
  size(700,300);
  hillFont = loadFont("Hill-24.vlw");
  JackFont = loadFont("Jack-20.vlw");
  JillFont = loadFont("Jill-24.vlw");
  waterFont = loadFont("water-14.vlw");
  collideFont = loadFont("Impact-20.vlw");
  crownFont = loadFont("crown-24.vlw");
  smooth();
  goToFirstKey();
}

void draw()
{
  fill(0,0,0,10);
  rect(0,0,width,height);
  drawHill(100);
  pailOfWater();
  
  //Jack and Jill go up the hill to fetch a pail of water
  if (animFrames < 250)
  {
    drawJack(JackX,JackY);
    drawJill(JillX, JillY);
    if (animFrames % 25 == 0 && animFrames < 125)
    {
      JackY -= 24;
      if (animFrames < 100)
        {JackX+=hillWidth;}
      else if (animFrames == 100)
        {JackX+=JackWidth;}
    }
    if (animFrames % 50 == 0 && animFrames < 250)
    {
      JillX -= hillWidth + 10;
      JillY -= 24;
      if(animFrames == 200)
      {
        Jackcollide = true;
        Jillcollide = true;
        JillX += JillWidth+10/2;
      }
    }
    if (animFrames > 100)
    {
      drawCrown(JackX, JackY-20);
    }
  }
  //Jack fell down
  if (animFrames > 250 && animFrames < 325)
  {
    Jillcollide = false;
    drawJack(JackX,JackY);
    drawJill(JillX, JillY);
    JackY+=2;
    drawCrown(JackX, JackY-20);
  } 
  //and broke his crown
  if (animFrames > 325 && animFrames < 375)
  {
    drawJack(JackX, JackY);
    drawJill(JillX, JillY);
    broken = true;
    drawCrown(JackX, height-5);
  }
  //and Jill came tumbling after
  if (animFrames > 375 && animFrames < 625)
  {
    if (animFrames % 25 == 0)
    {
      JillTumbleAngle += 25;
      JillY +=24;
    }
    pushMatrix();
    translate(JillX, JillY);
    rotate(JillTumbleAngle);
    translate(-JillX, -JillY);
    drawJill(JillX, JillY);
    popMatrix(); 
  }
  animFrames++;
  if (animFrames > 650)
  {
    goToFirstKey();
  }
}

void drawHill(float x)
{
  fill(0,150,0);
  textFont(hillFont);
  String hill0 = "hill hill hill hill hill hill hill hill hill";//9
  String hill1 = "hill hill hill hill hill hill hill";//7
  String hill2 = "hill hill hill hill hill";//5
  String hill3 = "hill hill hill"; //3
  String hill4 = "hill";//1
  float offset = 10;
  float fontsize = 24;
  //hillWidth = textWidth(hill4);
  text(hill0,x,height-offset);
  text(hill1, x+hillWidth, height-(offset+fontsize));
  text(hill2, x+hillWidth*2, height-(offset+fontsize*2));
  text(hill3, x+hillWidth*3, height-(offset+fontsize*3));
  text(hill4, x+hillWidth*4, height-(offset+fontsize*4));
  //println(hillWidth);
}

void drawJack(float x, float y)
{
  if (Jackcollide == false)
  {
    fill(250,231,192);
    textFont(JackFont);
  }
  else
  {
    fill(255,0,0);
    textFont(collideFont);
  }
  String Jack = "Jack";
  text(Jack,x,y);

  //println(textWidth(Jack));
}
void drawCrown(float x, float y)
{
  String crown = "crown";
  fill(255,255,0);
  textFont(crownFont);
  if (broken == false)
    {text(crown,x,y);}
  else
  {
    String piece1 = "cr";
    String piece2 = "o";
    String piece3 = "wn";
    
    pushMatrix();
    translate(x-25,y-15);
    rotate(radians(60));
    translate(-x,-y);
    text(piece1, x, y);
    popMatrix();
    
    text(piece2, x, y);
    
    pushMatrix();
    translate(x+25,y);
    rotate(radians(-30));
    translate(-x,-y);
    text(piece3, x, y);
    popMatrix();
  }
}
void drawJill(float x, float y)
{
  if (Jillcollide == false)
  {
    fill(250,231,192);
    textFont(JillFont);
  }
  else
  {
    fill(255,0,0);
    textFont(collideFont);
  }
  String Jill = "Jill";
  text(Jill,x,y);
  //println(textWidth(Jill));
}
void pailOfWater()
{
  String pail = "pail";
  String of = "of";
  String water = "water";
  fill(0,0,255);
  textFont(waterFont);
  text(pail, width/2-25, 130);
  text(of, width/2-25+textWidth(of)/2, 150);
  text(water, width/2-30, 170);
}
void goToFirstKey()
{
  background(0);
  animFrames = 0;
  Jillcollide = false;
  Jackcollide = false;
  JackX = 50; JackY=height-10;
  JillX = width-80; JillY = height-10;
  JillTumbleAngle = 0;
  broken = false;
}

