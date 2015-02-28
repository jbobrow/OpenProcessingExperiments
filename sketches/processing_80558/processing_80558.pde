
void setup()
{
  size(600,600);
  b = loadImage("fondo.png");
}
void draw()
{
  
   
  background(0);
  image(b,0,0);
  
  arma();
  invasores();
  FinJuego();
}
//arreglos
 int[] coordenadasXinvasor={int(random(600)), int(random(600)),int(random(600)),
 int(random(600)),int(random(600))};
 int[]coordenadasYinvasor={0,0,0,0,0};
 
 PImage b,n,o;
 
 
 int diametroInvasor=10;

void invasores()
{
  stroke(255,255,0);
  fill(255,255,0);
  for(int i=0;i<5;i++)
  {
   ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,
   diametroInvasor,diametroInvasor);
  }
  
}


void mousePressed()
{
 proyectil(mouseX);
}



void proyectil(int disparoX)
{
  boolean acertar = false;
    for(int i=0;i<5;i++)
    {
      if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2))
      && (disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2)))
      {
        acertar=true;
        line(mouseX,565,mouseX,coordenadasYinvasor[i]);
      
        ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i],
        diametroInvasor+25,diametroInvasor+25);//explota
        
        coordenadasXinvasor[i]=int(random(600));
        
        coordenadasYinvasor[i]=0;
    }
    }
      if(acertar==false)
      {
        line(mouseX,565,mouseX,0);
      }
}
void arma(){
  n = loadImage("nave.png");
  image(n,mouseX,mouseY);
}

void FinJuego(){
  int perdidos=0;
  for(int i=0 ; i<5 ; i++){
    if(coordenadasYinvasor[i]>600){
      perdidos++;
    }
  }
  if(perdidos==5){
    noLoop();
    text("Fin Del Juego",250,250);
  }
}

