
void setup()
{
  size(600,600);
  b = loadImage("galaxia.jpg");
}
void draw()
{
  
   
  background(0);
  image(b,0,0);
  //background(0);
  arma();
  invasores();
  finjuego();
}

//arreglos
 int[] coordenadasXinvasor={int(random(600)), int(random(600)),int(random(600)),
 int(random(600)),int(random(600))};
 int[]coordenadasYinvasor={0,0,0,0,0};
 
 PImage b,n,o;
 
 
 int diametroInvasor=10;
//invasores
void invasores()
{
  stroke(255);
  fill(255);
  for(int i=0;i<5;i++)
  {
   ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,
   diametroInvasor,diametroInvasor);
  }
  
}

//disparo(clic mause)
void mousePressed()
{
 proyectil(mouseX);//tomamos la posicion x del disparo(de mause)
}


//proyectil
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
}//es.surveymonkey.com/s/WP8J8RJ

//arma
void arma(){
  n = loadImage("nav.png");
  image(n,mouseX,mouseY);
  //stroke(color(0,255,0));
  //image(mouseX-8,580,mouseX,565,mouseX+8,580);
}

void finjuego()
{
  for(int i=0;i<5;i++)
  {
    if(coordenadasYinvasor[i]==600)
    {
      noLoop();
    }
  }
}

