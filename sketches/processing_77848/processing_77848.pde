
//Por:HERNANDEZ CRUZ YANAHUI
//PACMAN TECNOLOGIA MULTIMEDI
int c=0;
int i=0;
int a=800;
int b=400;
void setup()
{
size(a,b);
smooth();
background(0,0,0);
frameRate(6);
}

void draw()
{
fill(255,255,0);

      if(c==0 )
      { 
        background(0);
        arc(200+i,200,200,200,HALF_PI-QUARTER_PI,TWO_PI-QUARTER_PI);
        c=1;
      }
     else
      {
        background(0); 
        float a=0.16;
        float b=TWO_PI;
        arc(200+i,200,200,200,a,b);
        c=0;
      }

fill(255,0,255);
ellipse(200+i,150,40,60);

fill(0,0,0);
ellipse(204+i,156,20,30);

fill(25,60,200);
ellipse(200+i,100,190,30);
arc(200+i,85,90,90,PI,TWO_PI);

i=i+20;

}
