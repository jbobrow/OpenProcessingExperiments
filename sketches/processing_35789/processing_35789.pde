
void setup()
{
  size(700,400);
  background(0);
  noStroke();
  smooth();
}

float x1,y1,rad1;
int deg = 0;
float x2,y2,rad2;
int deg2 = 0;


void draw()
{

  background(0);
 
  deg=deg+3;
  rad1=(PI/180)*deg;
  x1=sin(rad1)*80+(mouseX); //x1=trigfunction(radians)*xradius+centerxvalue
  y1=cos(rad1)*80+(mouseY);
  
  fill(255,100);
    ellipse(x1,y1,10,10);
    
    
      deg2=deg2-3;
rad2=(PI/180)*deg2;
  x2=sin(rad2)*80+(mouseX); //x1=trigfunction(radians)*xradius+centerxvalue
  y2=cos(rad2)*80+(mouseY);
  
  fill(255,100);
    ellipse(x2,y2,20,20);
}

