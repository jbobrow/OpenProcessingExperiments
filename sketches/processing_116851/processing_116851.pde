
PImage photo;

void setup()
{
size(500, 500);
frameRate(60);
photo= loadImage("a.png");
}
// variabler
boolean start = true;
float bombeX = 230;
float bombeY = 500;
float trekantVenstreX = 230;
float trekantVenstreY = 499;
float trekantHojreX = 270;
float trekantHojreY = 499;
float trekantTopX = 250;
float trekantTopY = 469;
float trekantFart = 5;
float trekantMidtpunktX = trekantTopX;
float trekantMidtpunktY = trekantTopY-20;
float afstand = 0; // afstand mellem trekantTop og bombe 
float bombeFart = 0;
void draw()
{

  background(0, 0, 0);
  if (keyPressed)
  {
    if (keyCode==RIGHT)
    {
      trekantVenstreX = trekantVenstreX+trekantFart;
      trekantHojreX = trekantHojreX+trekantFart ;
      trekantTopX = trekantTopX+trekantFart;
    }
    if (keyCode==LEFT)
    {
      trekantVenstreX = trekantVenstreX-trekantFart;
      trekantHojreX = trekantHojreX-trekantFart ;
      trekantTopX = trekantTopX-trekantFart;
    }
  }


  bombeY=bombeY+bombeFart;


  if (bombeY>=500)
  {
    bombeY = 0;
    bombeX = random(500);
    bombeFart = bombeFart = random(10)+1;
    
  }

  ellipse(bombeX, bombeY, 30, 30);
  triangle(trekantVenstreX, trekantVenstreY, trekantHojreX, trekantHojreY, trekantTopX, trekantTopY);



afstand = sqrt((bombeX-trekantTopX)*(bombeX-trekantTopX)+(bombeY-trekantTopY)*(bombeY-trekantTopY));
if (afstand<15)
{
  image(photo,trekantTopX-131.5,trekantTopY-111);
  noLoop();
}
}
void mousePressed()
{
  exit(); 
}


