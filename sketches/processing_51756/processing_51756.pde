
/*
  Ripples
  Author: Yen-Chia Hsu, CoDe Lab, Carnegie Mellon University, U.S.A.
*/

int bColor = 0; //background color
int screenWL = 600; //screen width and length
int numberR = 17; //number of ripples
int diaIncreaseRate = 2; //diameter increasing rate
int strokeDecreaseRate = 5; //stroke weight decreasing rate
int alphaS = 60;//alpha value of the stroke
Ripple[] ri = new Ripple[numberR];

void setup()
{
  //initialize the screen
  size(600,600);
  background(bColor,bColor,bColor);
  smooth(); 
  noFill();
  //initialize ripples
  for(int i=0; i<numberR; i++)
    ri[i] = new Ripple(int(random(0,800)),int(random(0,800)),int(random(0,800)),0,int(random(0,255)),int(random(0,255)),int(random(0,255)),alphaS);
}

void draw()
{
  //clean screen
  background(bColor,bColor,bColor);
  //ripples
  for(int i=0; i<numberR; i++)
  {
    //reset
    if(ri[i].sw==0)
    {
      ri[i].x = int(random(0,800));
      ri[i].y = int(random(0,800));
      ri[i].sr = int(random(0,255));
      ri[i].sg = int(random(0,255));
      ri[i].sb = int(random(0,255));
      ri[i].sa = alphaS;
      ri[i].d = 0;
      ri[i].sw = int(random(1,100));
    }
    //update
    ri[i].d += diaIncreaseRate; //increase the diameter
    if(ri[i].d%strokeDecreaseRate==0) ri[i].sw--; //decrease the stroke weight
    //render
    strokeWeight(ri[i].sw);
    //fill(255,0);
    stroke(ri[i].sr, ri[i].sg, ri[i].sb, ri[i].sa);
    ellipse(ri[i].x, ri[i].y, ri[i].d, ri[i].d);   
  }  
}

class Ripple
{
  int x,y,d,sw,sr,sg,sb,sa;
  //x: center X coordinate
  //y: center Y coordinate
  //d: diameter
  //sw: stroke weight
  //sr: stroke color R
  //sg: stroke color G
  //sb: stroke color B
  //sa: stroke color alpha
  Ripple (int x_in,int y_in,int d_in,int sw_in,int sr_in,int sg_in,int sb_in,int sa_in)
  { x=x_in; y=y_in; d=d_in; sw=sw_in; sr=sr_in; sg=sg_in; sb=sb_in; sa=sa_in;}
}                                                               
