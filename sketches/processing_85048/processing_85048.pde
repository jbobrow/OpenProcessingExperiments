
class Vect
{
    float x;
    float y;

    Vect(float X,float Y)
    {x=X;y=Y;}

    void set(float X,float Y)
        {x=X;y=Y;}
    
    void rotate(float a)
    {
    float xtemp = x*cos(a)-y*sin(a);
    y = x*sin(a)+y*cos(a);
    x = xtemp;
    }

    void add(float X,float Y)
    {x+=X;y+=Y;}
    
    void add(Vect v)
    {x+=v.x;y+=v.y;}
    
    void sub(Vect v)
    {x-=v.x;y-=v.y;}
    
    void arrow()
    {
     line(0,0,x,y);
     line(x+3,y+3,x-3,y-3);
     line(x+3,y-3,x-3,y+3);
    }
    void cross()
    {
    line(x-5,y,x+5,y);
    line(x,y-5,x,y+5);
    }
  
}
//----------------------------------
class Bras
{
    float longueur;
    float angle;
    Vect vect;
    Bras(int l, float a)
    {
        longueur= l;
        angle=a;
        vect=new Vect(l,0);
        vect.rotate(a);
    }
    void display()
    {
    rotate(angle);
    rect(0,0,longueur,5,3);
    translate(longueur,0);
    }
}
Bras [] bras;
Vect [] jacob;
int numBras;
int resol,cibleX,cibleY;
Vect erreur,posBras,posBrasTemp;
//---------------------------------------
void setup() 
{ 
  size(500, 500);
  background(255);
  
  numBras=3;
  cible=new Vect(random(0,400),random(-200,200));
  posBras=new Vect(0,0);
  posBrasTemp=new Vect(0,0);
  erreur=new Vect(0,0);
  
  bras=new Array[numBras];
  jacob=new Array[numBras];
  
  for(int i = 0;i<numBras;i++)
      {
          bras[i]=new Bras(150,0.2);
          erreur.set(0,0);
          for(int j = 0;j<i;j++)
          {bras[i].vect.rotate(bras[j].angle);}
          
          posBras.add(bras[i].vect);
          erreur.add(cible);
          erreur.sub(posBras);
          
          jacob[i]=new Vect(-erreur.x,erreur.y);
      }
      
  resol=3;

}
//----------------------------------
void draw() 
{ 
    translate(15,250);
    //cible
    cible.cross();
    
    //bout du bras
    stroke(255,0,0);
    posBras.cross();
    stroke(0);

    //socle
    line(0,-20,0,20);
    for(int i=0;i<10;i++)
    {   line(0,-20+i*4,-5,-15+i*4);}
    
    //bras
   pushMatrix();
   
for(int i=0;i<numBras;i++)
    {
       bras[i].display();
           }
    popMatrix();
  pushMatrix();
  translate(posBras.x,posBras.y);
  stroke(255,0,0);
  erreur.arrow();
   stroke(0);
  popMatrix();
 //--------------------------------------------------------   


    
    
    
    
}
