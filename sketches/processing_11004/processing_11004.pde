
/*******************************************
*    Test Program
*    Kyle Kuepker
*    19 July 2010
*
*    Simple Test Program To Draw Lines with 
*     Mouse
********************************************/

int array_max = 60;
int index_last = 0;
float shrink_index = 1.01;
int mx[] = new int[array_max];
int my[] = new int[array_max];
int mw[] = new int[array_max];
PImage reticle;
PFont fontA;

void setup()
{
  size(400, 400);
  reticle = createImage(11, 11, ARGB);
  formReticleBullseye();
  noCursor();
  smooth();
  noStroke();
  fill(255, 150);

}

void draw()
{
  background(50);
  image(reticle, mouseX-5, mouseY-5);
  
  if(mousePressed)
  {
    mx[index_last] = mouseX;
    my[index_last] = mouseY;
    mw[index_last] = 35;    
    index_last++;
  }
  
  for (int i = 0; i < array_max; i++)
  {
    mw[i] /= shrink_index;
    if(int(mw[i]) < 1)
    {
      stroke(0);
      fill(0);
    }
    else
    {
      noStroke();
      fill(255, 150);
    }
    ellipse(mx[i], my[i], mw[i], mw[i]);
  }
  
  if(index_last == array_max)
  {
    index_last = 0;
  }
}

