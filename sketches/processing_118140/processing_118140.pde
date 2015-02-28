
PImage photo;

void setup()
{
  size(500, 500);
  frameRate(60);
  photo= loadImage("a.png");
}
// variabler

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
float f;
float g;
int points=-1;
int liv= 5;
void draw()
{

  background(0, 0, 0);
  movement();
  bomber();
  bomber();
  bomber();
  tegninger();
  impact();
  stroke(255,255,255);
  fill(255,255,255);
  f=positionX(trekantTopX);
  text("X"+"position"+""+""+f,10,20);
  g=positionY(trekantMidtpunktY);
  text("Y"+"position"+""+""+g,10,40);
  text("Point"+""+""+""+points,10,60);
  stjerner();
  text("Liv"+""+""+liv,10,80);
  gameover();
}


void movement()
{  
  if (keyPressed)
  {
    // bevægelse af rumskib
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
}

void bomber()
{  
  bombeY=bombeY+bombeFart;


  if (bombeY>=500)
  {
    bombeY = 0;
    bombeX = random(500);
    bombeFart = bombeFart = random(10)+1;
    points= points+1;
  }
}


void tegninger()
{
  stroke(255,255,255);
  fill(255,255,255);  
  triangle(trekantVenstreX, trekantVenstreY, trekantHojreX, trekantHojreY, trekantTopX, trekantTopY);
  stroke(255,0,0);
  fill(255,0,0);
  ellipse(bombeX, bombeY, 30, 30);   
}

 void impact()
{
   float afstand1 = sqrt((bombeX-trekantTopX)*(bombeX-trekantTopX)+(bombeY-trekantTopY)*(bombeY-trekantTopY));
  if (afstand1<15)
  {
    image(photo, trekantTopX-131.5, trekantTopY-111);
    points=0;
    liv= liv-1;
  }
  
   float afstand2 = sqrt((bombeX-trekantVenstreX)*(bombeX-trekantVenstreX)+(bombeY-trekantVenstreY)*(bombeY-trekantVenstreY));
  if (afstand2<15)
  {
    image(photo, trekantTopX-131.5, trekantTopY-111);
    points=0;
    liv=liv-1;
  }
  
  float afstand3 = sqrt((bombeX-trekantHojreX)*(bombeX-trekantHojreX)+(bombeY-trekantHojreY)*(bombeY-trekantHojreY));
  if (afstand3<15)
  {
    image(photo, trekantTopX-131.5, trekantTopY-111);
    points=0;
    liv=liv-1;
  }
 }

float positionX( float trekantMidtpunktX)
{
  float positionX=trekantMidtpunktX;
return positionX;
}

float positionY(float trekantMidtpunktY)
{
  float positionY=trekantMidtpunktY;
return positionY;
}


void stjerner()
{
  stroke(255,235,5);
  fill(255,235,5);
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
  point(random(0,500),random(0,500));
}

void gameover()
{
  if (liv<=0)
  {
    noLoop();
  }
}






