


float x=0;
float y=0;
int pixls;
int shade;
int i = 1;
int alph = 10;
int da = 3;
int shadow = 20;
int ds = 20;

void setup()
{
  size(512,160);
  frameRate(8);
  background(0);
  rectMode(CORNERS);
  noStroke();
  smooth();
  pixls=10;
}

void draw()
{

  pixls=20;
  for(int k=0;k<pixls;k++)
  {
    x=0;
    for(int i=0; i<pixls*2+10; i++)
    {
      shade=int(random(255));
      if(shade<100)
      {
        fill(0);
      }
      else{
        fill(random(255),0,0,alph);
      }
      rect(x,y,x+width/(pixls*2),y+height/pixls);
      x=x+width/(pixls*2);
    }
    y=y+height/pixls;
  }
  x=0;
  y=0;
  alph += da;
  if (alph > 100 || alph < 10) {
    da *= -1;
  }
  noStroke();
  fill(0,0,0,50);
  ellipse(shadow,height/2+random(30)-15,300,300);
  shadow += ds;
  if(shadow > width || shadow < 0) {
    ds *= -1;
  }
  
}

    
    
    

