
int nob= 3;
float [] karlred = new float [nob];
float [] karlgreen = new float[nob];
float [] karlblue = new float [nob];
boolean randombuttons = false;
color[] nbloc = new color [nob];

 

void setup(){
 
  smooth();
  noStroke();
 
  int a=0;

  if (!randombuttons){
    for (int i=0;i<width;i=i+45){
      nbloc[a]=color(45+(i/2),45,255);
      a++;

    }
  }
  size(255,255);

 
}
 
void draw(){
  background(255);
 
  placebuttons();
  nowcolor = get(mouseX,mouseY);
 
 
}
 
void placebuttons()
{
  for (int i=0;i<nob;i++)
  {
    karlred[i]=red(nbloc[i]);
    karlgreen[i]=green(nbloc[i]);
    karlblue[i]=blue(nbloc[i]);
    float x= karlred[i];
    float y  = karlgreen[i];
    float z = karlblue[i];
    fill(x,y,z);
    ellipse(x,y,40,40);
  }
}
boolean mr=false;
boolean mu=true;
 

color nowcolor;
void domove()
{
  if (!mu)
  {
    for (int i=0;i<nob;i++)
    {
      if (nowcolor == nbloc[i])
      {
        nbloc[i]=nowcolor;
      }
    }
  }
}



void mouseDragged()
{
  mu=false;
  mr=false;
  for (int i=0;i<nob;i++)
  {
    if (nowcolor == nbloc[i])
    {
      nowcolor = color(mouseX,mouseY,255);
      nbloc[i]=nowcolor;
    }
  }

}
 
 


