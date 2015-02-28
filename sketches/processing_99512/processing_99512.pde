
/*
Alexandre Acsensi
Seminari 6
Informàtica

Pilota que segueix el ratolí i es fa més gran a mesura que fas un click a la pantalla
*/

//declarem unes variables de posició
int x,y;
//variable de mida
int mida;
//variables de velocitat
int velx,vely;

void setup()
{
  size(500,500);
  smooth();
  
  //iniciem variables
  x=width/2;
  y=height/2;
  mida=width/10;
  velx=20;
  vely=20;
}

void draw()
{
  dibuixaelfons();
  actualitzar();
  dibuixar();
}

//declarem les funcions

//funció que dibuixa un degradat al fons
void dibuixaelfons()
{
  for(int i=0; i<=height; i++)
  {
    line(0,i,width,i);
    stroke(245+i,123,0);
  }
}

//funció que dibuixa una pilota
void dibuixar()
{
  noStroke();
  fill(0,177,245);
  ellipse(x,y,mida,mida);
}

//funció actualitzar moviment de la bola
void actualitzar()
{
  int disx = mouseX-x;
  int disy = mouseY-y;

  x += disx/velx;
  y += disy/vely;
}

 void mousePressed(){
  if(mida<=width/2)
  {mida+=10;}
  else{mida=width/10;}
  }


