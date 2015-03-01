
int modus = 0;
float counter = 0;
PImage fahrrad;
PImage lampe;

void setup()
{
  
  size(600,400);
  fahrrad = loadImage("fahrrad.jpg");
  lampe = loadImage("lampe_alpha.png");
  
}
void draw()
{
  noTint();
  background(0);
  
  image (fahrrad,0,0); 
  
  if( modus == 1)
{
  image (lampe,0,0);
  }
 else if (modus == 2)
  {
    tint(random(255),random(255), random(255));
   image(fahrrad, 0, 0);
    tint(random(255), random(255), random(255));
    image(lampe, 0, 0);
  }

}

void mousePressed()
{
 
  if (modus == 0)
  {
    modus = 1;
  } else if (modus == 1)
  {
    modus = 2;
  }
 
  
  
}



