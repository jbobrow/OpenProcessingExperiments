

int l=500;
int h=500;

int step=1;


int px=l/2;
int py=h/2;
int pxk;
int pyk;
 

void setup()
{ 
  size(l,h);
  stroke(255);
  background(0);
  frameRate(300);
}
void draw()
{

      pxk=px;     
      pyk=py;
      
      if(random(-1,1)>0) px+=step;
      else px+=-step; 

      
      if(random(-1,1)>0) py+=step;
      else py+=-step;
      
      line(pxk,pyk,px,py);
      if((px==1)||(py==h)||(py==0)||(px==0))
      {
        px=l/2;
        py=h/2;
        background(0);
      }
}


