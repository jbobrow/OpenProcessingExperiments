
int i, j, posx, posy;
int col=90;
int lin=100;
int mcol=1000;
int mlin=1000;
int nivel=150;
boolean contorno=false;
float[][] mapa=new float[mcol][mlin];
Pilar[][] p=new Pilar[col][lin];

void setup()
{
  size(1000, 700);
  colorMode(HSB, 100);
  for(j=0; j<lin; j=j+1)
  {
    for(i=0; i<col; i=i+1)
    {
      p[i][j]=new Pilar();
    }
  }
  for(j=0; j<mlin; j=j+1)
  {
    for(i=0; i<mcol; i=i+1)
    {
      mapa[i][j]=noise(100+0.03*i, 100+0.03*j);
    }
  }
}

void draw()
{
  background(60, 100, 30);
  fill(0, 100, 100);
  text("x: "+posx, 20, 20);
  text("y: "+posy, 60, 20);
  text("Raise sea level: W", 200, 20);
  text("Lower sea level: S", 350, 20);
  for(j=0; j<lin; j=j+1)
  {
    for(i=0; i<col; i=i+1)
    {
      p[i][j].mover();
    }
  }
}

void keyPressed()
{
  if(keyCode==RIGHT && posx<mcol-col)
  {
    posx=posx+2;
  }
  if(keyCode==LEFT && posx>0)
  {
    posx=posx-2;
  }
  if(keyCode==UP && posy>0)
  {
    posy=posy-2;
  }
  if(keyCode==DOWN && posy<mlin-lin)
  {
    posy=posy+2;
  }
  if(keyCode=='w' || keyCode=='W' && nivel<300)
  {
    nivel=nivel+10;
  }
  if(keyCode=='s' || keyCode=='S' && nivel>0)
  {
    nivel=nivel-10;
  }
}

class Pilar
{
  float x, y, h;
  
  Pilar()
  {
    x=0;
    y=0;
    h=0;
  }
  
  void mover()
  {
    x=width/2-300+8*i-2*j;
    y=height/2-100+5*j;
    h=300*mapa[posx+i][posy+j];
    if(h<nivel)
    {
      h=nivel;
      fill(60, 100, 100);
    }
    else
    {
      fill(30, 100, h/3);
    }
    noStroke();
    beginShape();
    vertex(x-1, y-h);
    vertex(x+1, y-h-5);
    vertex(x+10, y-h-5);
    vertex(x+8, y-h);
    endShape(CLOSE);
  }
}
