
int repeticions;
float midax, miday;
int radi;
int marge=radi;
int estat = 1;

void setup()
{
  size(800,800);
  repeticions =20;
  midax= (width/repeticions)-marge;
  miday=(height/repeticions)-marge;
  radi= 20;
  smooth();
}

void draw(){
  background(0);
  if (estat ==1)
  {
    int numboles = 1;
    for(int j=0; j< height/repeticions; j++)
    { 
      for (int i=0; i< height/repeticions; i++)
      { 
         fill(random(0,255),random(0,255),mouseX+random(0,255));
         polygon(radi+i*midax, radi+j*miday, radi, 8);
      }
      println();  
    }
  }else
  { 
    for(int j=0; j< height/repeticions; j++)
    {       
      for (int i=0; i<=j;i++)
      {
       fill(random(0,255),random(100,200),random(0,200));
       polygon(radi+i*midax,radi+j*miday, radi, 8);}
    }
 }
}

void polygon (float x, float y, float radius, int npoints){
  float angle= TWO_PI / npoints;
  beginShape();
  for (float a=0; a< TWO_PI; a += angle){
    float sx= x+ cos(a) * radius;
    float sy= y+ sin(a) * radius;
    vertex(sx,sy);
}
  endShape(CLOSE);
}



void keyPressed()
{
  if (key == 'j')  estat = 1;
  else            estat = 2;
}
