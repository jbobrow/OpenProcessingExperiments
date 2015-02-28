
int[] coordXinvasor={int(random(600)), int(random(600)),
int(random(600)),int(random(600)),int(random(600))};

int[] coordYinvasor={0,0,0,0,0};

int diametroInvasor=10;

PImage img;
PImage a;
PImage b;


//esenario
void setup()
{
  size(600,600);
  //img=loadImage("galaxia.jpg");
}

void draw()
{
  background(0);
  image(img,0,0);
  arma();
  invasores();
  finJuego();
}

//arma
void arma()
{
  fill(0,250,0);
  stroke(color(0,250,0));
  triangle(mouseX-8,580,mouseX,565,mouseX+8,580);
}

//invasores
void invasores()
{
  stroke(225);
  fill(255);
  for(int i=0;i<5;i++)
      ellipse(coordXinvasor[i],coordYinvasor[i]++,diametroInvasor,diametroInvasor);
}

//disparo
void mousePressed()
{
  proyectil(mouseX);
}

void proyectil(int disparoX)
{
  boolean acertar=false;
  for(int i=0;i<5;i++)
  {
    if((disparoX>=(coordXinvasor[i]-diametroInvasor/2)) && 
    (disparoX<=(coordXinvasor[i]+diametroInvasor/2)))
    {
      acertar=true;
      stroke(250,0,0);
      fill(250,0,0);
      line(mouseX,565,mouseX,coordYinvasor[i]);
      ellipse(coordXinvasor[i],coordYinvasor[i],diametroInvasor+25,diametroInvasor+25);
      coordXinvasor[i]=int(random(600));
      coordYinvasor[i]=0;
    }
    if(acertar==false)
    {
      stroke(250,0,0);
      fill(250,0,0);
      line(mouseX,565,mouseX,0);
    }
  }
}

void finJuego()
{
  for(int i=0;i<5;i++)
  {
    if(coordYinvasor[i]==600)
    {
      noLoop();
    }
  }
}
